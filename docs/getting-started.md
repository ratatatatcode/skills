# Getting Started with the Skills Catalog

This guide covers safe installation, discovery, invocation, updates, and troubleshooting for Codex skills listed in this repository.

## Before installing

1. Open the skill's source link from the catalog.
2. Confirm the repository owner, license, exact skill directory, and revision.
3. Review `SKILL.md`, scripts, dependencies, hooks, executable files, network access, credential handling, and destructive commands.
4. Check the entry's evidence label and the [evaluation policy](../EVALUATION.md).
5. Install only when the skill's purpose, permissions, and risks are acceptable.

Catalog inclusion is not a security guarantee. Re-audit a third-party skill after material upstream changes.

## Install a catalog skill

Copy the exact `$skill-installer` command shown under the chosen entry in the [catalog](../README.md). For example:

```text
$skill-installer install https://github.com/ratatatatcode/skills/tree/main/skills/evidence-first-debugging
```

The installer can download a skill from another GitHub repository. Codex normally discovers newly installed skills automatically; restart Codex if a new skill does not appear.

## Confirm discovery

In Codex CLI or the IDE extension:

1. Run `/skills` to list available skills.
2. Confirm the expected skill name appears.
3. Check for duplicate names. Codex does not merge two skills that declare the same name.

## Invoke a skill

Invoke a skill explicitly by starting the request with `$<skill-name>`:

```text
$evidence-first-debugging

Investigate why this test fails intermittently. Use read-only checks first and report the evidence supporting the root cause.
```

Codex may also select a skill automatically when the request matches its description. Explicit invocation is preferable when testing a newly installed skill or when several skills have similar triggers.

## Understand the output boundary

A skill does not automatically authorize every action it describes:

- Debugging, review, and commit-message skills return results in chat by default.
- A documentation skill may create files when the requested deliverable requires them.
- A repository-local skill creator writes only after creation or updating is requested.
- Staging, committing, pushing, publishing, installing dependencies, modifying production, or other external actions require their own authorization.

Review the proposed path before allowing a skill to create persistent files.

## Update safely

Treat an upstream update as new code:

1. Record the currently installed source and revision.
2. Review the upstream diff and repeat the security checks.
3. Confirm that activation behavior, permissions, dependencies, and output paths have not expanded unexpectedly.
4. Back up local modifications before replacing anything.
5. Install or copy the reviewed update, then repeat a representative usage test.

Never assume a previous audit applies to a changed revision.

## Disable without deleting

Codex supports disabling a local skill in `~/.codex/config.toml`:

```toml
[[skills.config]]
path = "/absolute/path/to/skill/SKILL.md"
enabled = false
```

Restart Codex after changing this configuration. Prefer disabling first when diagnosing a conflict; remove files only after confirming the exact installation path and whether local changes need to be retained.

## Troubleshooting

If a skill does not appear:

1. Confirm the folder contains `SKILL.md` with valid `name` and `description` frontmatter.
2. Run `/skills` from the intended project directory.
3. Check whether the skill was disabled in configuration.
4. Check for duplicate names or an unexpected installation location.
5. Restart Codex.

If a skill activates at the wrong time, inspect its description for overly broad triggers. If it produces an unsafe or unexpected action, stop using it, preserve relevant evidence, disable it, and reassess the package before continuing.

For product behavior and supported locations, see the [official OpenAI skills documentation](https://developers.openai.com/es-419/docs/build-skills).
