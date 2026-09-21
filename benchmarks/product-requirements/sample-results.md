# Product Requirements Sample Results

> This public-facing example is illustrative and synthetic. It is not evidence of stakeholder approval, a real customer engagement, or a real benchmark run.

## Public Sample Results

This compact example shows the kind of package a prospective user can request from `$product-requirements`. It uses a fictional mobile appointment-booking product and deliberately distinguishes confirmed input, proposed requirements, and open decisions.

### Example input prompt

```text
$product-requirements

Create a formal requirements package for a mobile appointment-booking app for a community clinic from the supplied stakeholder brief. Separate confirmed facts, proposed decisions, and open questions. Include MoSCoW priorities, functional and non-functional requirements, user stories with testable acceptance criteria, traceability, and a quality-gate review. Keep Markdown canonical under docs/product/ and do not imply stakeholder approval.
```

### Example generated result

The package records the clinic's confirmed need for patients to request appointments from a mobile app, proposes an appointment-request workflow for the first release, and leaves provider availability rules and retention duration open rather than inventing decisions.

Expected artifact tree:

```text
docs/product/
├── product-requirements-document.md
├── user-stories.md
├── traceability.md
└── open-questions.md
```

### Requirements excerpt

| ID | Example requirement | Priority | Verification | Status |
|---|---|---|---|---|
| `GOAL-001` | Enable patients to request a clinic appointment from a supported mobile device. | Must Have | Goal-to-requirement trace review | Proposed |
| `FR-001` | The app shall allow an authenticated patient to select a clinic service, choose an available appointment slot, and submit one appointment request. | Must Have | Mobile acceptance test covering valid submission | Proposed |
| `FR-002` | The app shall show a validation error and preserve entered data when a required service or slot is missing. | Must Have | Negative-path acceptance test | Proposed |
| `NFR-001` | The appointment request confirmation shall be displayed within 3 seconds after the server acknowledges a successful submission under the supported network profile. | Should Have | Instrumented test on the agreed device/network matrix | Proposed |

`FR-001` is a proposal derived from the brief, not a confirmed stakeholder decision. The package would also record its rationale, release, dependencies, and any applicable authorization, failure, recovery, privacy, accessibility, and operational considerations.

### User story and acceptance criteria excerpt

**`US-001` — Request an appointment**

As an authenticated patient, I want to select a service and available slot so that I can request care without calling the clinic.

- Links: `GOAL-001`, `FR-001`, `FR-002`
- Preconditions: the patient is signed in; the service catalogue and slot list are available.
- Business rule: a patient may not submit the same slot twice while a prior request is pending.

Acceptance criteria:

```gherkin
Given I am signed in and have selected a service and available slot
When I submit the appointment request
Then the app shows a confirmation with the request identifier
And the selected slot is no longer offered to me as available

Given I have not selected a service or slot
When I submit the request
Then the app identifies the missing field
And preserves my other entered selections

Given the server rejects the request because the slot was taken
When the rejection is returned
Then the app explains that the slot is unavailable
And lets me choose another slot without duplicating the request
```

### Traceability excerpt

| Goal | Requirement | Story | Acceptance evidence | Coverage |
|---|---|---|---|---|
| `GOAL-001` | `FR-001` | `US-001` | Successful submission and confirmation test | Covered |
| `GOAL-001` | `FR-002` | `US-001` | Missing-field and slot-conflict tests | Covered |
| `GOAL-001` | `NFR-001` | — | Instrumented performance test | Covered by non-story verification |

The complete `traceability.md` would also identify orphaned requirements, uncovered goals, dependencies, and test evidence that is still planned.

### Quality gate and open questions

**Quality-gate result: Pass with open decisions.** The sample demonstrates atomic, prioritized, and verifiable requirements; user-story coverage; traceability; and explicit evidence labels. It is not ready for approval until the open decisions below are resolved and the designated stakeholder reviews the package.

| ID | Open question | Owner | Impact | Target decision |
|---|---|---|---|---|
| `OQ-001` | Which clinic services and appointment durations are in the first release? | Clinic operations owner | Changes the service catalogue and slot rules for `FR-001`. | Before scope approval |
| `OQ-002` | What retention period and deletion process apply to appointment requests? | Privacy owner | Changes data lifecycle and operational requirements. | Before implementation authorization |
| `OQ-003` | Which iOS and Android versions and accessibility baseline are supported? | Product and mobile leads | Changes test devices, compatibility, and acceptance coverage. | Before release planning |

Requirements in this example are documented proposals, not approved requirements. The example is synthetic and does not claim stakeholder sign-off or benchmark performance.

---

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
