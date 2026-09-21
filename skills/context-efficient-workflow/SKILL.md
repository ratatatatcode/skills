---
name: context-efficient-workflow
description: Keep context-heavy agent work focused by narrowing evidence, controlling tool output, and maintaining compact state across code, debugging, research, browser, and document tasks. Use when a task may involve large repositories, files, logs, command results, or a long-running investigation; do not invoke for simple requests that need no substantial inspection.
---

# Context-Efficient Workflow

Reduce irrelevant context without reducing correctness, verification, or the requested scope. Optimize what is loaded and retained, not the quality of the result.

## Start with the next decision

Before reading or running anything, identify:

- The outcome the user requested.
- The next fact needed to make progress.
- The smallest likely source of that fact.

Prefer metadata, indexes, targeted searches, and relevant excerpts before full files or broad scans. Expand only when the current evidence cannot answer the next decision.

## Control evidence collection

- Search likely paths with specific identifiers before searching an entire workspace.
- Inspect file names, sizes, schemas, headings, or row counts before loading large artifacts.
- Read the relevant function, section, range, page, or time window first.
- Constrain command output at its source with a narrower path, query, time range, or result limit.
- When output is truncated or noisy, refine the query instead of repeating it unchanged.
- Avoid re-reading unchanged material already represented accurately in the working summary.

Broad inspection is appropriate when the task itself is repository-wide, the location is unknown, or focused evidence has failed. State why the broader pass is needed and avoid repeating it without new evidence.

## Preserve a compact working state

After a meaningful discovery or large output, retain only:

- Confirmed facts and their sources.
- Relevant files, locations, commands, or artifacts.
- Decisions and assumptions that affect the result.
- Changes made and verification performed.
- Remaining unknowns and the next useful action.

For long tasks, refresh this state before changing direction or resuming after an interruption. Treat the summary as an index, not a substitute for reopening exact evidence when precision matters.

## Adapt to the task

### Code and debugging

Begin with the reported behavior, error text, changed symbols, entry points, and nearby tests. Trace callers, configuration, dependencies, or broader architecture only when they can change the diagnosis or implementation. Do not skip regression tests, type checks, builds, or other proportionate verification to save context.

### Documents and structured data

Inspect structure before content: document headings, PDF pages, workbook sheets, table schemas, row counts, or data samples. Load only the sections or ranges needed for the requested operation, while checking cross-references or formulas when partial reading could produce an incorrect result.

### Browser and interface work

Capture the relevant page state, element, console message, or network request. Repeat screenshots or full-page inspection only after state changes or when visual context is itself the subject of the task.

### Research and comparison

Define the decision criteria before collecting sources. Prefer authoritative sources and extract only claims relevant to those criteria. Add sources when they improve coverage, recency, confidence, or perspective—not merely to increase the count.

## Guardrails

- Follow the user's requested language, detail level, and deliverable format.
- Do not claim exact token, quota, cost, or latency savings unless they were measured.
- Do not omit necessary reasoning, evidence, edge cases, or verification for brevity.
- Do not silently narrow the user's requested scope; distinguish an efficient first pass from a completed task.
- Ask for clarification only when the missing choice materially changes the result and cannot be inferred safely.
- Keep user updates concise, but make the final result self-contained.

Efficiency is successful when unnecessary input and repetition are reduced while the requested outcome remains complete and verifiable.
