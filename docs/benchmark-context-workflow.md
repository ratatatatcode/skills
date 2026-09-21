# Benchmarking Context-Efficient Workflow

The benchmark compares a recorded plain workflow with a recorded context-efficient workflow for the same task. It measures observable context volume rather than claiming access to hidden model billing or provider tokenization.

The included Product Requirements result is a **synthetic controlled sample**. It demonstrates the calculator and report format; it is not a measurement of a real Codex run.

## What it measures

- Tool calls.
- File reads and unique files read.
- Repeated file reads.
- Recorded input and output characters.
- Repeated characters.
- Estimated tokens, using `characters / 4` as a consistent proxy.
- Whether verification was completed in both traces.
- Optional duration and quality indicators: completeness, correctness, missed requirements, and regressions.

The benchmark is useful for comparing workflows under the same fixture. It is not an exact token, quota, cost, or latency measurement.

## Run the sample Product Requirements benchmark

From the repository root in PowerShell:

```powershell
.\scripts\benchmark-context-workflow.ps1 `
  -Baseline .\benchmarks\product-requirements\plain-workflow.json `
  -Candidate .\benchmarks\product-requirements\context-efficient-workflow.json `
  -Output .\benchmarks\product-requirements\sample-results.md `
  -JsonOutput .\benchmarks\product-requirements\sample-results.json
```

The two JSON files are controlled traces of the same Product Requirements task. The plain trace represents broad discovery, loading irrelevant profile references, and repeated package reads. The candidate trace represents targeted mobile-profile reads, bounded output, and a compact evidence summary.

For a real comparison, follow [Real benchmark runbook](real-benchmark-runbook.md) and replace these sample traces with observations from two equivalent runs.

## Using real traces

Record each workflow with the same task, input brief, expected deliverables, and verification checks. Add one step for each meaningful investigation phase:

```json
{
  "task": "product-requirements",
  "mode": "context-efficient",
  "verified": true,
  "notes": "Short explanation of the evidence strategy.",
  "steps": [
    {
      "name": "targeted intake",
      "toolCalls": 3,
      "inputChars": 1200,
      "outputChars": 6000,
      "repeatedChars": 0,
      "files": ["stakeholder-notes.md", "references/mobile.md"]
    }
  ]
}
```

Keep the task and success criteria constant between traces. Compare several representative tasks before generalizing the result, and report correctness or verification regressions alongside context reduction.

## Interpreting the report

The report answers: “How much observable work and context did these two recorded runs use?” It does not answer: “What exact amount did the model provider bill?” Exact token accounting requires provider-side instrumentation that this repository does not have.

## Limitations and encouragement

Treat controlled or synthetic traces as a demonstration, not proof. They may omit hidden system context, provider overhead, model variance, sampling effects, and real wall-clock behavior. Estimated tokens are only a character-based proxy, and quality or duration values are useful only when measured consistently.

To strengthen the evidence, run both workflows at least three times per task, keep the model and inputs fixed, add different task types, and report failures or quality regressions. Contributions of real, anonymized traces are welcome if they do not contain private prompts, credentials, or customer data.
