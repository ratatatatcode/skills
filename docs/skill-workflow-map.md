# Skill Workflow Map

This guide explains how the repository-owned skills support a project from idea to delivery. It is written for both business and technical readers: each skill has a plain-language purpose and a clear technical role. Skills are focused workflows, not mandatory phases for every task.

```text
Discover -> Plan -> Build -> Diagnose or Review -> Commit
```

The sequence is a guide, not a requirement. A small task may need only one skill; a larger product may pass through several stages.

## How the skills connect

Choose one primary skill based on the work stage. Add a supporting skill only when it addresses a different need.

### 1. Understand the need

| What you need | Main skill | Add when useful | What it produces |
|---|---|---|---|
| Turn stakeholder ideas into clear, testable requirements | `$product-requirements` | `$docx` for a Word document | SRS (Software Requirements Specification), user stories, acceptance criteria, traceability, and open decisions |
| Keep a large investigation focused | `$context-efficient-workflow` | The skill for the subject being investigated | Relevant evidence and a short record of what is known |

### 2. Plan and create

| What you need | Main skill | Add when useful | What it produces |
|---|---|---|---|
| Turn approved requirements into a practical work plan | `$planning-and-task-breakdown` | `$context-efficient-workflow` for a large project | Ordered tasks, dependencies, and checkpoints |
| Build a feature while proving it works | `$test-driven-development` | `$context-efficient-workflow` | Tests, implementation, and verification |

### 3. Fix and check quality

| What you need | Main skill | Add when useful | What it produces |
|---|---|---|---|
| Find the cause of a failure or unexpected behavior | `$evidence-first-debugging` | `$test-driven-development` when a fix is requested | Evidence-backed diagnosis and a verification plan |
| Check a change before release | `$risk-focused-code-review` | `$context-efficient-workflow` for a large change | Prioritized findings supported by code evidence |

### 4. Organize and improve the way the team works

| What you need | Main skill | Add when useful | What it produces |
|---|---|---|---|
| Group completed changes into clear Git commits | `$change-aware-commits` | None required | A safe, reviewable commit plan or message |
| Decide whether a repeated team activity deserves a skill | `$project-skill-architect` | `$skill-creator` after approval | A skill recommendation, audit, or design |

## Typical usage patterns

### Business-to-build flow

```text
$product-requirements
Create and validate the mobile-app requirements from the stakeholder notes.
```

After the requirements are approved:

```text
$planning-and-task-breakdown $context-efficient-workflow
Turn the approved requirements into an incremental implementation plan. Inspect only the relevant repository areas and preserve dependencies and open technical decisions.
```

### Developer implementation flow

```text
$context-efficient-workflow $test-driven-development
Implement the booking API one capability at a time. Start with the relevant service and tests, keep the working summary current, and verify each behavior before moving on.
```

### Diagnose and review flow

```text
$evidence-first-debugging
Investigate the CI-only payment failure and establish the root cause before changing code.
```

Then, after the fix:

```text
$risk-focused-code-review $change-aware-commits
Review the fix against main, then propose the smallest atomic commit plan. Remain read-only until I explicitly authorize Git changes.
```

## Simple rules for choosing

- Use one skill when it fully describes the task.
- Combine skills when they cover different needs, such as requirements plus Word formatting or focused investigation plus testing.
- `$context-efficient-workflow` keeps large work organized; it does not make product decisions or replace testing.
- `$docx` formats Word files; it does not define or validate requirements.
- `$change-aware-commits` prepares Git changes for review and remains read-only unless Git actions are explicitly authorized.

Technical terms are kept where they identify a real deliverable. An SRS is the structured document that states what the product must do. Acceptance criteria are the observable checks used to decide whether a requirement is met. Traceability links goals to requirements, stories, and tests.
