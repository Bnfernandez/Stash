---
name: testing
description: Use when adding or modifying automated tests, or when a code change needs focused regression coverage.
---

# Testing

## Principles

- Test observable behavior rather than implementation details where practical.
- Follow the repository's existing test framework, naming, fixture, mocking, and assertion style.
- Keep tests deterministic and independent.
- Mock external systems at the established boundary; do not mock simple in-process value objects or pure functions unnecessarily.
- Cover important success, validation, not-found, unauthorized/forbidden, exception, timeout, and edge cases relevant to the change.
- Do not weaken assertions merely to make a failing test pass. Investigate the behavior first.

## Workflow

1. Find nearby tests and copy the established structure.
2. Add the smallest focused regression test that proves the change.
3. Run the focused test set.
4. Run broader tests when practical.
