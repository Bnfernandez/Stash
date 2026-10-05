# OpenCode setup — Projects A and B

This package contains:

- `global/AGENTS.md`: personal global rules for all repositories.
- `global/skills/*`: reusable skills shared by both projects.
- `A/AGENTS.md` + `A/skills/*`: Project A-specific rules and workflows.
- `B/AGENTS.md` + `B/skills/*`: Project B-specific rules and workflows.

## Install global rules

On native Windows, OpenCode's global config directory is `%USERPROFILE%\.config\opencode`. On WSL/Linux, it is `~/.config/opencode`.

Copy:

- `global/AGENTS.md` -> `<global-opencode-dir>/AGENTS.md`
- `global/skills/*` -> `<global-opencode-dir>/skills/`

## Install project rules

For Project A, copy the contents of `A/` to the repository root.
For Project B, copy the contents of `B/` to the repository root.

You should end up with:

```text
project-root/
├── AGENTS.md
└── .opencode/
    └── skills/
        ├── .../
        │   └── SKILL.md
```

Commit each project's `AGENTS.md` and `.opencode/skills/` with the repository. Keep personal/global rules outside Git.

## Notes

The skills are intentionally narrow: OpenCode discovers their descriptions first and loads matching skills on demand. The project skills therefore focus on repository-specific conventions rather than repeating all generic .NET guidance.

Project-specific skills use distinct IDs to avoid accidental overrides of global skills.

Project A also includes a `devextreme-js` skill covering the project-wide DevExtreme JavaScript UI conventions.
