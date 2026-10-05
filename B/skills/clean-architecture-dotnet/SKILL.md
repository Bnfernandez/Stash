---
name: clean-architecture-dotnet
description: Use when changing Project B .NET layers, dependencies, application/domain/infrastructure boundaries, dependency injection, or backend structure.
---

# Clean architecture

- Determine which layer owns the rule before adding code.
- Keep domain/application concerns independent from infrastructure concerns.
- Infrastructure implements abstractions defined inward when the current architecture follows that direction.
- Avoid placing business rules in controllers, API endpoints, SharePoint adapters, or framework-specific classes.
- Keep dependency-injection registration close to the composition root and follow existing extension-method patterns.
- Do not introduce an abstraction without a concrete reason such as a boundary, testability, or replaceable integration.
- Avoid large reorganizations during feature work.
