---
name: project-skill-architect
description: Recommend, create, or audit repository-local agent skills from project evidence. Use for project skill portfolios, justified local skill creation, or existing-skill audits. Do not create skills for one-off work, duplicate existing instructions, or install third-party skills.
---

# Project Skill Architect

Turn repeated project knowledge into a small, maintainable set of repository-local skills. Recommend a skill only when it will improve future work more than ordinary project documentation, automation, or a one-time prompt.

## Choose the mode

Determine the requested mode from the user's wording:

- **Recommend**: inspect the project and propose a prioritized local skill catalog. Follow this file.
- **Create**: read [references/creation.md](references/creation.md) after the user requests or approves creation.
- **Audit**: read [references/audit.md](references/audit.md) when reviewing existing local skills.

Recommendation and audit are read-only. Creation authorizes only the local skill files and catalog updates needed for the request; it does not authorize installation, commits, pushes, hooks, dependency installation, or external publication.

Repository-local means the skill is stored inside the target project at `.agents/skills/<skill-name>/`. Do not redirect it to a user-global skills directory or this catalog repository unless the user explicitly requests that different scope.

## Understand the project

Inspect the smallest useful evidence set:

1. Repository instructions and contributor documentation.
2. Top-level structure and project boundaries.
3. Build, test, lint, release, deployment, and operational commands.
4. Framework, language, architecture, configuration, and dependency manifests.
5. Repeated procedures in issues, templates, scripts, or documentation.
6. Domain-specific rules whose omission could cause defects, security problems, or rework.
7. Every existing repository skill under `.agents/skills/`, plus relevant user or system skills that may already cover the need.

Inventory repository-local skill names, descriptions, locations, and supporting resources before recommending or creating anything. Read the full package of an existing skill when it overlaps the requested capability or may need updating; do not load unrelated skill bodies.

For a workspace containing multiple repositories, evaluate each repository independently and identify genuinely shared workflows separately. Do not assume a frontend/backend split or stop after two repositories.

State what was inspected and distinguish verified project facts from inference.

## Decide whether a skill is appropriate

Score each candidate against these gates:

- **Recurring**: likely to be used across multiple future tasks.
- **Project-specific**: depends on conventions or knowledge not reliably available from general expertise.
- **Actionable**: gives an agent a clear workflow, decision rule, or output contract.
- **Evidence-backed**: supported by repository files or explicit stakeholder direction.
- **Distinct**: does not substantially duplicate another skill or repository instruction.
- **Maintainable**: has an identifiable source of truth and a reasonable update burden.
- **Safe**: does not require unjustified privileges, destructive defaults, hidden network access, or credential handling.

Prefer another artifact when it fits better:

- Put universal repository rules in `AGENTS.md` or the project's equivalent instruction file.
- Put human onboarding and explanations in project documentation.
- Put deterministic, repeatable mechanics in scripts, tests, linters, or CI.
- Keep a one-time request in the current task rather than creating permanent skill overhead.
- Reuse a trusted existing skill when project-specific behavior is unnecessary.

Reject or defer candidates that fail the recurring, distinct, or safe gates.

## Recommend the smallest useful portfolio

Recommend the smallest set that covers the highest-value gaps. For each candidate provide:

```text
Name:
Priority: Must / Should / Could / Do not create
Project evidence:
Recurring trigger:
Outcome:
Why a skill is the right artifact:
Overlap checked:
Required resources:
Security considerations:
Maintenance owner or source of truth:
```

Prioritize candidates that reduce high-cost mistakes, preserve specialized project knowledge, or standardize complex recurring work. Do not inflate the list to cover every technology present in the repository.

Conclude with a proposed directory layout and adoption order. Mark inferred recommendations clearly and include rejected candidates with brief reasons.
