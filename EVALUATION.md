# Skill Evaluation Policy

Catalog inclusion is not proof that a skill improves results. Evaluate the exact skill revision with the intended model, agent, and task type before describing it as recommended or best.

## Evidence labels

- **Independent benchmark**: reproducible comparison published by a party other than the skill owner.
- **Author benchmark**: reproducible comparison published by the owner; useful but not independent.
- **Local evaluation**: tested by this repository with retained tasks, configuration, and results.
- **No public comparative evaluation found**: documentation or usage claims exist, but no controlled result was located.
- **Rejected after evaluation**: security, correctness, reliability, or efficiency did not meet the documented acceptance threshold.

Stars, downloads, testimonials, static quality scores, and model-level benchmarks are supporting signals, not skill-performance benchmarks.

## Minimum comparison

Use the same model, settings, tools, starting repository state, and task in both conditions:

1. Baseline without the skill.
2. Candidate with the skill at a pinned commit.
3. At least five representative tasks and multiple runs per condition.
4. Deterministic verification when possible; otherwise use a task-specific rubric and blind comparison.

Record task success, quality or acceptance-criteria coverage, input and output tokens, tool calls, elapsed time, safety violations, and run-to-run consistency. Preserve prompts, revisions, configuration, raw outputs, and scoring rules needed to reproduce the result.

## Decision rule

Do not name a category winner unless candidates were tested on the same task set and harness and the advantage is meaningful relative to variance and token cost. Re-audit and re-evaluate material upstream changes before carrying an earlier result forward.
