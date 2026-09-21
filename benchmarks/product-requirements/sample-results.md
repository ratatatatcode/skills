# Context-Efficient Workflow Benchmark

> This is a synthetic controlled sample generated from example traces. It demonstrates the benchmark format and calculator; it is not a measurement from two real Codex runs.

Task: **product-requirements**
Generated: **2026-09-21T07:32:09.5839946Z**

## Method

This report compares two recorded traces for the same task:

- **Plain workflow:** broad reads and repeated context collection without the context-efficient workflow.
- **Context-efficient workflow:** targeted reads, bounded output, and a compact working summary.

Token counts are estimates: observed input and output characters divided by four. They are useful for comparing these traces, but they are not exact model-token, quota, cost, or latency measurements.

## Results

| Metric | Plain workflow | Context-efficient workflow | Reduction |
|---|---:|---:|---:|
| Tool calls | 18 | 8 | 55.6% |
| File reads | 24 | 13 | 45.8% |
| Unique files read | 17 | 8 | - |
| Repeated file reads | 7 | 5 | - |
| Observed context characters | 86100 | 34400 | 60% |
| Repeated characters | 25300 | 4700 | 81.4% |
| Estimated tokens (proxy) | 21525 | 8600 | 60% |
| Duration (ms, if recorded) | 612000 | 428000 | 30.1% |
| Completeness score | 4.5 | 4.5 | - |
| Correctness score | 4.5 | 4.5 | - |
| Missed requirements | 1 | 1 | - |
| Regressions | 0 | 0 | - |
| Verification completed | True | True | Preserved: True |

## Trace notes

**Plain workflow:** The workflow scanned the full project, loaded all product-profile references, reread the stakeholder notes while drafting, and reread the complete package during quality review.

**Context-efficient workflow:** The workflow inspected the mobile profile, quality gate, template, and stakeholder notes first; it expanded only to the required package files and retained a compact evidence summary.

## Interpretation

The candidate trace uses less recorded context while preserving verification. This demonstrates reduced observed context for this fixture; it does not prove a universal percentage for all tasks. Use several representative traces before making a performance or cost claim.

## Limitations and next steps

- These traces may be synthetic or manually recorded rather than fresh Codex executions.
- Estimated tokens use characters divided by four; they are not exact tokenizer, quota, cost, or latency measurements.
- Duration and quality values are only meaningful when measured consistently from real runs.
- Hidden system context, provider tool overhead, model variance, and sampling effects are not captured.
- Repeat each task at least three times for both workflows, then add more task types before generalizing the result.
