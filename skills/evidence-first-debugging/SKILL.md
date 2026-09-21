---
name: evidence-first-debugging
description: Diagnose software failures, flaky tests, build errors, regressions, and unexpected behavior using reproducible evidence and falsifiable hypotheses. Use for debugging and root-cause investigation, not routine feature implementation.
---

# Evidence-First Debugging

Find the smallest proven cause before proposing or applying a fix. Prefer reversible, read-only investigation and preserve evidence throughout the process.

## Establish the failure

1. Record the expected behavior, actual behavior, exact error, environment, and known scope.
2. Reproduce the symptom with the narrowest reliable command or interaction available.
3. If reproduction is intermittent, capture frequency, timing, inputs, state, and environmental differences.
4. Separate confirmed facts from assumptions. Do not silently fill gaps with guesses.

If reproduction is unsafe or unavailable, analyze the strongest existing evidence and state the resulting confidence limit.

## Collect focused evidence

Inspect only evidence relevant to the failing path:

- Error output, stack traces, logs, and failing assertions.
- The changed code and recent relevant history.
- Inputs and outputs at component boundaries.
- Configuration, dependency, runtime, and platform differences.
- Nearby tests and callers that define the intended behavior.

Redact credentials, tokens, personal data, and private endpoints from commands and reports.

## Isolate the cause

1. Trace the failure backward from the first incorrect observable state.
2. List a small set of hypotheses ranked by evidence and impact.
3. For each hypothesis, predict an observation that would support it and one that would disprove it.
4. Run one discriminating experiment at a time. Avoid changing several variables together.
5. Reduce the reproduction until the responsible boundary, input, or change is clear.
6. Call something the root cause only when it explains the symptom and the evidence distinguishes it from plausible alternatives.

When evidence is incomplete, report the leading hypothesis and the next cheapest experiment instead of presenting certainty.

## Fix and verify

Apply a fix only when the user requested implementation. Make the smallest change that addresses the demonstrated cause, then:

1. Add or update a regression test that fails for the original defect.
2. Run the narrow reproduction and relevant targeted tests.
3. Run the appropriate broader checks when risk warrants it.
4. Confirm the fix did not merely hide the error, weaken validation, or suppress useful diagnostics.
5. Document any unverified environment, edge case, or follow-up risk.

## Safety boundaries

- Start with read-only checks, especially in production or shared environments.
- Never delete application data, cloud-synced data, containers, caches, databases, or user settings as a default diagnostic step.
- Do not reset repositories, reinstall systems, rotate credentials, or mutate production without explicit authorization, an exact validated target, and a recovery plan.
- Do not download or execute an unknown script merely to reproduce a problem.
- Preserve logs and other transient evidence before any authorized cleanup.
- Stop before a materially destructive or externally visible action and explain why it would be necessary.

## Report format

Return a compact investigation record:

```text
Symptom:
Reproduction:
Evidence:
Root cause or leading hypothesis:
Confidence:
Fix or next experiment:
Verification:
Remaining risks:
```

Avoid random fix lists, unsupported certainty, and claims that an issue is solved without verification.
