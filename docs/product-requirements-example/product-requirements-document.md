# Community Clinic Appointment Booking

## Document control

| Field | Value |
|---|---|
| Document type | Business Requirements Document / Software Requirements Specification |
| Document owner | Product requirements workstream |
| Business owner | Open — clinic operations owner |
| Product owner | Open — product owner |
| Technical owner | Open — mobile engineering owner |
| Version | 0.1 |
| Status | Draft |
| Classification | Illustrative synthetic example |
| Created | 2026-09-21 |
| Last revised | 2026-09-21 |
| Target release | Release 1 — proposed |

> This package is synthetic and illustrative. It is not evidence of stakeholder approval, real customer research, a real implementation commitment, or benchmark performance. Blank approval fields do not imply approval.

### Revision history

| Version | Date | Author | Change summary | Review status |
|---|---|---|---|---|
| 0.1 | 2026-09-21 | Codex | Initial synthetic requirements package | Draft; not approved |

### Review and approval

| Role | Name | Decision | Date | Conditions or comments |
|---|---|---|---|---|
| Clinic operations owner | Open | Pending | — | Must review service and scheduling scope |
| Product owner | Open | Pending | — | Must approve proposed Release 1 scope |
| Privacy owner | Open | Pending | — | Must decide retention and deletion |

## 1. Introduction

### 1.1 Purpose

Define a reviewable, testable proposal for a mobile application through which authenticated clinic patients can request appointments. This document governs requirements review for the fictional Release 1 scenario.

### 1.2 Intended audience

The intended audience is the fictional clinic operations owner, product owner, mobile and service engineering teams, quality assurance, privacy, accessibility, support, and stakeholders reviewing the synthetic example.

### 1.3 Background

The supplied synthetic scenario describes a mobile appointment-booking product for a community clinic. It states that patients need to request appointments from a mobile device. Details not stated in the scenario are proposals or open questions below.

### 1.4 Document conventions

`Confirmed input` means directly stated by the synthetic scenario; it does not mean stakeholder-confirmed. `Proposed` means a recommendation requiring approval. `Open` means material information is missing. IDs are stable. Priorities use Must Have, Should Have, Could Have, and Won't Have (this release).

### 1.5 References

- `benchmarks/product-requirements/sample-results.md` — synthetic working brief and sample evidence.
- `skills/product-requirements/assets/formal-product-documentation-template.md` — controlled structure.
- `skills/product-requirements/references/mobile.md` — mobile concerns.
- `skills/product-requirements/references/quality-gate.md` — quality-gate criteria.

### 1.6 Glossary

| Term | Definition |
|---|---|
| Appointment request | A patient-submitted request for a service and available slot; it is not assumed to be a confirmed appointment. |
| Slot | A time option offered by the scheduling source. Availability ownership is open. |
| Release 1 | The proposed first release described in this draft. |

## 2. Executive summary

The synthetic scenario proposes enabling patients to request clinic appointments from a mobile app. Release 1 proposes authentication, service and slot selection, request submission, confirmation, validation, and slot-conflict handling. Provider availability rules, supported device versions, data retention, accessibility baseline, notifications, and approval authority remain open. The package is `Pass with open decisions`, not approved.

## 3. Business context

### 3.1 Problem statement

**Confirmed input from the synthetic scenario:** patients need a mobile way to request clinic appointments. The scenario does not provide a current-state baseline, volume, failure rate, or evidence of a real clinic problem.

### 3.2 Current state

Current appointment-request channels, existing systems, manual workarounds, and baseline measures are **Open** (`OQ-004`). They must not be inferred from this synthetic brief.

### 3.3 Goals and objectives

| ID | Goal | Measure | Baseline | Target | Measurement owner |
|---|---|---|---|---|---|
| `GOAL-001` | Enable patients to request clinic appointments from a supported mobile device. | Successful request completion in acceptance testing | Open | Proposed Release 1 journey passes | Product owner |

### 3.4 Success measures

Release 1 should measure request completion, validation failures, slot conflicts, duplicate submissions, crash rate, and support contacts. Baselines, thresholds, instrumentation, and privacy constraints are open (`OQ-005`).

### 3.5 Stakeholders

