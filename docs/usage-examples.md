# Usage Examples for Repository-Owned Skills

These examples invoke each skill explicitly so users can see which workflow should apply. Replace example paths and project details with real ones.

## Product Requirements

Use for formal requirements discovery, creation, or auditing before implementation planning.

```text
$product-requirements

Create a formal SRS for a mobile appointment-booking application from the attached stakeholder notes. Separate confirmed facts, proposals, and open decisions. Include functional and non-functional requirements, MoSCoW priorities, user stories, acceptance criteria, and traceability.
```

Expected result: approved deliverables may be written under `docs/product/`, including the master requirements document, user stories, traceability, and open questions. Markdown remains canonical; Word output is optional when a DOCX-capable skill is available and requested.

Do not use it to plan implementation after the requirements are already approved.

## Evidence-First Debugging

Use for a failure, flaky test, build problem, regression, or unexplained behavior.

```text
$evidence-first-debugging

Investigate why the checkout integration test fails only in CI. Reproduce or isolate the failure, distinguish evidence from assumptions, and do not modify code until the root cause is supported.
```

Expected result: a chat report containing the symptom, reproduction, evidence, root cause or leading hypothesis, confidence, next action, verification, and remaining risks. Files change only when the user also requests a fix.

## Risk-Focused Code Review

Use to review a diff, commit, branch, pull request, file, or implementation.

```text
$risk-focused-code-review

Review the changes on this branch against main. Prioritize correctness, authorization, data integrity, compatibility, performance, and missing regression tests. Report only evidence-supported findings.
```

Expected result: findings ordered by severity, followed by open questions, verification limits, and a short change summary. The skill does not edit code or post external review comments unless requested.

## Change-Aware Commits

Use to create commit messages or an atomic commit plan from actual Git changes.

```text
$change-aware-commits

Inspect every Git repository in this workspace. Produce a separate Conventional Commit plan for each repository and current branch, including staged, unstaged, and relevant untracked changes. Do not stage or commit anything.
```

Expected result: one or more proposed commits per repository and branch, with messages, file or hunk groups, and rationale. It is not limited to frontend and backend repositories and remains read-only unless Git actions are explicitly requested.

## Project Skill Architect

### Recommend local skills

```text
$project-skill-architect

Inspect this project and recommend only the repository-local skills justified by recurring project-specific workflows. Check existing skills first and explain when documentation, AGENTS.md, scripts, tests, or CI would be more appropriate.
```

Expected result: a read-only, prioritized portfolio with project evidence, triggers, overlap checks, security considerations, ownership, and rejected candidates.

### Create or iterate a local skill

```text
$project-skill-architect

Create or update a repository-local skill for our release verification workflow. Inspect every existing skill under .agents/skills first, reuse relevant project commands, and do not overwrite or duplicate an existing capability.
```

Expected result: the skill is created or minimally updated inside `.agents/skills/<skill-name>/`. Existing paths, names, triggers, supporting resources, and invocation policies are inspected before changes. Unresolved collisions are reported instead of overwritten.

### Audit local skills

```text
$project-skill-architect

Audit all skills under .agents/skills for duplicate names, overlapping triggers, obsolete project details, unsafe behavior, broken references, and unnecessary context. Do not modify them; provide the smallest improvement plan.
```

Expected result: evidence-based findings and keep, refine, consolidate, replace, or retire recommendations. Audit mode is read-only.
