# Unofficial benchmark: anonymized additional skills

> These are unofficial local benchmark results, not an independent evaluation or a guarantee of performance. Results may differ with another run, model, task, environment, or skill revision.

This report compares our repository-owned `context-efficient-workflow`, five other tested skills labeled Skill A through Skill E, and the no-skill baseline. Anonymous labels are consistent throughout this report and do not indicate rank. Other skills' names, identifying links, hashes, and the label-to-name mapping are intentionally omitted.

## Method

The September 26, 2026 attempt 04 batch is the latest completed batch, with two fresh sessions per task and condition. Attempt 03 provides three earlier sessions per cell. Recorded settings were gpt-6-luna with medium reasoning effort and setup seed 20260926. The recorded cross-batch parity audit passed for model, effort, source, task, verifier, dependencies, and assigned skill snapshots; all expected sessions finished.

Small tests dashboard overdue counts; medium tests site filtering and pagination; heavy tests an Express backend and React Native dispatch workflow. These are three task scenarios, below the repository evaluation policy minimum of five representative tasks for broad comparisons.

Numbers below were aggregated from the retained local reports/runs.json files for the two batches. No benchmark was rerun for this publication. Raw evidence and the identity mapping are not included, so this anonymized report alone is not a complete reproduction package.

## Latest batch: attempt 04

A full-task pass means the acceptance verifier exited successfully. Individual checks are counted separately and summed across the two repetitions. Finished sessions can still fail verification. Duration is median wall-clock session time. Input/output tokens are sums of emitted usage fields, not billing estimates; cached input is not added again.

| Task | Condition | Full passes / runs | Checks passed / total | Median duration (ms) | Input tokens | Output tokens |
|---|---|---:|---:|---:|---:|---:|
| small | No-skill baseline | 1 / 2 | 1 / 2 | 94553 | 267557 | 4924 |
| small | context-efficient-workflow | 0 / 2 | 0 / 2 | 102401 | 275437 | 4316 |
| small | Skill A | 0 / 2 | 0 / 2 | 129841 | 271220 | 5339 |
| small | Skill B | 2 / 2 | 2 / 2 | 145066 | 453749 | 7470 |
| small | Skill C | 1 / 2 | 1 / 2 | 123917 | 224596 | 4097 |
| small | Skill D | 0 / 2 | 0 / 2 | 92475.5 | 280394 | 4539 |
| small | Skill E | 1 / 2 | 1 / 2 | 116886 | 340610 | 7428 |
| medium | No-skill baseline | 1 / 2 | 4 / 6 | 154998.5 | 343903 | 8827 |
| medium | context-efficient-workflow | 0 / 2 | 2 / 6 | 103762.5 | 287812 | 5386 |
| medium | Skill A | 0 / 2 | 2 / 6 | 98660.5 | 317760 | 4086 |
| medium | Skill B | 0 / 2 | 2 / 6 | 73559 | 256351 | 3519 |
| medium | Skill C | 1 / 2 | 4 / 6 | 110308 | 406408 | 6312 |
| medium | Skill D | 1 / 2 | 4 / 6 | 103930 | 344591 | 4921 |
| medium | Skill E | 1 / 2 | 4 / 6 | 216259 | 573194 | 8132 |
| heavy | No-skill baseline | 0 / 2 | 16 / 24 | 124222 | 325453 | 6479 |
| heavy | context-efficient-workflow | 1 / 2 | 20 / 24 | 154573 | 557247 | 8128 |
| heavy | Skill A | 0 / 2 | 16 / 24 | 65823.5 | 255609 | 1684 |
| heavy | Skill B | 0 / 2 | 16 / 24 | 71731.5 | 254990 | 2297 |
| heavy | Skill C | 1 / 2 | 20 / 24 | 254382.5 | 508922 | 10705 |
| heavy | Skill D | 1 / 2 | 20 / 24 | 217840.5 | 779491 | 13928 |
| heavy | Skill E | 1 / 2 | 20 / 24 | 149630 | 448608 | 8219 |

## Full-task passes across batches

Each condition has five sessions per task across the two batches. These counts describe complete verifier passes, not individual test cases.

