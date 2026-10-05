# Project B — financial workflow portal

## System overview

This repository contains a React front end, a .NET 10 BFF, and a .NET 10 API. The backend follows CQRS with MediatR, commands/queries, structured logging, dependency injection, clean code, clean architecture, unit tests with mocks, FluentValidation, and ProblemDetails.

The API connects to SharePoint Online through CSOM to retrieve SharePoint list items. The API provides that data to the BFF, and the BFF serves it to the React portal. SharePoint list content is modified by Power Automate flows connected to SharePoint.

Authentication uses a house SSO based on OAuth/OIDC authorization code with PKCE.

The application tracks financial workflows between different parties.

## Architecture rules

- Keep boundaries explicit: React -> BFF -> API -> external systems/data sources.
- Do not have the React application call SharePoint directly.
- Do not bypass the BFF/API boundary to solve a frontend concern.
- Keep business logic out of controllers/endpoints and React components when it belongs in the application/domain layers.
- Preserve CQRS separation: commands represent state changes; queries retrieve data. Do not introduce write side effects into queries.
- Follow the existing clean-architecture dependency direction. Outer layers depend inward, not the reverse.
- Use dependency injection rather than service locators or static globals.

## API conventions

- Validate request/input models with FluentValidation at the established pipeline/boundary.
- Use ProblemDetails for API errors and preserve established status-code/error-shape conventions.
- Use structured logs with useful identifiers and properties, not string-concatenated pseudo-structured messages.
- Preserve cancellation and async flow for I/O.
- Do not leak secrets or sensitive business data into logs or error payloads.

## SharePoint

- SharePoint Online is an external system and list content is managed by Power Automate.
- Inspect the existing CSOM query/list mapping before changing it.
- Do not silently write to SharePoint from the API when the current design is read-oriented.
- Treat list names, internal field names, types, and filtering behavior as external contracts.

## Authentication

- Preserve the house SSO authorization-code + PKCE flow.
- Do not weaken redirect URI validation, state/nonce/PKCE handling, token validation, or authorization checks.
- Keep tokens server-side where the current architecture does so; do not move authentication responsibilities into React without an explicit architecture decision.

## Frontend

- Follow the existing React composition, state-management, routing, API-client, and styling patterns.
- Keep BFF contract types and frontend usage aligned.
- Avoid embedding backend/business rules in UI components when the rule belongs server-side.

## Verification

For backend changes: focused unit tests, build, and relevant integration tests where available. For frontend changes: typecheck/lint/tests and the narrowest build verification available.
