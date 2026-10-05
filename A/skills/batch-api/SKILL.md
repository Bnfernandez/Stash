---
name: batch-api
description: Use when changing Project A's .NET API that executes partner data transfers, batch processing, or database modification jobs.
---

# Batch API

Treat batch operations as potentially irreversible and integration-sensitive.

- Identify the input, side effects, target systems, and expected idempotency before editing.
- Keep partner calls and database mutations observable through the existing logging conventions.
- Consider retries, duplicate execution, partial completion, timeout, cancellation, and failure recovery.
- Do not introduce unbounded parallelism for external calls or database operations. Respect existing provider limits and repository conventions.
- Preserve existing scheduling/triggering contracts and response semantics.
- For destructive or mass-update operations, inspect safeguards and add confirmation/guardrails only when consistent with the existing product design.

Tests should prove the important side-effect decisions without calling real partner systems.
