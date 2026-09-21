# Community Clinic Appointment Booking — Open Questions

> Draft, synthetic, and illustrative. These questions must be resolved by named stakeholders before the package can be approved or implementation-authorized.

| ID | Question or decision | Owner | Impact | Affected IDs | Needed by | Status |
|---|---|---|---|---|---|---|
| `OQ-001` | Which clinic services, appointment durations, time zones, and slot rules are in Release 1? | Clinic operations owner | Defines service catalogue, availability, and `FR-001` behavior. | `FR-001`, `BR-001`, `DEP-001` | Scope approval | Open |
| `OQ-002` | What privacy policy, retention period, deletion process, and data classification apply to appointment requests? | Privacy owner | Changes `NFR-004`, data lifecycle, support, and compliance work. | `NFR-004`, `RISK-002` | Before implementation authorization | Open |
| `OQ-003` | Which iOS/Android versions, devices, orientations, accessibility baseline, and localization/time-zone rules are supported? | Product and mobile leads | Defines `NFR-002`, `NFR-005`, test matrix, and release scope. | `CON-001`, `NFR-002`, `NFR-005` | Before release planning | Open |
| `OQ-004` | What current channels, baseline volumes, failure rates, and operational workarounds exist today? | Clinic operations owner | Needed to validate the problem and success measures. | `GOAL-001` | Before business approval | Open |
| `OQ-005` | Which success metrics, thresholds, analytics events, consent rules, and support signals are approved? | Product and privacy owners | Defines outcome measurement and observability. | `GOAL-001`, `NFR-001` | Before acceptance planning | Open |
| `OQ-006` | How do patients authenticate, recover accounts, and how are staff/support permissions authorized and audited? | Product and security owners | Defines access control, privacy, and identity dependencies. | `FR-001`, `NFR-004`, `DEP-001` | Before architecture approval | Open |
| `OQ-007` | Which identity, scheduling, availability, notification, and status systems are the systems of record, and what are their retry/idempotency contracts? | Technical owner and clinic operations owner | Defines integration, conflict handling, reconciliation, and failure recovery. | `FR-003`, `FR-005`, `NFR-003`, `DEP-001` | Before technical design | Open |
| `OQ-008` | Who is the acceptance authority, what review evidence is required, and what constitutes formal sign-off? | Business and product owners | Determines exit criteria and approval status. | All requirements | Before approval | Open |

## Resolution policy

Until each question is resolved, affected items remain Proposed or Open. A decision should record the date, decision-maker, evidence, affected IDs, and any requirement revision. No blank approval field should be interpreted as approval.
