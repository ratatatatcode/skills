# Creating an Approved Local Skill

Read this reference only after the user requests creation or approves a recommendation.

## Design

1. Choose a short lowercase kebab-case name that describes the capability.
2. Write a concise frontmatter description with activation triggers and any exclusion needed to prevent likely misrouting.
3. Keep shared decisions and workflow in `SKILL.md`; move substantial mode-specific procedures or schemas to linked references.
4. Add scripts only when deterministic execution materially improves reliability. Prefer standard-library implementations and document inputs, outputs, and failure behavior.
5. Add assets only when they are copied or adapted into deliverables.
6. Use repository-relative paths and link to canonical project sources instead of copying volatile facts when practical.
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
