---
name: api-validation-problemdetails
description: Use when changing Project B API input validation, FluentValidation rules, HTTP status codes, or ProblemDetails error responses.
---

# Validation + ProblemDetails

- Place validation rules in the established FluentValidation layer rather than duplicating them in controllers/handlers.
- Distinguish syntactic/request validation from business invariants.
- Preserve existing ProblemDetails shape, error codes, extensions, and status-code conventions.
- Do not return stack traces, internal exception messages, tokens, or sensitive data to clients.
- Validate at the earliest appropriate boundary while preserving domain-level invariants.
- Test invalid input, boundary values, and the resulting HTTP/error contract.
