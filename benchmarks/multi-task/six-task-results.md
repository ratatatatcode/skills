# 6-Task Context-Efficiency Benchmark

> These are controlled trace comparisons, not provider billing measurements. See the real benchmark runbook before drawing production-wide conclusions.

## Per-task results

| Task | Plain tokens | Context-efficient tokens | Reduction | Plain duration (ms) | Efficient duration (ms) | Verification |
|---|---:|---:|---:|---:|---:|---|
| product-requirements | 21525 | 8600 | 60% | 612000 | 428000 | True |
| evidence-first-debugging | 21650 | 8100 | 62.6% | 534000 | 361000 | True |
| risk-focused-code-review | 18675 | 8175 | 56.2% | 467000 | 319000 | True |
| full-stack-implementation | 34000 | 16625 | 51.1% | 1180000 | 821000 | True |
| large-document-data-analysis | 25800 | 10275 | 60.2% | 702000 | 486000 | True |
| browser-ui-debugging | 20425 | 8850 | 56.7% | 581000 | 392000 | True |

## Combined result

- Estimated tokens: 142075 -> 60625 (57.3% reduction).
- Recorded context characters: 568300 -> 242500 (57.3% reduction).
- Tool calls: 120 -> 60 (50% reduction).
- Recorded duration: 4076000 -> 2807000 ms (31.1% reduction).
- Average completeness score (5-point): 4.08 -> 4.08.
- Average correctness score (5-point): 4 -> 4.
- Missed requirements: 3 -> 3; regressions: 1 -> 1.
- Verification preserved in every task: **True**.

## Conclusion

The reduction appears across all 6 controlled traces, so the sample is less consistent with a single lucky task. It is still not proof of universal savings.

## Limitations and further benchmarking

- These are controlled traces and may not be fresh Codex executions.
- Estimated tokens use characters divided by four, not exact tokenizer, quota, cost, or latency measurements.
- Duration and quality values are meaningful only when measured consistently from real runs.
- Hidden system context, provider overhead, model variance, and sampling effects are not captured.
- Repeat every task at least three times for both workflows and add more task types before generalizing.
