---
name: identity-cache-docusign
description: Use when changing Project A authentication with ASP.NET Identity, in-memory user/session-related caching, or the DocuSign gateway signature flow.
---

# Identity, cache, and electronic signature

## Identity

- Preserve the existing username/password Identity flow, cookie/session behavior, authorization checks, and login/logout semantics.
- Do not weaken password, lockout, session, anti-forgery, or authorization behavior to simplify a change.

## In-memory cache

- Current user-related cached data is in memory and the application runs as one pod.
- Preserve current expiration, invalidation, and key semantics unless explicitly requested.
- Do not assume cache state survives restart.

## DocuSign

- Treat the in-house signature gateway as the integration boundary.
- Inspect request/response models, status transitions, callbacks/webhooks, and error handling before changing the flow.
- Preserve correlation between the business contract and signature envelope/document identifiers.
- Consider duplicate callbacks, retries, and partially completed signature flows.
