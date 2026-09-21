# Codex Skills Catalog

A lightweight catalog for discovering useful Codex skills. Community skills are downloaded directly from their upstream GitHub repositories; original skills maintained here live under [`skills/`](skills/).

> Review third-party skills before installing or running them. A listing here is not a security endorsement.

## Catalog

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

- [Upstream source and documentation](https://github.com/anthropics/skills/tree/main/skills/docx)
- License: source-available/proprietary; review the upstream license before installation or redistribution.
- Install:

  ```text
  $skill-installer install https://github.com/anthropics/skills/tree/main/skills/docx
  ```

#### Acquire Codebase Knowledge

Documents an existing repository from verifiable evidence. It produces structured stack, project structure, architecture, conventions, integrations, testing, and technical-concern documents without inventing unsupported details.

- [Upstream source and documentation](https://github.com/github/awesome-copilot/tree/main/skills/acquire-codebase-knowledge)
- Requirements: Python 3.8+ and Git; the skill includes a repository-scanning script, so review it before execution.
- Install:

  ```text
  $skill-installer install https://github.com/github/awesome-copilot/tree/main/skills/acquire-codebase-knowledge
  ```

### Security

#### Skill Security Review

Reviews agent skills for prompt injection, unsafe scripts, lifecycle hooks, credential access, data exfiltration, and other installation risks. Use this before installing unfamiliar third-party skills.

- [Source and documentation](https://github.com/garymike/skills/tree/main/skills/skill-security-review)
- Install:

  ```text
  $skill-installer install https://github.com/garymike/skills/tree/main/skills/skill-security-review
  ```

#### Propose Security Hardening

Turns existing security findings into architectural hardening proposals. This is for improving an application after findings are available, not for reviewing whether a skill is safe to install.

- [Source and documentation](https://github.com/openai/plugins/tree/main/plugins/codex-security/skills/propose-security-hardening)
- Install:

  ```text
  $skill-installer install https://github.com/openai/plugins/tree/main/plugins/codex-security/skills/propose-security-hardening
  ```

### Token and Context Efficiency

#### Token Efficient Workflow

Guidance for reducing unnecessary context and token usage during agent workflows.

- [Source and documentation](https://github.com/luziyezz/codex-skills/tree/main/token-efficient-workflow)
- Install:

  ```text
  $skill-installer install https://github.com/luziyezz/codex-skills/tree/main/token-efficient-workflow
  ```

### Planning and Coding

#### Planning and Task Breakdown

Helps break development work into clear, executable tasks.

- [Source and documentation](https://github.com/QMahyar/skills/tree/main/skills/planning-and-task-breakdown)
- Install:

  ```text
  $skill-installer install https://github.com/QMahyar/skills/tree/main/skills/planning-and-task-breakdown
  ```

#### Test-Driven Development

Uses the red-green-refactor cycle when implementing behavior or fixing defects: first reproduce the requirement or defect with a failing test, then make the smallest implementation pass, and finally improve the code while keeping tests green.

- [Upstream source and documentation](https://github.com/cloudflare/computer/tree/main/.agents/skills/test-driven-development)
- License: MIT.
- Install:

  ```text
  $skill-installer install https://github.com/cloudflare/computer/tree/main/.agents/skills/test-driven-development
  ```

#### Systematic Debugging

Provides a structured workflow for diagnosing software defects.

- [Source and documentation](https://github.com/magnus919/agent-skills/tree/main/systematic-debugging)
- Install:

  ```text
  $skill-installer install https://github.com/magnus919/agent-skills/tree/main/systematic-debugging
  ```

#### Code Review

OpenAI's workflow for reviewing code changes.

- [Source and documentation](https://github.com/openai/codex/tree/main/.codex/skills/code-review)
- Install:

  ```text
  $skill-installer install https://github.com/openai/codex/tree/main/.codex/skills/code-review
  ```

### Git Workflow

#### Conventional Commits

Generates Conventional Commit messages from the current changes without committing automatically.

- [Source and documentation](https://github.com/falcondev-oss/skills/tree/main/skills/conventional-commits)
- Install:

  ```text
  $skill-installer install https://github.com/falcondev-oss/skills/tree/main/skills/conventional-commits
  ```

Example request after installation:

```text
Review the current git diff.
Separate frontend and backend changes.

Return:
Frontend:
<commit>

Backend:
<commit>

Use Conventional Commits.
Do not commit automatically.
```

## Installing a Skill

Copy the install command for the skill you want into Codex. The built-in `skill-installer` downloads it directly from the linked upstream GitHub repository. Restart or begin a new Codex session after installation if the skill is not immediately available.

Always inspect the repository owner, requested permissions, bundled scripts, hooks, and dependency lifecycle commands before using an unfamiliar skill.

## Inclusion Principles

A catalog entry should have:

- A public, stable upstream source.
- A clear purpose and activation boundary.
- A direct installation command targeting the upstream skill directory.
- No copied third-party skill implementation in this repository.

An original skill maintained in this repository should additionally have a narrow purpose, explicit ownership, progressive disclosure, and a security review before being described as stable.
