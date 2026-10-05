---
name: change-safety
description: Use when modifying existing production code where regressions, compatibility, contracts, persisted data, authentication, or integration behavior must be protected.
---

# Change safety

Apply this skill when the task touches existing behavior or a compatibility-sensitive surface.

## Workflow

1. Identify the current behavior and the requested behavior.
2. Inspect callers, consumers, tests, configuration, and integration boundaries before editing.
3. Prefer a minimal change over a structural rewrite.
4. Preserve public contracts unless the request explicitly changes them.
5. Check null/error/timeout/retry behavior and backward compatibility.
6. Add or update focused tests for the changed behavior.
7. Run the narrowest relevant verification and report what was actually verified.

## Red flags

Stop and inspect further before changing: database schemas, serialization contracts, auth flows, external API payloads, SharePoint contracts, persisted identifiers, cache semantics, generated documents, and batch processing.

Do not perform opportunistic refactoring in the same change.
