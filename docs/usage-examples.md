# Usage Examples for Repository-Owned Skills

These stories show how a business owner, product team, developer, reviewer, release engineer, or platform architect might use each skill. Replace the sample product names, paths, and commands with the real project details.

---

## Product Requirements

Scenario: A business owner has stakeholder notes for a new mobile appointment-booking product. A software lead needs requirements that can be reviewed by the business and verified by delivery teams.

The business owner starts with:

```text
$product-requirements

Create a formal SRS for our mobile appointment-booking application from the attached stakeholder notes. Separate confirmed facts, proposals, and open decisions. Include functional and non-functional requirements, MoSCoW priorities, user stories, acceptance criteria, and traceability. Keep Markdown as the canonical source under docs/product/.
```

The software lead follows up:

```text
Review the package for missing acceptance criteria, untestable requirements, uncovered goals, and unresolved decisions. Do not invent stakeholder decisions; record gaps as open questions.
```

Expected result: a reviewable package containing the SRS, user stories, traceability matrix, and open questions. Requirements are documented, not treated as approved until the stakeholder or designated owner approves them.

### Request an optional Word deliverable

When stakeholders need a formatted document, explicitly request Word output and identify the source package and status:

```text
$product-requirements $docx

Using the current Markdown package in docs/product/, render one combined Word document named Kodo-SRS-Draft.docx.

Clearly mark the document as Draft and do not imply stakeholder approval. Preserve the Markdown files as the canonical source. Include a title page, document status, revision date, table of contents, consistent headings, tables, and page numbers.
```

Expected result: the canonical Markdown package plus one combined Word document. Ask for separate DOCX files when each artifact must be shared independently. If DOCX capability is unavailable, complete the Markdown package and report Word rendering as pending.

Do not use this skill to plan implementation after requirements are already approved.

---

## Context-Efficient Workflow

Scenario: An API team is investigating duplicate records across a large repository with lengthy logs. The developer wants focused investigation without skipping verification.

The developer starts with:

```text
$context-efficient-workflow

Investigate why the API occasionally returns duplicate records. Begin with the smallest decision-relevant evidence, limit command output, and keep a compact working summary. Expand to callers, database queries, and logs only when the current evidence cannot determine the next step. Preserve full testing and verification.
```

After the first findings, the developer asks:

```text
Summarize the confirmed facts, files inspected, assumptions, remaining unknowns, and next experiment before continuing.
```

Expected result: bounded searches and reads, a compact state summary, and a complete verified answer. The workflow applies across programming languages and non-programming tasks; it does not replace reasoning or testing.

Do not use it for a simple request that needs no substantial inspection.

---

## Evidence-First Debugging

Scenario: A developer owns a checkout service whose integration test fails only in CI. They need a diagnosis before changing production code.

The developer asks:

```text
$evidence-first-debugging

Investigate why the checkout integration test fails only in CI. Reproduce or isolate the failure, inspect the smallest relevant logs and configuration, distinguish evidence from assumptions, and do not modify code until the root cause is supported.
```

After a leading hypothesis appears, they continue:

```text
Design one minimal experiment that can falsify the leading hypothesis. Report the result, confidence, and any remaining risks.
```

Expected result: a report covering the symptom, reproduction, evidence, root cause or leading hypothesis, confidence, next action, verification, and remaining risks. Files change only when the user also requests a fix.

---

## Risk-Focused Code Review

Scenario: A software lead is preparing a payment-service change for release. They want a read-only review focused on user, security, data, and operational risk.

The lead asks:

```text
$risk-focused-code-review

Review this branch against main. Prioritize correctness, authorization, data integrity, compatibility, performance, operational failure modes, and missing regression tests. Inspect the complete relevant diff and report only evidence-supported findings.
```

The lead then asks:

```text
For each finding, show the affected path and line, failing condition, impact, evidence, severity, and focused recommendation. Separate open questions from confirmed defects and do not modify the branch.
```

Expected result: severity-ranked findings, open questions, verification limits, and a concise change summary. The skill does not approve changes, post review comments, or edit files unless explicitly requested.

---

## Change-Aware Commits

Scenario: A release engineer has changes across documentation and a new skill in one repository. They want an atomic Conventional Commit plan before touching Git history.

The release engineer asks:

```text
$change-aware-commits

Inspect the current repository and branch. Separate staged, unstaged, and untracked changes, inspect the relevant diffs, and propose the smallest coherent Conventional Commit plan. Do not stage, commit, push, or switch branches.
```

After reviewing the plan, they explicitly authorize the action:

```text
Proceed with the proposed commit only. Before committing, show the exact files, branch, and final message; do not include unrelated changes.
```

Expected result: each repository and branch is reported separately, with commit messages, file or hunk groups, rationale, and any mixed-concern files. The default workflow remains read-only.

---

## Project Skill Architect

Scenario: A platform architect notices that developers repeatedly perform the same release-verification workflow across several services. They want to decide whether a repository-local skill is justified.

### Recommend local skills

```text
$project-skill-architect

Inspect this project and recommend only repository-local skills justified by recurring workflows. Check existing skills first and explain when documentation, AGENTS.md, scripts, tests, or CI would be more appropriate. Remain read-only.
```

Expected result: a prioritized portfolio with project evidence, triggers, overlap checks, security considerations, ownership, and rejected candidates.

### Create or iterate a local skill

```text
$project-skill-architect

Create or update a repository-local skill for release verification. Inspect every existing skill under .agents/skills first, reuse relevant project commands, and do not overwrite or duplicate an existing capability. Keep the skill inside .agents/skills/<skill-name>/.
```

Expected result: a minimal skill with justified instructions, metadata, and supporting resources only when needed. Existing paths, names, triggers, and invocation policies are preserved unless a change is approved.

### Audit local skills

```text
$project-skill-architect

Audit all skills under .agents/skills for duplicate names, overlapping triggers, obsolete project details, unsafe behavior, broken references, and unnecessary context. Do not modify them; provide the smallest improvement plan.
```

Expected result: evidence-based keep, refine, consolidate, replace, or retire recommendations.
