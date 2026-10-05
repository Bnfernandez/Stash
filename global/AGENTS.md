# Global OpenCode instructions

These rules apply to all projects unless a closer project `AGENTS.md` provides more specific guidance.

## Working principles

- Preserve existing behavior unless the task explicitly asks for a behavior change.
- Inspect the repository structure and nearby code before editing. Prefer existing patterns over introducing new abstractions.
- Make the smallest coherent change that solves the request. Avoid unrelated refactors, formatting churn, dependency upgrades, and renames.
- Treat external contracts, persisted data, authentication, authorization, and database schemas as compatibility-sensitive.
- Before changing an integration, identify the direction of data flow, the source of truth, the contract, and failure behavior.
- Never invent APIs, configuration keys, environment variables, database objects, or business rules. If repository evidence is missing, say so and inspect more files.
- Do not expose, print, commit, or copy secrets, tokens, connection strings, credentials, or personally identifiable data.
- Prefer deterministic, testable code. Keep side effects at clear boundaries.
- Reuse existing dependency-injection, logging, validation, error-handling, and testing conventions when present.

## Verification

- After a code change, run the narrowest useful verification first, then broader verification when practical.
- For .NET changes, prefer build + relevant tests; for frontend changes, prefer typecheck/lint + relevant tests.
- Do not claim a test or build passed unless it was actually run and succeeded.
- If verification cannot be run, state exactly what was not verified.

## Skills

- Use a skill when the task clearly matches its description.
- Do not load unrelated skills just because they are available.
- Project-specific skills take precedence conceptually over generic guidance when they describe a repository-specific convention.
- When a skill requires repository evidence (for example an existing pattern), inspect the repository before applying a new pattern.

## Changes to dependencies

- Do not upgrade packages or frameworks unless requested or required to complete the task.
- When a dependency change is required, inspect the current package/version constraints and verify restore/build impact.
