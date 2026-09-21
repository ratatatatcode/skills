# Auditing Local Skills

Read this reference only when the user requests an audit of existing project skills.

Start with every skill under the target project's `.agents/skills/`. Record its physical path and frontmatter name because two directories can declare the same name and Codex does not merge them. Read full packages for overlapping, conflicting, or update candidates; inspect other skills only as deeply as the audit requires.

For each skill:

1. Confirm its trigger is recurring, project-specific, actionable, and distinct.
2. Check that the name and description route narrowly and that exclusions prevent likely misactivation.
3. Identify generic advice, duplication, obsolete facts, unnecessary examples, and content better enforced by documentation, tests, scripts, linters, or CI.
4. Verify conditional details use progressive disclosure and every reference is reachable.
5. Inspect scripts, dependencies, hooks, permissions, destructive actions, credential access, external communication, and installation behavior.
6. Check commands, paths, output contracts, and verification steps against the current project.
7. Detect duplicate names, overlapping activation, path collisions, and details that belong in an existing skill rather than a new one.
8. Classify the result as keep, refine, consolidate, replace, or retire.

Report actionable findings first with evidence and impact. Then provide the smallest consolidation or update plan, expected context reduction where measurable, verification limits, and any facts requiring an owner decision. Do not overwrite or remove a skill during an audit.
