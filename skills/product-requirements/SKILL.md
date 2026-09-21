---
name: product-requirements
description: Create or audit a complete product documentation package from an idea, brief, existing system, or stakeholder notes. Use for software requirements, PRDs, business requirements, user stories, acceptance criteria, traceability, scope validation, and Web, Mobile, or Business Operations projects. Do not use for implementation planning when requirements are already approved.
---

# Product Requirements

Turn incomplete product intent into documentation that stakeholders can review and delivery teams can verify. Separate confirmed facts, reasoned proposals, and unresolved questions; never invent stakeholder decisions.

## Select the profile

Read only the references relevant to the work:

- Web products: [references/web.md](references/web.md)
- Mobile applications: [references/mobile.md](references/mobile.md)
- Business processes and operations: [references/business-operations.md](references/business-operations.md)

Read [references/quality-gate.md](references/quality-gate.md) before finalizing every package.

Use [assets/formal-product-documentation-template.md](assets/formal-product-documentation-template.md) as the controlled master-document structure for a formal deliverable. Tailor inapplicable sections explicitly instead of silently deleting them.

If a product spans profiles, read each applicable reference and merge overlapping concerns without duplicating requirements.

## Establish the evidence

Inspect the supplied brief, repository, existing documentation, screenshots, tickets, policies, and stakeholder notes. Label statements as:

- **Confirmed** — directly supported by supplied evidence or an explicit user decision.
- **Proposed** — a recommendation requiring approval.
- **Open** — missing information that materially affects scope, behavior, cost, risk, or acceptance.

Ask focused questions when answers would materially change the product. If the requester cannot answer, continue with explicit assumptions and keep them out of the confirmed requirements.

## Produce the package

Create only the artifacts the requester needs. For a formal engagement, use `docs/product/` unless another location is specified:

1. `product-requirements-document.md` — controlled BRD/SRS master covering the introduction, problem, current state, objectives, proposed solution, scope, stakeholders, requirements, delivery constraints, operations, validation, and approval.
2. `user-stories.md` — stories grouped by journey or capability, each linked to requirements and carrying testable acceptance criteria.
3. `traceability.md` — map goals → requirements → stories → acceptance criteria and tests; expose orphaned or uncovered items.
4. `open-questions.md` — unresolved decisions with owner, impact, target decision date, and affected requirement IDs.

Use stable IDs: `GOAL-###`, `FR-###`, `NFR-###`, `BR-###`, `UC-###`, `US-###`, `DATA-###`, `IF-###`, `CON-###`, `DEP-###`, `RISK-###`, and `OQ-###`. Preserve IDs during revisions; retire rather than silently reuse them.

Prioritize scope with MoSCoW:

- **Must Have** — the release fails its agreed objective, obligation, or safe operation without it.
- **Should Have** — important and expected, but a documented workaround or deferral is viable.
- **Could Have** — beneficial when capacity permits, with limited impact if omitted.
- **Won't Have (this release)** — explicitly excluded from the current release, not rejected forever.

Do not label every request Must Have. Record the rationale and decision owner for priority disputes.

## Write verifiable requirements

Each requirement must state one observable obligation, its rationale or source, MoSCoW priority, release target, dependencies, acceptance or verification method, and status. Avoid subjective terms such as “fast,” “intuitive,” or “secure” unless paired with a measurable threshold or an open decision.

Each user story must include:

- Actor, capability, and intended outcome.
- Linked requirement IDs.
- Preconditions and relevant business rules.
- Acceptance criteria covering the normal path, important boundary conditions, authorization, validation, and failure behavior.
- Dependencies and unresolved questions.

Use Given/When/Then when it makes behavior easier to test; do not force it onto purely qualitative or policy requirements.

## Audit instead of rewriting

When reviewing existing documentation, preserve its structure unless a change is necessary. Report gaps by severity, cite the affected section or ID, identify the delivery risk, and propose a concrete correction. Do not claim completeness until the quality gate passes.

## Render documents

Markdown is the canonical, reviewable source. When the requester asks for Word output and a DOCX-capable skill is installed, use it to render the approved package into a polished `.docx` with a title page, document status, revision date, table of contents, consistent headings, tables, and page numbers. Do not discard the Markdown source.

If no DOCX capability is available, complete the Markdown package and state that DOCX rendering remains pending. Do not install dependencies or another skill without authorization.

## Finish

Run the quality gate, summarize coverage and remaining decisions, and distinguish “documented” from “approved.” Requirements are approved only when the requester or designated stakeholder says so.
