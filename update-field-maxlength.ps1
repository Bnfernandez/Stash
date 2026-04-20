# =========================
# UPDATE FIELD MAX LENGTH IN CONTENT TYPE
# =========================

# Configuration
$contentTypeName = "ContentType1"  # Change this to your content type name
$fieldInternalName = "CodeProjet"  # Change this to your field name
$newMaxLength = 15

try {
    Write-Host "Récupération du Content Type : $contentTypeName" -ForegroundColor Cyan
    
    $ct = Get-PnPContentType -Identity $contentTypeName -ErrorAction Stop
    
    Write-Host "Chargement des champs du CT..." -ForegroundColor Cyan
    
    $ctx = Get-PnPContext
    $ctx.Load($ct.Fields)
    Invoke-PnPQuery
    
    $field = $ct.Fields | Where-Object { $_.InternalName -eq $fieldInternalName }
    
    if (-not $field) {
        throw "Champ $fieldInternalName non trouvé dans le CT $contentTypeName"
    }
    
    Write-Host "Modification du MaxLength à $newMaxLength..." -ForegroundColor Cyan
    
    $ctx.Load($field)
    Invoke-PnPQuery
    
    # Modifier le XML du schéma
    $xml = [xml]$field.SchemaXml
    $xml.Field.SetAttribute("MaxLength", $newMaxLength)
    $field.SchemaXml = $xml.OuterXml
    $field.Update()
    Invoke-PnPQuery
    
    Write-Host "Propagation du Content Type..." -ForegroundColor Cyan
    
    $ctx.Load($ct)
    Invoke-PnPQuery
    $ct.Update($true)
    Invoke-PnPQuery
    
    Write-Host "✔ MaxLength modifié et propagé avec succès à $newMaxLength" -ForegroundColor Green
}

catch {
    Write-Host "❌ Erreur : $_" -ForegroundColor Red
    throw
}
