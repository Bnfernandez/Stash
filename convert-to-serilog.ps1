#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Converts ILogger calls to Serilog structured logging in a .NET solution.

.DESCRIPTION
    This script scans a .NET solution for existing ILogger calls and converts them to Serilog,
    with intelligent context-based log level inference.

.PARAMETER SolutionPath
    Path to the .NET solution directory. Defaults to current directory.

.PARAMETER DryRun
    If $true, shows what would be changed without actually modifying files.

.EXAMPLE
    .\convert-to-serilog.ps1 -SolutionPath "C:\MyProject"
    .\convert-to-serilog.ps1 -DryRun $true
    .\convert-to-serilog.ps1
#>

param(
    [string]$SolutionPath = ".",
    [bool]$DryRun = $false
)

# Initialize counters
$script:filesModified = 0
$script:replacementsCount = 0
$script:filesProcessed = 0

# Serilog mapping for ILogger methods
$logLevelMap = @{
    'LogInformation' = 'Information'
    'LogWarning'     = 'Warning'
    'LogError'       = 'Error'
    'LogCritical'    = 'Fatal'
    'LogDebug'       = 'Debug'
    'LogTrace'       = 'Verbose'
}

# Keywords that suggest error context
$errorKeywords = @('error', 'fail', 'exception', 'invalid', 'denied', 'unauthorized', 'timeout', 'failed', 'invalid', 'critical')
$warningKeywords = @('warn', 'warning', 'deprecated', 'suspicious', 'unusual')
$infoKeywords = @('success', 'completed', 'started', 'finished', 'successful')

function Infer-LogLevel {
    param([string]$Message)
    
    $lowerMsg = $Message.ToLower()
    
    # Check for error patterns
    foreach ($keyword in $errorKeywords) {
        if ($lowerMsg -match "\b$keyword\b") {
            return 'Error'
        }
    }
    
    # Check for warning patterns
    foreach ($keyword in $warningKeywords) {
        if ($lowerMsg -match "\b$keyword\b") {
            return 'Warning'
        }
    }
    
    # Check for info patterns
    foreach ($keyword in $infoKeywords) {
        if ($lowerMsg -match "\b$keyword\b") {
            return 'Information'
        }
    }
    
    # Default to Information
    return 'Information'
}

function Convert-StringInterpolationToStructured {
    param([string]$LogMessage)
    
    # Match $"..." pattern (string interpolation)
    if ($LogMessage -match '\$"([^"]*(\{[^}]+\}[^"]*)*)"(.*)') {
        $interpolatedString = $matches[1]
        $remainder = $matches[3]
        
        # Extract variables from {...}
        $variables = @()
        $formatString = $interpolatedString
        
        # Find all {variableName} patterns and extract variables
        $pattern = '\{([^}:]+)(?::[^}]*)?\}'
        $matches_var = [regex]::Matches($interpolatedString, $pattern)
        
        foreach ($match in $matches_var) {
            $varName = $match.Groups[1].Value.Trim()
            $variables += $varName
            
            # Capitalize property name for structured logging convention
            $capitalizedName = [char]::ToUpper($varName[0]) + $varName.Substring(1)
            $formatString = $formatString -replace "\{$varName(?::[^}]*)?\}", "{$capitalizedName}"
        }
        
        # Build the structured log call
        if ($variables.Count -gt 0) {
            $varList = $variables -join ", "
            return @{
                Format = "`"$formatString`""
                Variables = $varList
                Changed = $true
            }
        }
    }
    
    # If not an interpolated string, check if it already looks structured
    # (has {Property} placeholders with variables after)
    return @{
        Format = $LogMessage
        Variables = ""
        Changed = $false
    }
}

function Convert-ILoggerToSerilog {
    param(
        [string]$Content,
        [string]$FilePath
    )
    
    $originalContent = $Content
    $replacementCount = 0
    
    # Pattern to match _logger.LogXXX(...) calls with their complete arguments
    # This is complex because we need to handle multi-line calls and string interpolations
    
    # First pass: Convert interpolated strings to structured format
    # Pattern: _logger.LogLevel($"string with {vars}", otherargs)
    $logCallPattern = '_logger\.Log(Information|Warning|Error|Critical|Debug|Trace)\s*\(\s*\$"([^"]*)"\s*(?:,\s*(.+?))?\s*\)'
    
    $modifiedContent = $Content
    
    # Replace string interpolations in logger calls
    $matches_logs = [regex]::Matches($Content, $logCallPattern)
    
    foreach ($match in $matches_logs) {
        $logLevel = $match.Groups[1].Value
        $targetLevel = $logLevelMap[$("Log$logLevel")]
        $interpolatedStr = $match.Groups[2].Value
        $otherArgs = $match.Groups[3].Value
        
        # Extract variables from {name} patterns
        $variables = @()
        $formatString = $interpolatedStr
        
        $varPattern = '\{([^}:]+)(?::[^}]*)?\}'
        $varMatches = [regex]::Matches($interpolatedStr, $varPattern)
        
        foreach ($varMatch in $varMatches) {
            $varName = $varMatch.Groups[1].Value.Trim()
            if ($varName -and -not ($variables -contains $varName)) {
                $variables += $varName
            }
            
            # Capitalize property name for structured logging convention
            $capitalizedName = [char]::ToUpper($varName[0]) + $varName.Substring(1)
            $formatString = $formatString -replace "\{$varName(?::[^}]*)?\}", "{$capitalizedName}"
        }
        
        # Build new structured log call
        if ($variables.Count -gt 0) {
            $varList = $variables -join ", "
            $oldCall = $match.Value
            $newCall = "_logger.$targetLevel(`"$formatString`", $varList)"
            
            $modifiedContent = $modifiedContent.Replace($oldCall, $newCall)
            $replacementCount++
        }
    }
    
    # Second pass: Convert _logger.LogLevel calls that weren't interpolated
    $simpleLogPattern = '_logger\.Log(Information|Warning|Error|Critical|Debug|Trace)\s*\('
    
    # Replace method names for non-interpolated logs
    foreach ($level in $logLevelMap.Keys) {
        $target = $logLevelMap[$level]
        $modifiedContent = $modifiedContent -replace "_logger\.$level\(", "_logger.$target("
    }
    
    return @{
        Content = $modifiedContent
        ReplacementCount = $replacementCount
        Changed = $modifiedContent -ne $originalContent
    }
}

