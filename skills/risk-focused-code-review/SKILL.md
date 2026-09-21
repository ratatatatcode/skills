---
name: risk-focused-code-review
description: Review diffs, pull requests, branches, commits, or implementations for evidence-backed correctness, security, data, performance, compatibility, and test risks. Remain read-only unless fixes or external review actions are explicitly requested.
---

# Risk-Focused Code Review

Review the behavior changed by the code, not just its appearance. Prioritize defects that could affect users, data, security, operations, or future changes.

## Establish review scope

1. Identify the repository, comparison base, requested files, and intended behavior.
2. Read applicable repository instructions and the smallest relevant specification or issue context.
3. Inspect the complete diff, including tests, configuration, migrations, generated artifacts, and dependency changes.
4. Trace changed behavior into relevant callers, consumers, schemas, and tests when the diff alone is insufficient.
5. Separate pre-existing problems from issues introduced or exposed by the reviewed change.

If the base or intent is ambiguous, state the comparison used and any assumption that affects the review.

## Review by risk

Check the applicable areas:

- Correctness: invalid states, boundary conditions, error paths, nullability, ordering, and partial failure.
- Regressions: changed contracts, callers, defaults, compatibility, migrations, and rollback behavior.
- Security and privacy: authorization, validation, injection, secret exposure, unsafe deserialization, path handling, and sensitive logging.
- Data integrity: transactions, idempotency, concurrency, duplication, loss, schema evolution, and retry behavior.
- Reliability: resource cleanup, timeouts, cancellation, error propagation, and observability.
- Performance: unbounded work, repeated I/O, inefficient queries, memory growth, and hot-path changes.
- Tests: missing regression cases, assertions that do not prove behavior, and important paths left unverified.
- Operations and documentation: configuration changes, deployment assumptions, monitoring, and user-facing contract changes.

Do not report subjective style preferences unless they materially obscure correctness or create a demonstrated maintenance risk.

## Require evidence for findings

A finding must:

1. Identify a concrete changed location.
2. Explain the failing condition or realistic scenario.
3. State the impact.
4. Connect the issue to evidence in the code or established contract.
5. Suggest the direction of a remedy without demanding an unrelated redesign.

Do not invent line numbers, runtime behavior, or requirements. When uncertain, record a question or verification gap instead of a defect.

Rank findings as:

- `Blocker`: likely catastrophic loss, critical security exposure, or change cannot safely ship.
- `High`: likely user-visible failure, data corruption, security bypass, or major regression.
- `Medium`: real defect with limited conditions or recoverable impact.
- `Low`: minor but actionable correctness, resilience, or maintainability risk.

Severity reflects impact and likelihood, not wording preference.

## Report findings first

Order findings by severity, then confidence. Use this format:

```text
[Severity] Short title — path:line
Condition: When this occurs.
Impact: What breaks or becomes unsafe.
Evidence: Why the change causes it.
Recommendation: Focused correction or test.
```

After the findings, include:

- Open questions or assumptions that could change the conclusions.
- Verification performed and checks that could not be run.
- A brief change summary.

If no actionable findings are supported, say so directly and note meaningful testing or environment gaps. Do not create filler findings.

## Action boundary

Review is read-only by default. Do not modify files, approve or reject a change, post review comments, add labels, or contact external services unless the user explicitly asks for that action. If fixes are requested after review, preserve the reported scope and verify each correction independently.
