---
name: context-efficient-workflow
description: Keep context-heavy agent work focused and verifiable by routing simple tasks lightly, retrieving only relevant evidence, and using explicit acceptance gates for risky multi-file work.
license: MIT
---

# Context-Efficient Workflow

Keep the smallest useful context while preserving scope and correctness. Route the task first; do not apply a heavy workflow to a small edit.

## Route

- **Small/local:** inspect the target and nearby tests, make the change, run the narrow check, and report it.
- **Heavy/risky:** use the correctness loop below. This includes multi-file features, unfamiliar repositories, debugging, persistence, APIs, UI state, batch operations, and long investigations.

## Heavy-task correctness loop

1. Write a compact acceptance checklist and identify the baseline test or check.
2. Inspect metadata and targeted symbols first. Expand only when evidence changes the next decision. Keep a working index of facts, sources, decisions, changes, checks, and unknowns.
3. For API or stateful work, write a tiny contract matrix before coding: valid input, invalid input, no-op, repeated request, and bulk/partial input; record expected response, state change, and side-effect count for each.
4. Run the baseline check when practical. Implement one vertical slice at a time; after each risky slice, run the narrowest relevant check.
5. Run complete proportionate verification before claiming completion. Check side effects as well as return values: event/audit counts, idempotency, persistence, derived totals, and error-state behavior.
6. If a check fails, stop compressing context. Investigate with focused evidence, fix or explicitly leave the failure unresolved, then rerun the check.
7. Reconcile changed files against the checklist. State commands actually run, results, and unknowns in the final response.

## Execution reliability

For multi-file implementation tasks, treat implementation and verification as separate gates:

1. Establish the smallest runnable or statically checkable baseline before broad edits. If the required runtime or dependency manager is unavailable, record that as a gating fact and use only an explicitly labeled fallback verifier.
2. Make changes in small vertical slices. Keep each patch to one logical operation per file; do not combine delete/add/update operations for the same file in one patch.
3. After a patch failure, stop the retry loop. Read the current file, identify whether another change already landed, then apply one fresh narrow patch. After two failures on the same target, switch to a smaller edit strategy or leave the item unresolved with evidence.
4. Run the external or acceptance check after implementation, not just the agent-authored tests. Capture pass count, failed checks, exact command, and whether the check was runtime or static.
5. Do not claim completion when the implementation, verifier, or final report is missing. Use one of these explicit states: `verified`, `partially verified`, `blocked by environment`, or `failed`.
6. Always leave a concise final report containing files changed, checks actually run, exact results, unresolved failures, and runtime/tooling limitations. If execution is interrupted, preserve the partial artifacts and report the interruption instead of presenting a normal success result.

## Evidence controls

- Prefer file names, headings, schemas, targeted searches, and bounded excerpts before full artifacts.
- Constrain output at the source; refine noisy or truncated commands instead of repeating them.
- Do not reread unchanged material already captured accurately in the working index.
- For genuinely large tasks, read [context-budget.md](references/context-budget.md) and use `scripts/context-budget.js` only when a measurable budget is useful.

## Safe patch recovery

- Make one logical change per patch and avoid multiple operations targeting the same file in one patch.
- If a patch fails, reread the target file and apply a smaller hunk based on its current contents; never retry the identical stale patch.
- After a successful patch, inspect the changed section before editing that file again. If repeated patching fails, use a narrower edit strategy and record the recovery in the working index.
- For API/state changes, use the [contract matrix](references/contract-matrix.md) as the minimum mutation checklist.

## Guardrails

- Never trade required tests, acceptance criteria, security checks, or user scope for a smaller context.
- Do not claim exact token, cost, latency, or savings without measurement.
- Do not silently narrow the task. Distinguish a fast first pass from a complete verified result.
- Preserve user permissions and deliverable format.
