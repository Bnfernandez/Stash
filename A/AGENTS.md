# Project A — application d'épargne salariale

## System overview

This repository contains a mature ASP.NET MVC/Razor monolith on .NET 10 with EF Core and SQL Server, plus a .NET API used to execute batch-like processing such as sending data to partners or modifying database data. The web application is business-critical and must be changed cautiously.

The business domain includes employee savings products for TPEs, including subscription and contract changes for PEE/PERECO, payments, and migration mechanisms from older offers. Electronic signature is integrated through DocuSign via an in-house gateway API. Authentication is username/password through ASP.NET Identity. User-related data is held in in-memory cache and the deployment is one pod.

## Non-negotiable rules

- Treat the web application as a compatibility-sensitive monolith. Avoid breaking changes and large refactors unless explicitly requested.
- Before modifying existing flows, trace the complete call path and inspect related views, controllers, services, models, EF mappings, configuration, and tests.
- Preserve existing URLs, form fields, model binding, serialized values, database behavior, and integration payloads unless the task explicitly requires a contract change.
- Be especially careful with authentication, authorization, contract/subscription data, payments, migrations, electronic signatures, and batch processing.
- Do not assume business terminology from names alone. Inspect existing rules and nearby implementations.
- Do not move user state from the current in-memory cache to another cache/store as part of an unrelated task.
- The one-pod deployment is relevant to current cache semantics; do not silently make the application multi-pod-safe by changing semantics unless requested.
- Do not modify production data through scripts or migration changes without explicit instructions.

## Web application

- Follow existing ASP.NET MVC + Razor conventions.
- The front end uses DevExtreme JavaScript for UI components. Prefer existing DevExtreme components and project patterns over custom widgets or another UI library.
- When changing UI, preserve Razor model binding, field names/IDs, validation, and existing DevExtreme initialization/data-source conventions.
- Prefer existing controller/service/view-model patterns over introducing new architectural layers.
- Keep Razor changes focused; avoid changing generated markup or field names without understanding consumers.
- Treat validation and model binding as part of the external behavior.

## Database

- SQL Server + EF Core are the persistence stack.
- Inspect existing migrations and EF mappings before changing entities or relationships.
- Consider existing production data and backward compatibility for schema changes.
- Do not casually rename columns, tables, enum values, or persisted identifiers.

## Integrations

- DocuSign is reached through the in-house gateway API; do not bypass that boundary unless explicitly requested.
- External partner integrations in the batch API are contract-sensitive. Preserve payload shape and failure semantics unless the task changes them.

## Verification

For risky changes, verify progressively: focused tests, build, then broader tests as practical. Explicitly call out anything that could not be exercised locally.