function Process-CsharpFile {
    param(
        [string]$FilePath
    )
    
    Write-Host "Processing: $FilePath"
    
    try {
        $content = Get-Content -Path $FilePath -Encoding UTF8 -Raw
        
        $result = Convert-ILoggerToSerilog -Content $content -FilePath $FilePath
        
        if ($result.Changed) {
            if ($DryRun) {
                Write-Host "  [DRY RUN] Would apply $($result.ReplacementCount) replacement(s)" -ForegroundColor Cyan
                return @{ Changed = $true; Count = $result.ReplacementCount }
            }
            
            # Write modified content
            Set-Content -Path $FilePath -Value $result.Content -Encoding UTF8 -NoNewline
            Write-Host "  ✓ Applied $($result.ReplacementCount) replacement(s)" -ForegroundColor Green
            
            $script:filesModified++
            $script:replacementsCount += $result.ReplacementCount
            
            return @{ Changed = $true; Count = $result.ReplacementCount }
        }
        
        return @{ Changed = $false; Count = 0 }
    }
    catch {
        Write-Host "  ✗ Error processing file: $_" -ForegroundColor Red
        return @{ Changed = $false; Count = 0; Error = $true }
    }
}

function Find-Projects {
    param([string]$Path)
    
    Write-Host "`n[1/3] Scanning for .NET projects..." -ForegroundColor Cyan
    
    $projects = @()
    
    # Find all .csproj files
    $csprojFiles = Get-ChildItem -Path $Path -Filter "*.csproj" -Recurse
    
    foreach ($csproj in $csprojFiles) {
        $projects += @{
            Path = $csproj.FullName
            Directory = $csproj.Directory.FullName
        }
    }
    
    Write-Host "  Found $($projects.Count) project(s)" -ForegroundColor Green
    
    return $projects
}

function Find-CsharpFiles {
    param([string]$ProjectDirectory)
    
    # Find all .cs files in the project directory
    $files = Get-ChildItem -Path $ProjectDirectory -Filter "*.cs" -Recurse -Exclude "*.designer.cs", "*.g.cs"
    
    return $files
}

function Main {
    Write-Host "╔════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║  Serilog Structured Logging Converter for .NET 8   ║" -ForegroundColor Cyan
    Write-Host "╚════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    
    if ($DryRun) {
        Write-Host "`n[DRY RUN MODE] - No files will be modified`n" -ForegroundColor Yellow
    }
    
    # Resolve solution path
    $resolvedPath = Resolve-Path -Path $SolutionPath
    if (-not $resolvedPath) {
        Write-Host "Error: Solution path not found: $SolutionPath" -ForegroundColor Red
        exit 1
    }
    
    Write-Host "Solution Path: $resolvedPath`n"
    
    # Find all projects
    $projects = Find-Projects -Path $resolvedPath
    
    if ($projects.Count -eq 0) {
        Write-Host "No .NET projects found in the specified path." -ForegroundColor Yellow
        exit 0
    }
    
    # Process each project
    Write-Host "`n[2/3] Scanning for ILogger calls..." -ForegroundColor Cyan
    
    foreach ($project in $projects) {
        $projectName = Split-Path -Path $project.Path -Leaf
        Write-Host "`n  Project: $projectName"
        
        # Find C# files in project
        $csFiles = @(Find-CsharpFiles -ProjectDirectory $project.Directory)
        
        if ($csFiles.Count -eq 0) {
            Write-Host "    No C# files found" -ForegroundColor Gray
            continue
        }
        
        Write-Host "    Found $($csFiles.Count) C# file(s)" -ForegroundColor Gray
        
        # Process each C# file
        foreach ($csFile in $csFiles) {
            $script:filesProcessed++
            $result = Process-CsharpFile -FilePath $csFile.FullName
        }
    }
    
    # Summary
    Write-Host "`n[3/3] Summary" -ForegroundColor Cyan
    Write-Host "════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host "  Files processed:    $script:filesProcessed"
    Write-Host "  Files modified:     $script:filesModified" -ForegroundColor Green
    Write-Host "  Total replacements: $script:replacementsCount" -ForegroundColor Green
    
    if ($DryRun) {
        Write-Host "`n  Run without -DryRun to apply changes" -ForegroundColor Yellow
    }
}

# Run main script
Main
