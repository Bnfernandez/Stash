---
name: legacy-safe-change
description: Use for Project A changes in mature monolithic flows where avoiding regressions and breaking changes is more important than architectural cleanup.
---

# Mature monolith change strategy

1. Map the existing flow before editing.
2. Identify public contracts and persisted state.
3. Find existing tests and similar implementations.
4. Make one focused change.
5. Preserve surrounding code even if it could be redesigned.
6. Add regression coverage for the changed behavior.
7. Build and test the smallest affected surface before broader verification.

Do not combine a feature change with a refactor, package upgrade, formatting sweep, or naming cleanup unless explicitly requested.
