---
name: code-review
description: Use for reviewing changes for correctness, regressions, security, maintainability, compatibility, and missing tests without changing unrelated code.
---

# Code review

Review in this order:

1. Functional correctness and regressions.
2. Contract, data, authentication, and authorization risks.
3. Error handling, concurrency, performance, and resource usage.
4. Test coverage for changed behavior.
5. Maintainability and consistency with existing architecture.

Prefer concrete findings with file/line references and explain the failure mode. Distinguish confirmed issues from suggestions.
Do not turn stylistic preferences into blockers unless the repository has an explicit convention.
