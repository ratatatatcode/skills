# Unofficial local benchmark — September 26, 2026

> These are unofficial benchmark results, not an independent evaluation or a guarantee of performance. Results may differ with another run, model, task, environment, or skill revision.

This report publishes only the repository-owned context-efficient-workflow skill and a no-skill baseline. Other tested conditions are omitted. The latest completed batch is attempt 04 (two fresh sessions per task and condition); attempt 03 supplies three earlier sessions per cell for variability context. No new benchmark was run to prepare this report.

## Method and scope

- Recorded model: gpt-6-luna; reasoning effort: medium; setup seed: 20260926.
- Three FieldOps task tiers: small dashboard overdue count; medium site filtering and pagination validation; heavy Express backend and React Native dispatch workflow.
- The recorded cross-batch parity audit passed for source, task, verifier, skill snapshot, locked dependencies, model, and reasoning effort. All selected sessions finished.
- This is a local evaluation under the repository evaluation policy. Three tasks fall short of its five-task minimum for broad comparisons; no winner or causal improvement is established.
- Published data: [sanitized per-session measurements](measurements.json), including revision hashes, usage, tool calls, status, and failed checks. Local workspace paths and other skill conditions were removed.
- Source evidence: local September 26 attempt 03 and attempt 04 reports/runs.json and attempt 04 cross-batch-comparison.md. Raw traces, source snapshots, and the execution harness remain in the ignored local archive; this publication alone is not a complete reproduction package.

## Latest batch (attempt 04)

Finished sessions are not necessarily successful tasks. A full pass means the acceptance verifier exited successfully. Check counts are summed across both repetitions. Duration is median wall-clock session time in milliseconds; input/output tokens are sums of emitted usage fields, not billing estimates. Cached-input counts are retained separately in the JSON and are not added again.

| Task | Condition | Full passes / runs | Checks passed / total | Median duration (ms) | Input tokens | Output tokens |
|---|---|---:|---:|---:|---:|---:|
| small | no-skill | 1 / 2 | 1 / 2 | 94553 | 267557 | 4924 |
| small | context-efficient-workflow | 0 / 2 | 0 / 2 | 102401 | 275437 | 4316 |
| medium | no-skill | 1 / 2 | 4 / 6 | 154998.5 | 343903 | 8827 |
| medium | context-efficient-workflow | 0 / 2 | 2 / 6 | 103762.5 | 287812 | 5386 |
| heavy | no-skill | 0 / 2 | 16 / 24 | 124222 | 325453 | 6479 |
| heavy | context-efficient-workflow | 1 / 2 | 20 / 24 | 154573 | 557247 | 8128 |

## Variability across batches

These are full-task passes, not individual check totals. Each condition has five sessions per task across the two batches.

| Task | Condition | Attempt 03 | Attempt 04 | Combined |
|---|---|---:|---:|---:|
| small | no-skill | 3 / 3 | 1 / 2 | 4 / 5 |
| small | context-efficient-workflow | 1 / 3 | 0 / 2 | 1 / 5 |
| medium | no-skill | 1 / 3 | 1 / 2 | 2 / 5 |
| medium | context-efficient-workflow | 1 / 3 | 0 / 2 | 1 / 5 |
| heavy | no-skill | 2 / 3 | 0 / 2 | 2 / 5 |
| heavy | context-efficient-workflow | 1 / 3 | 1 / 2 | 2 / 5 |

## Interpretation and recurring failures

In the latest batch, context-efficient-workflow passed fewer checks than the baseline on small and medium tasks and more on the heavy task. Its input-token total was higher on small and heavy tasks and lower on medium tasks. These observations do not demonstrate a general quality or efficiency advantage.

For context-efficient-workflow, the following acceptance failures appeared in both batches:

- Small: overdue dashboard count.
- Medium: case-insensitive exact site filtering combined with existing filters, and rejection of invalid pagination.
- Heavy: assignment validation/event recording, derived dashboard metrics, applying sync operations once, and offline/accessibility controls in the mobile source.

The baseline also repeated the medium and heavy failures across batches. Mixed outcomes and the small sample make future results uncertain. Verifier passes cover only the recorded checks; they do not establish production readiness or complete mobile runtime correctness.
