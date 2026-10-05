---
name: cqrs-mediatr
description: Use when creating or modifying Project B MediatR commands, queries, handlers, request models, pipeline behaviors, or CQRS flows.
---

# CQRS + MediatR

## Commands

- Use a command for a state-changing operation.
- Keep the command handler focused on one use case.
- Make side effects explicit and avoid hidden writes in shared query helpers.

## Queries

- Use a query for retrieval only.
- Project only the data needed by the caller where the persistence technology allows it.

## Handlers

- Delegate external system access to established abstractions/adapters rather than calling SharePoint or other infrastructure directly when the architecture separates them.
- Keep mapping and orchestration readable.
- Preserve cancellation tokens.

Before creating a new command/query, search for an existing use-case pattern and follow it.