| Task | Condition | Attempt 03 | Attempt 04 | Combined |
|---|---|---:|---:|---:|
| small | No-skill baseline | 3 / 3 | 1 / 2 | 4 / 5 |
| small | context-efficient-workflow | 1 / 3 | 0 / 2 | 1 / 5 |
| small | Skill A | 1 / 3 | 0 / 2 | 1 / 5 |
| small | Skill B | 1 / 3 | 2 / 2 | 3 / 5 |
| small | Skill C | 2 / 3 | 1 / 2 | 3 / 5 |
| small | Skill D | 0 / 3 | 0 / 2 | 0 / 5 |
| small | Skill E | 0 / 3 | 1 / 2 | 1 / 5 |
| medium | No-skill baseline | 1 / 3 | 1 / 2 | 2 / 5 |
| medium | context-efficient-workflow | 1 / 3 | 0 / 2 | 1 / 5 |
| medium | Skill A | 1 / 3 | 0 / 2 | 1 / 5 |
| medium | Skill B | 0 / 3 | 0 / 2 | 0 / 5 |
| medium | Skill C | 1 / 3 | 1 / 2 | 2 / 5 |
| medium | Skill D | 1 / 3 | 1 / 2 | 2 / 5 |
| medium | Skill E | 0 / 3 | 1 / 2 | 1 / 5 |
| heavy | No-skill baseline | 2 / 3 | 0 / 2 | 2 / 5 |
| heavy | context-efficient-workflow | 1 / 3 | 1 / 2 | 2 / 5 |
| heavy | Skill A | 2 / 3 | 0 / 2 | 2 / 5 |
| heavy | Skill B | 0 / 3 | 0 / 2 | 0 / 5 |
| heavy | Skill C | 0 / 3 | 1 / 2 | 1 / 5 |
| heavy | Skill D | 0 / 3 | 1 / 2 | 1 / 5 |
| heavy | Skill E | 1 / 3 | 1 / 2 | 2 / 5 |

## Conclusions by task

### Small: dashboard overdue count

Across both batches, the no-skill baseline had the highest observed full-task pass rate: 4/5 (80%), compared with 3/5 for Skill B and Skill C, 1/5 for context-efficient-workflow, Skill A, and Skill E, and 0/5 for Skill D. In the latest batch alone, Skill B passed both runs while the baseline passed one, showing that the ordering changed between batches. There is one acceptance check per run here, so full-task and individual-check pass rates are identical.

For this small task, the combined results provide no evidence that adding a skill improved reliability over the baseline. Our context-efficient-workflow passed 1/5 runs overall and neither latest-batch run. In the latest batch it also used more input tokens and took longer than the baseline, although it used fewer output tokens. This observation is limited to the tested task and sessions.

### Medium: site filtering and pagination

Across both batches, the no-skill baseline, Skill C, and Skill D tied for the highest observed full-task pass rate at 2/5 (40%). Context-efficient-workflow, Skill A, and Skill E passed 1/5; Skill B passed 0/5. In the latest batch, the baseline, Skill C, Skill D, and Skill E each passed 4/6 individual checks and 1/2 complete tasks; the other conditions passed 2/6 checks and no complete tasks.

No tested skill exceeded the baseline's combined full-task pass rate on this task. Our context-efficient-workflow used fewer input and output tokens and had a shorter median duration in the latest batch, but also passed fewer checks and complete tasks. The lower resource use therefore does not establish an efficiency improvement at equivalent quality. No condition demonstrated consistently reliable completion.

### Heavy: full-stack dispatch workflow

In the latest batch, context-efficient-workflow, Skill C, Skill D, and Skill E each passed 20/24 individual checks (83.3%) and 1/2 complete tasks. The baseline, Skill A, and Skill B each passed 16/24 checks (66.7%) and no complete tasks. All four conditions with more passing checks also used more input and output tokens and had longer median durations than the baseline.

Across both batches, the baseline, context-efficient-workflow, Skill A, and Skill E tied at 2/5 full-task passes (40%); Skill C and Skill D passed 1/5, and Skill B passed 0/5. Our skill's latest-batch advantage therefore did not translate into a higher combined full-task pass rate than the baseline. The heavy-task results show a possible quality/resource tradeoff in the latest batch, but the small sample and changing outcomes do not establish a repeatable benefit or an overall winner.

These conclusions describe unofficial local observations. Results may differ in future runs, and neither individual-check totals nor full-task passes establish production readiness.

## Latest-batch totals and interpretation

| Condition | Full passes / runs | Checks passed / total | Check pass rate |
|---|---:|---:|---:|
| No-skill baseline | 2 / 6 | 21 / 32 | 65.6% |
| context-efficient-workflow | 1 / 6 | 22 / 32 | 68.8% |
| Skill A | 0 / 6 | 18 / 32 | 56.2% |
| Skill B | 2 / 6 | 20 / 32 | 62.5% |
| Skill C | 3 / 6 | 25 / 32 | 78.1% |
| Skill D | 2 / 6 | 24 / 32 | 75% |
| Skill E | 3 / 6 | 25 / 32 | 78.1% |

The no-skill baseline did not achieve a higher individual-check pass rate than every additional skill in the latest batch. Outcomes varied by task and condition, and full-task success differs from individual-check success. The combined check rate gives greater weight to the heavy task because it contains more checks; it is not an equally weighted task score.

With only two latest-batch sessions and five combined sessions per task and condition, these results do not establish a general winner or show that a skill caused the differences. Acceptance checks cover only the recorded requirements and do not establish production readiness or complete mobile runtime correctness.

See the [repository-owned skill report](README.md) for its separately published results and limitations.
