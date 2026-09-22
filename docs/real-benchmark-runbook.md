# Real Context-Efficiency Benchmark Runbook

Use this runbook to compare a plain workflow with `context-efficient-workflow` using independent runs of the same task. The workflow is expected to stay lightweight for simple work and to use acceptance/contract gates only for heavy or risky work.

## Keep the comparison fair

Use the same:

- Stakeholder brief and attached files.
- Repository revision and working directory.
- Model, effort setting, permissions, and tool availability.
- Requested deliverables and quality criteria.
- Starting state: fresh conversation or equivalent cleared context.

Run A is the baseline. Do not invoke `context-efficient-workflow` or another context-optimization skill.

Run B is the candidate. Invoke `$context-efficient-workflow` explicitly and use the same task prompt.

Do not compare runs if the brief, model, available tools, or requested output changed materially. Record the difference as a limitation.

For API or stateful implementation tasks, define exact method/path, request fields, response keys/statuses, no-op and repeated-request behavior, bulk semantics, and side-effect counts in the task packet before running the comparison. Do not keep those contracts only in a hidden acceptance suite: an agent cannot fairly be judged for missing an unstated field name.

## Use the same task

Example task:

```text
Create a formal SRS for the mobile application from the supplied stakeholder notes. Separate Confirmed, Proposed, and Open information. Include functional and non-functional requirements, MoSCoW priorities, user stories, acceptance criteria, traceability, and open questions. Complete the quality gate and preserve Markdown as the canonical source.
```

For Run B, prepend:

```text
$context-efficient-workflow
```

Do not add optimization instructions to Run A.

## Capture each run

Record one JSON trace per run. Capture meaningful investigation phases, not every sentence. For each phase record:

- `toolCalls`: number of tool invocations.
- `inputChars`: prompt or retained context characters sent into the phase, when observable.
- `outputChars`: tool and extracted-result characters retained from the phase.
- `repeatedChars`: characters reread or repeated from earlier phases.
- `files`: files or artifact sections actually read.
- `verified`: whether the same requirements quality gate and deliverables were completed.

Start from `benchmarks/product-requirements/context-efficient-workflow.json` as a shape reference, but replace its synthetic values. Do not copy its numbers into a real result.

Record `durationMs` and a `quality` object when possible:

```json
"durationMs": 420000,
"quality": {
  "completenessScore": 4,
  "correctnessScore": 4,
  "missedRequirements": 0,
  "regressions": 0
}
```

Repeat each task three times for the plain workflow and three times for the context-efficient workflow. Keep the prompt and environment fixed, label each trace with its run number, and report the median or range rather than only one run.

## Generate the comparison

Run from the repository root:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\benchmark-context-workflow.ps1 `
  -Baseline .\benchmarks\product-requirements\real-plain.json `
  -Candidate .\benchmarks\product-requirements\real-context-efficient.json `
  -Output .\benchmarks\product-requirements\real-results.md `
  -JsonOutput .\benchmarks\product-requirements\real-results.json
```

Review the report for:

- Context and estimated-token reduction.
- Fewer tool calls or file reads.
- Reduced repeated content.
- Equal deliverable coverage and verification.
- Any quality, completeness, or latency regression.
- Whether patch conflicts, failed checks, or recovery loops occurred.
- Whether the task contract was explicit enough to distinguish an implementation defect from an underspecified oracle.

## Report honestly

For three or more tasks, pass the generated JSON files to `scripts/aggregate-benchmark-results.ps1` to produce one combined report. Report the range and any failures; do not generalize from one task.

Call the result an **observed-trace comparison**. Estimated tokens are a proxy based on characters divided by four, not exact provider billing. Do not generalize from one task. Repeat with at least three task types—such as requirements, debugging, and code review—and report the range and any failures.