| Stakeholder or role | Interest | Responsibility | Decision authority | Engagement needed |
|---|---|---|---|---|
| Patients | Request care | Use the mobile journey; provide usability input | Open | Usability and acceptance review |
| Clinic operations owner | Scheduling policy | Define services, durations, and availability | Open | Scope and business-rule approval |
| Product owner | Outcome and scope | Prioritize Release 1 | Open | Requirements approval |
| Privacy owner | Patient data | Define retention, deletion, and privacy controls | Open | Privacy review |
| Mobile engineering owner | Delivery and support | Confirm platform feasibility | Open | Technical review |

## 4. Solution overview

### 4.1 Proposed solution

Provide a mobile flow where an authenticated patient selects a clinic service, selects an available slot, submits one request, and receives a confirmation or actionable validation/conflict message.

### 4.2 Product boundary

The app owns patient interaction, validation feedback, request submission, and confirmation display. The source of truth for service availability, scheduling, identity, notifications, and patient records is not specified and remains open.

### 4.3 Alternatives considered

| Alternative | Benefits | Costs or risks | Decision |
|---|---|---|---|
| Keep phone-only requests | No new app | Does not address the synthetic mobile objective | Not selected for this proposal |
| Mobile appointment request flow | Directly addresses the stated scenario | Requires identity, scheduling, privacy, and support decisions | Proposed |

## 5. Scope and release strategy

### 5.1 In scope — proposed

- Authenticated patient access.
- Service and available-slot selection.
- Single appointment-request submission.
- Validation, confirmation, and slot-conflict recovery.
- Mobile accessibility, connectivity, lifecycle, and support considerations.

### 5.2 Out of scope — Release 1 proposal

Provider roster management, payment, clinical records, diagnosis, emergency triage, appointment cancellation/rescheduling, and multi-clinic administration are excluded unless approved through scope change.

### 5.3 MoSCoW summary

| Priority | Included items | Rationale | Decision owner |
|---|---|---|---|
| Must Have | Authenticated request flow, required-field validation, conflict handling | Core objective and safe failure behavior | Product owner |
| Should Have | Confirmation within 3 seconds after successful server acknowledgement; measurable support diagnostics | Important quality and support outcomes, but thresholds need approval | Product and engineering owners |
| Could Have | Optional push or email notification; saved preferences | Useful but not required for initial request submission | Product owner |
| Won't Have (this release) | Payments, clinical records, provider administration | Outside the proposed first-release objective | Product owner |

## 6. Users, actors, and permissions

| Role | View | Create | Update | Delete | Administrative actions |
|---|---|---|---|---|---|
| Authenticated patient | Own services, slots, and requests | Own appointment request | Open | Open | None |
| Clinic operations staff | Open | Open | Open | Open | Define services and availability — open |
| Support staff | Open | Open | Open | Open | Diagnostic access — open |

Authentication method, authorization boundaries, account recovery, and staff access are open (`OQ-006`).

## 7. Assumptions, constraints, dependencies, and risks

| ID | Type | Statement | Status |
|---|---|---|---|
| `CON-001` | Constraint | The proposal must support mobile use; exact iOS/Android versions are open. | Proposed |
| `DEP-001` | Dependency | A trusted service must provide service and slot availability and accept requests. | Open |
| `RISK-001` | Risk | Stale or concurrently claimed slots could produce duplicate or misleading requests. | Open; mitigation requires scheduling design |
| `RISK-002` | Risk | Undefined patient-data retention could create privacy and operational exposure. | Open; privacy review required |

## 8. Journey and use case

### `UC-001` — Submit an appointment request

Actor: authenticated patient. Trigger: patient selects a service and available slot. Preconditions: identity is valid and availability data is accessible. Normal flow: select service → select slot → submit → service validates and records one request → app shows confirmation identifier. Exceptions: missing selection, expired slot, duplicate pending request, network failure, or service rejection. Postcondition: a recorded request exists or the patient receives an actionable failure without an unintended duplicate.

## 9. Business rules

| ID | Rule | Source or owner | Verification |
|---|---|---|---|
| `BR-001` | A request requires a service and slot selection. | Proposed; product owner | Validation test |
| `BR-002` | A patient must not create a duplicate request for the same slot while a prior request is pending. | Proposed; clinic operations owner | Duplicate-submission test |
| `BR-003` | A slot conflict must not be reported as a successful request. | Proposed; clinic operations owner | Conflict test |

