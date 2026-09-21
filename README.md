# Codex Skills Catalog

A lightweight catalog for discovering useful Codex skills. Community skills are downloaded directly from their upstream GitHub repositories; original skills maintained here live under [`skills/`](skills/).

> Review third-party skills before installing or running them. A listing here is not a security endorsement.

See [Skill Evaluation Policy](EVALUATION.md) for evidence labels, comparison requirements, and ranking rules.

## Start Here

- [Getting Started](docs/getting-started.md) — safely install, discover, invoke, update, disable, and troubleshoot skills.
- [Usage Examples](docs/usage-examples.md) — practical prompts and expected results for every repository-owned skill.
- [Repository-Local Skills](docs/local-skills.md) — create and maintain project-specific skills under `.agents/skills/` without overwriting existing work.

## Catalog

### Security

#### Skill Security Review

Reviews agent skills for prompt injection, unsafe scripts, lifecycle hooks, credential access, data exfiltration, and other installation risks. Use this before installing unfamiliar third-party skills.

- Evidence: **No public comparative evaluation found**
- [Source and documentation](https://github.com/garymike/skills/tree/main/skills/skill-security-review)
- Install:

  ```text
  $skill-installer install https://github.com/garymike/skills/tree/main/skills/skill-security-review
  ```

#### Propose Security Hardening

Turns existing security findings into architectural hardening proposals. This is for improving an application after findings are available, not for reviewing whether a skill is safe to install.

- Evidence: **No public comparative evaluation found**
- [Source and documentation](https://github.com/openai/plugins/tree/main/plugins/codex-security/skills/propose-security-hardening)
- Install:

  ```text
  $skill-installer install https://github.com/openai/plugins/tree/main/plugins/codex-security/skills/propose-security-hardening
  ```

---

### Product Documentation

#### Product Requirements

An original, domain-neutral workflow for turning ideas, briefs, stakeholder notes, or existing systems into a formal, checked BRD/SRS package. It covers document control, introduction, problem and solution statements, current and future scope, MoSCoW priorities, software and business requirements, user stories, acceptance criteria, data and interfaces, delivery and operational requirements, traceability, risks, open decisions, and stakeholder approval.

It includes focused review profiles for:

- Web products
- Mobile applications
- Business and operations processes

- [Source and documentation](skills/product-requirements/SKILL.md)
- Install:

  ```text
  $skill-installer install https://github.com/ratatatatcode/skills/tree/main/skills/product-requirements
  ```

Markdown remains the canonical source. The skill can optionally hand approved content to a DOCX-capable skill for a professionally formatted Word document.

#### DOCX

Creates, reads, edits, and formats Microsoft Word `.docx` documents. Use it as an optional renderer for an approved Product Requirements package, not as the requirements-analysis workflow itself.

- Evidence: **No public comparative evaluation found**
- [Upstream source and documentation](https://github.com/anthropics/skills/tree/main/skills/docx)
- License: source-available/proprietary; review the upstream license before installation or redistribution.
- Install:

  ```text
  $skill-installer install https://github.com/anthropics/skills/tree/main/skills/docx
  ```

#### Acquire Codebase Knowledge

Documents an existing repository from verifiable evidence. It produces structured stack, project structure, architecture, conventions, integrations, testing, and technical-concern documents without inventing unsupported details.

- Evidence: **No public comparative evaluation found**
- [Upstream source and documentation](https://github.com/github/awesome-copilot/tree/main/skills/acquire-codebase-knowledge)
- Requirements: Python 3.8+ and Git; the skill includes a repository-scanning script, so review it before execution.
- Install:

  ```text
  $skill-installer install https://github.com/github/awesome-copilot/tree/main/skills/acquire-codebase-knowledge
  ```

---

### Token and Context Efficiency

#### Token Efficient Workflow

Guidance for reducing unnecessary context and token usage during agent workflows.

- Evidence: **No public comparative evaluation found**
- [Source and documentation](https://github.com/luziyezz/codex-skills/tree/main/token-efficient-workflow)
- Install:

  ```text
  $skill-installer install https://github.com/luziyezz/codex-skills/tree/main/token-efficient-workflow
  ```

---

### Planning and Coding

#### Planning and Task Breakdown

Helps break development work into clear, executable tasks.

- Evidence: **No public comparative evaluation found**
- [Source and documentation](https://github.com/QMahyar/skills/tree/main/skills/planning-and-task-breakdown)
- Install:

  ```text
  $skill-installer install https://github.com/QMahyar/skills/tree/main/skills/planning-and-task-breakdown
  ```

#### Test-Driven Development

Uses the red-green-refactor cycle when implementing behavior or fixing defects: first reproduce the requirement or defect with a failing test, then make the smallest implementation pass, and finally improve the code while keeping tests green.

- Evidence: **No public comparative evaluation found**
- [Upstream source and documentation](https://github.com/cloudflare/computer/tree/main/.agents/skills/test-driven-development)
- License: MIT.
- Install:

  ```text
  $skill-installer install https://github.com/cloudflare/computer/tree/main/.agents/skills/test-driven-development
  ```

#### Evidence-First Debugging

An original workflow for diagnosing failures through reproducible evidence, falsifiable hypotheses, and one-variable experiments. It starts with read-only investigation and prohibits destructive cleanup as a default debugging step.

- [Source and documentation](skills/evidence-first-debugging/SKILL.md)
- Install:

  ```text
  $skill-installer install https://github.com/ratatatatcode/skills/tree/main/skills/evidence-first-debugging
  ```

#### Risk-Focused Code Review

An original, standalone review workflow for correctness, regressions, security, data integrity, performance, compatibility, and missing tests. Findings require concrete evidence, and review remains read-only unless further action is requested.

- [Source and documentation](skills/risk-focused-code-review/SKILL.md)
- Install:

  ```text
  $skill-installer install https://github.com/ratatatatcode/skills/tree/main/skills/risk-focused-code-review
  ```

---

### Skill Design

#### Project Skill Architect

An original workflow for inspecting a project and recommending the smallest useful portfolio of repository-local skills. It distinguishes skills from project documentation, agent instructions, scripts, CI, and one-off prompts; supports any number of repositories; and applies security and maintenance gates before creating an approved skill.

- [Source and documentation](skills/project-skill-architect/SKILL.md)
- Install:

  ```text
  $skill-installer install https://github.com/ratatatatcode/skills/tree/main/skills/project-skill-architect
  ```

---

### Git Workflow

#### Change-Aware Commits

An original workflow for creating Conventional Commit messages and atomic commit plans from actual changes. It covers every in-scope repository and branch—one, two, or many—and is not limited to frontend/backend projects. It does not stage, commit, switch branches, or push unless explicitly requested.

- [Source and documentation](skills/change-aware-commits/SKILL.md)
- Install:

  ```text
  $skill-installer install https://github.com/ratatatatcode/skills/tree/main/skills/change-aware-commits
  ```

---

## Installing a Skill

Use this security-first process for every unfamiliar skill:

1. **Verify the source.** Confirm the repository owner, exact skill path, license, recent changes, and expected purpose.
2. **Audit before installation.** Inspect `SKILL.md` and every bundled script, executable, dependency manifest, test file, hook, and lifecycle command. Use **Skill Security Review** to assess prompt injection, unsafe commands, credential access, data exfiltration, external communication, and developer-execution risks.
3. **Review permissions and actions.** Reject unexpected filesystem access, destructive commands, background processes, network calls, credential handling, telemetry, or instructions that bypass user approval.
4. **Install only the reviewed revision.** Copy the catalog's install command into Codex. The built-in `skill-installer` downloads the selected skill directory from its GitHub repository.
5. **Verify after installation.** Confirm the installed files match what was reviewed, then restart or begin a new Codex session if the skill is not immediately available.
6. **Re-audit updates.** Treat a changed upstream revision as new code and review it again before use.

Security review reduces risk but cannot guarantee that a skill is harmless. Prefer repository-local, pinned, and minimal skills when practical.

---

## Inclusion Principles

A third-party catalog entry must have:

- A public upstream source and identifiable license.
- A clear purpose and activation boundary.
- A direct installation command targeting the upstream skill directory.
- An evidence label defined in [Skill Evaluation Policy](EVALUATION.md).
- No copied third-party skill implementation in this repository.

An original skill maintained here must also have a narrow purpose, explicit ownership, progressive disclosure where useful, validated local links and metadata, and a security review before being described as stable.
