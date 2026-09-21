# Product Requirements Example: Community Clinic Appointment Booking

> Status: illustrative synthetic draft — not stakeholder-approved and not a real customer engagement.

This folder is a complete example of the package produced by the `product-requirements` skill. It gives users a realistic business idea to test instead of a one-line feature request.

## Business draft

A fictional community clinic wants patients to request appointments from a mobile app. The clinic has not yet decided which services and appointment durations belong in the first release, which scheduling system is authoritative, how patients authenticate, what data-retention policy applies, or which mobile platforms and accessibility baseline are supported.

The initial product idea is intentionally incomplete. A good requirements workflow should preserve the stated need, label design recommendations as proposed, and turn missing decisions into owned open questions instead of inventing answers.

## Recommended test prompt

Copy and paste this prompt into Codex with the `product-requirements` skill enabled:

```text
$product-requirements

Use the business draft below to create a formal, reviewable requirements package for a fictional community clinic appointment-booking mobile app.

Business draft:
- Patients need a mobile way to request clinic appointments.
- Release 1 should be explored around authenticated patients selecting a service and available appointment slot, submitting one request, and receiving a clear outcome.
- The clinic has not decided its service catalogue, appointment durations, availability source, authentication method, retention policy, supported iOS/Android versions, accessibility baseline, or acceptance authority.
- Do not assume that an appointment request is the same as a confirmed appointment.

Separate confirmed input, proposed decisions, assumptions, and open questions. Produce:
1. A BRD/SRS master document.
2. User stories with Given/When/Then acceptance criteria covering normal, validation, conflict, retry, authorization, accessibility, and failure paths.
3. A traceability matrix from goals to requirements to stories and verification evidence.
4. An open-questions register with owner, impact, affected IDs, and decision deadline.

Use stable requirement IDs, MoSCoW priorities, measurable non-functional requirements, and explicit draft status. Consider mobile lifecycle, poor connectivity, duplicate submission, privacy, data retention, accessibility, supported platforms, integrations, observability, rollout, and rollback. Run the quality gate and report Pass, Pass with open decisions, or Not ready. Do not claim stakeholder approval or invent business decisions. Keep Markdown canonical under docs/product-requirements-example/.
```

## Expected result

The response should produce or update these reviewable artifacts:

- [`product-requirements-document.md`](product-requirements-document.md) — scope, objectives, solution proposal, requirements, constraints, operations, validation, and approval status.
- [`user-stories.md`](user-stories.md) — user journeys linked to requirements with testable acceptance criteria.
- [`traceability.md`](traceability.md) — goals, requirements, stories, acceptance evidence, and coverage.
- [`open-questions.md`](open-questions.md) — unresolved decisions with owners and impacts.

The quality-gate result should be `Pass with open decisions`, not `Approved`, because the business draft deliberately leaves material decisions unresolved.

## What to verify in the output

Check that the generated package:

- distinguishes confirmed input from proposals and open decisions;
- does not treat a request as a confirmed appointment;
- includes validation, slot-conflict, network-failure, retry, and duplicate-submission behavior;
- records supported platforms and accessibility as decisions rather than assumptions;
- gives each requirement a source, priority, release, dependency, status, and verification method;
- connects every goal and requirement through traceability or non-story verification;
- identifies privacy, retention, authentication, integration, support, rollout, and rollback concerns;
- preserves draft status and names the stakeholder decisions required for approval.

## Existing rendered examples

- [`Community-Clinic-Appointment-Booking-Requirements-Draft.docx`](Community-Clinic-Appointment-Booking-Requirements-Draft.docx)
- [`Community-Clinic-Appointment-Booking-Requirements-Draft.pdf`](Community-Clinic-Appointment-Booking-Requirements-Draft.pdf)

These rendered files are convenience previews. The Markdown files remain the canonical, editable source.