## 10. Functional requirements

| ID | Requirement | Rationale/source | MoSCoW | Release | Dependencies | Verification | Status |
|---|---|---|---|---|---|---|---|
| `FR-001` | The app shall allow an authenticated patient to select a clinic service, choose an available slot, and submit one appointment request. | Synthetic scenario; core objective | Must Have | Release 1 | `DEP-001`, `OQ-006` | Valid submission test | Proposed |
| `FR-002` | The app shall identify each missing required selection and preserve other entered selections when submission validation fails. | Synthetic sample; validation behavior | Must Have | Release 1 | `BR-001` | Missing-field test | Proposed |
| `FR-003` | The app shall show a conflict message and offer another slot when the selected slot is unavailable at submission time. | Synthetic sample; boundary/failure behavior | Must Have | Release 1 | `BR-003`, `DEP-001` | Slot-conflict test | Proposed |
| `FR-004` | The app shall show a confirmation containing a request identifier only after the service acknowledges a successful request. | Prevents false confirmation | Must Have | Release 1 | `DEP-001` | Success and service-rejection tests | Proposed |
| `FR-005` | The app shall prevent a repeated submission from creating a duplicate pending request for the same slot. | `BR-002`; data integrity | Must Have | Release 1 | `DEP-001` | Retry and duplicate test | Proposed |

## 11. Non-functional requirements

| ID | Category | Requirement and target | Measurement | MoSCoW | Release | Status |
|---|---|---|---|---|---|---|
| `NFR-001` | Performance | Confirmation should display within 3 seconds after successful server acknowledgement under the agreed network profile. | Instrumented device/network test | Should Have | Release 1 | Proposed; profile open |
| `NFR-002` | Accessibility | The request journey shall meet the accessibility baseline selected for supported mobile platforms, including labels, focus order, contrast, and error announcement. | Accessibility test matrix | Must Have | Release 1 | Open baseline (`OQ-003`) |
| `NFR-003` | Reliability | A transient network failure shall not cause an unacknowledged request to be silently retried as a duplicate. | Fault-injection and reconciliation test | Must Have | Release 1 | Proposed |
| `NFR-004` | Privacy | Collection, retention, deletion, and access to appointment-request data shall follow the approved clinic privacy policy. | Privacy review and data-lifecycle test | Must Have | Release 1 | Open policy (`OQ-002`) |
| `NFR-005` | Compatibility | The app shall be tested on the supported iOS and Android versions, devices, orientations, and connectivity states approved for Release 1. | Compatibility matrix | Should Have | Release 1 | Open platform scope (`OQ-003`) |

## 12. Data requirements

The likely entities are Patient Identity, Service, Slot, Appointment Request, and Request Event. Ownership, classification, retention, deletion, audit, and system of record are open (`OQ-002`, `OQ-006`). Do not store clinical records in this proposed scope.

## 13. Interfaces and integrations

An identity service and scheduling/availability service are proposed dependencies. Interface contracts, authentication, availability, retry semantics, and ownership are open (`OQ-006`, `OQ-007`).

## 14. Mobile experience and operations

The design must address first launch, sign-in, lifecycle interruption, poor connectivity, retry, keyboard and safe-area behavior, localization/time zones, dark mode, accessibility services, crash reporting, consent, support diagnostics, staged rollout, and rollback. Exact choices are proposals or open decisions until platform and operations owners review them.

## 15. Validation and acceptance strategy

Review entry criteria: source scenario is available, IDs are stable, and owners are assigned. Exit criteria: requirements are reviewed, open decisions have owners and dates, all goals map to requirements, every requirement has verification, and mobile compatibility/accessibility evidence is retained. Acceptance authority is open (`OQ-008`).

## 16. Final readiness and approval status

**Quality-gate result: Pass with open decisions.** The package demonstrates explicit evidence labels, scope, MoSCoW priorities, atomic requirements, testable stories, traceability, and open-question ownership. It is not approved and is not ready for implementation authorization until the blocking open decisions are resolved and the designated stakeholders sign off.

See [`user-stories.md`](user-stories.md), [`traceability.md`](traceability.md), and [`open-questions.md`](open-questions.md).
