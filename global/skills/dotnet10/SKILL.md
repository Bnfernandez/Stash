---
name: dotnet10
description: Use for ASP.NET Core or other .NET 10 changes, especially dependency injection, configuration, async code, HTTP integrations, logging, and framework conventions.
---

# .NET 10

## Guidance

- Match the repository's existing project structure and framework conventions.
- Use built-in .NET capabilities before introducing new libraries.
- Respect nullable reference types and existing analyzer rules.
- Prefer async all the way for I/O-bound operations; do not introduce blocking waits such as `Result` or `Wait()` in request paths.
- Keep dependency injection composition explicit and consistent with the project.
- Do not introduce global mutable state.
- Preserve cancellation support at I/O boundaries when the surrounding code supports it.
- Keep configuration externalized and avoid hard-coded environment-specific values.

## Verification

- Build the affected solution/project.
- Run focused tests for changed behavior.
- If an analyzer or formatter is part of the repository's normal CI, use it rather than inventing a new local standard.
