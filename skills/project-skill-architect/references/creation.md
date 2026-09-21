# Creating an Approved Local Skill

Read this reference only after the user requests creation or approves a recommendation.

## Target and existing skills

Create repository-local skills inside the target project:

```text
<project-root>/.agents/skills/<skill-name>/SKILL.md
```

Before writing:

1. Resolve the target project root and keep all created files inside it.
2. Inventory `.agents/skills/` recursively, including each skill's folder, frontmatter name and description, references, scripts, assets, and optional `agents/openai.yaml`.
3. Read the complete package of any skill with the same path, name, trigger, or substantially overlapping purpose.
4. Decide whether the request requires a new skill, an iteration of an existing skill, consolidation, or no skill.

Do not create a second skill merely because an existing one needs more detail. Update or extend the existing skill when that preserves its purpose and the user requested creation or improvement.

## Collision handling

- **Target path already exists:** treat it as an existing skill. Do not replace the directory or recreate it from a template. Read it first and make a minimal in-place update only when the request authorizes updating it.
- **Same frontmatter name elsewhere:** do not merge or overwrite either skill. Report both paths and recommend updating, consolidating, or renaming. Ask for direction when that choice materially changes scope or ownership.
- **Overlapping capability:** prefer extending the best-scoped existing skill or declining the new skill. Preserve distinct skills only when their triggers, owners, or project scopes genuinely differ.
- **Incomplete or unexpected directory:** inspect and preserve its contents. Do not assume it is disposable because `SKILL.md` is missing or invalid.
- **Unrelated existing skill:** leave it unchanged.

Never silently overwrite a file. Preserve supported metadata, invocation policy, dependencies, scripts, references, assets, and user-authored details unless the requested update makes a specific change necessary. When a filename collision cannot be reconciled safely, stop and identify the exact paths and decision required.

## Design

1. Choose a short lowercase kebab-case name that describes the capability.
2. Write a concise frontmatter description with activation triggers and any exclusion needed to prevent likely misrouting.
3. Keep shared decisions and workflow in `SKILL.md`; move substantial mode-specific procedures or schemas to linked references.
4. Add scripts only when deterministic execution materially improves reliability. Prefer standard-library implementations and document inputs, outputs, and failure behavior.
5. Add assets only when they are copied or adapted into deliverables.
6. Use paths relative to the target project and link to canonical project sources instead of copying volatile facts when practical.
7. Define authorization boundaries, expected output, and meaningful verification.

Do not add decorative files, hidden telemetry, background processes, lifecycle hooks, autonomous network access, or instructions that weaken repository safeguards.

## Quality and security gate

Before presenting the skill as ready:

1. Verify the folder name matches the frontmatter `name` and the description routes accurately.
2. Check every referenced file and command exists or is explicitly optional.
3. Inspect all scripts, dependencies, hooks, and executable content.
4. Search for secrets, personal absolute paths, encoded payloads, unsafe deletion, remote execution, credential access, and unrequested communication.
5. Require explicit authorization and exact target validation for destructive or externally visible actions.
6. Test scripts and examples in the narrowest safe environment available.
7. Check for conflicts or duplication with project instructions and existing skills.
8. Record verification limits; static inspection cannot guarantee complete safety or correctness.

## Report

List changed files, activation boundaries, project evidence encoded, safety controls, validation, limitations, and a suggested catalog entry. Do not install, commit, push, or publish automatically.

State whether the result was created, updated, consolidated, or left unchanged. Identify every pre-existing skill inspected and disclose any unresolved name, path, or capability collision.
