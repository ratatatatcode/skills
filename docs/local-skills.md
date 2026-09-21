# Repository-Local Skills

Repository-local skills encode workflows or knowledge that applies to one project and should travel with that project's source code.

## Location

Store each local skill inside the target project:

```text
<project-root>/
└── .agents/
    └── skills/
        └── <skill-name>/
            ├── SKILL.md
            ├── references/       optional
            ├── scripts/          optional
            ├── assets/           optional
            └── agents/
                └── openai.yaml   optional
```

Codex scans `.agents/skills` directories from the current working directory toward the repository root. Place a broadly applicable project skill at the repository root. Use a nested project location only when the skill should apply to that narrower area.

## When a local skill is appropriate

Create one when the workflow is:

- Repeated across future tasks.
- Specific to the project's conventions, architecture, domain, or operations.
- Better expressed as an agent workflow than deterministic automation.
- Supported by maintained project evidence.
- Distinct from existing instructions and skills.

Use another mechanism when appropriate:

- `AGENTS.md` for universal repository instructions.
- Human documentation for onboarding and explanation.
- Tests, linters, scripts, or CI for deterministic enforcement.
- The current conversation for one-time work.
- An existing trusted skill when no project-specific behavior is needed.

## Create safely

Before creating `.agents/skills/<skill-name>/`:

1. Inventory every existing skill under `.agents/skills/`.
2. Compare names, descriptions, activation boundaries, references, scripts, assets, and UI metadata.
3. Fully read skills with the same path, name, trigger, or substantially overlapping purpose.
4. Choose whether to create, update, consolidate, rename, or decline.
5. Keep the new or revised skill as small as the workflow permits.

## Collision rules

- Never silently overwrite an existing directory or file.
- Treat an existing target path as an update candidate, not an empty destination.
- Do not create a duplicate merely because an existing skill needs more detail.
- Do not merge skills that share a frontmatter name without resolving their ownership and scope.
- Preserve metadata, invocation policies, dependencies, references, scripts, assets, and user-authored details unless a requested update requires a specific change.
- Stop and request direction when renaming, consolidation, or ownership would materially change the requested scope.

## Iterate an existing skill

Read the complete package before editing it. Make the smallest change supported by project evidence, preserve unrelated behavior, verify all local links and commands, and report exactly what changed. Re-test activation and a representative task after a meaningful revision.

## Keep project details maintainable

Link to canonical project files instead of copying volatile facts when possible. Move substantial conditional procedures into references and load only the reference needed for the current mode. Avoid embedding secrets, personal absolute paths, generated output, or environment-specific credentials.

## Share with the team

Repository-local skills can be reviewed and versioned with the project. Before committing one, review its instructions and executable surfaces like code. Document its owner or source of truth and reassess it when the relevant project workflow changes.

For Codex discovery behavior and supported skill locations, see the [official OpenAI skills documentation](https://developers.openai.com/es-419/docs/build-skills).
