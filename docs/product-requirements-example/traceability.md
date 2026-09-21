# Community Clinic Appointment Booking — Traceability

> Draft, synthetic, and illustrative. “Covered” means the draft identifies verification evidence; it does not mean testing or approval has occurred.

## Goal-to-requirement-to-story matrix

| Goal | Requirement | Story/use case | Acceptance evidence or test | Release | Status |
|---|---|---|---|---|---|
| `GOAL-001` | `FR-001` | `UC-001`, `US-001` | Valid submission and confirmation test | Release 1 | Covered by proposed test |
| `GOAL-001` | `FR-002` | `US-001`, `US-003` | Missing-field and interruption tests | Release 1 | Covered by proposed test |
| `GOAL-001` | `FR-003` | `UC-001`, `US-001` | Slot-conflict rejection test | Release 1 | Covered by proposed test |
| `GOAL-001` | `FR-004` | `US-001`, `US-002` | Acknowledgement and rejection tests | Release 1 | Covered by proposed test |
| `GOAL-001` | `FR-005` | `US-001`, `US-003` | Retry and duplicate-submission test | Release 1 | Covered by proposed test |
| `GOAL-001` | `NFR-001` | — | Instrumented performance test under approved network profile | Release 1 | Non-story verification; profile open |
| `GOAL-001` | `NFR-002` | `US-001` | Accessibility matrix and assistive-technology test | Release 1 | Non-story verification; baseline open |
| `GOAL-001` | `NFR-003` | `US-003` | Fault-injection and reconciliation test | Release 1 | Covered by proposed test |
| `GOAL-001` | `NFR-004` | — | Privacy review and data-lifecycle test | Release 1 | Non-story verification; policy open |
| `GOAL-001` | `NFR-005` | `US-003` | Supported-device and connectivity matrix | Release 1 | Non-story verification; platform scope open |

## Acceptance evidence index

| Evidence ID | Evidence | Covers | Owner | Status |
|---|---|---|---|---|
| `TEST-001` | Valid request submission | `FR-001`, `FR-004`, `US-001` | QA owner — open | Planned |
| `TEST-002` | Missing field and preserved state | `FR-002`, `US-001` | QA owner — open | Planned |
| `TEST-003` | Slot conflict and alternate selection | `FR-003`, `US-001` | QA/operations — open | Planned |
| `TEST-004` | Retry and duplicate prevention | `FR-005`, `NFR-003`, `US-003` | QA/engineering — open | Planned |
| `TEST-005` | Accessibility coverage | `NFR-002`, `US-001` | Accessibility owner — open | Planned |
| `TEST-006` | Performance measurement | `NFR-001` | Engineering — open | Planned |
| `TEST-007` | Privacy and retention review | `NFR-004` | Privacy owner — open | Planned |
| `TEST-008` | Platform/connectivity matrix | `NFR-005`, `US-003` | Mobile QA — open | Planned |

## Coverage audit

- **Goals without requirements:** None in this draft; `GOAL-001` maps to `FR-001`–`FR-005` and `NFR-001`–`NFR-005`.
- **Requirements without verification:** None identified; non-story verification is explicitly recorded for quality, privacy, accessibility, and performance requirements.
- **Stories without requirements:** None; `US-001`–`US-003` link to requirements.
- **Tests without a justified requirement:** None; `TEST-001`–`TEST-008` map to requirements.
- **Coverage limitation:** Evidence is planned, not executed. Availability, identity, platform, privacy, and acceptance owners remain open.
