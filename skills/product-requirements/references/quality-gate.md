# Product Documentation Quality Gate

Complete this review before describing a package as complete.

## Evidence and scope

- Document control identifies the owner, version, status, classification, revision date, target release, reviewers, and approval state.
- The introduction states the document purpose, intended audience, background, conventions, references, and glossary.
- The problem, intended outcomes, users, stakeholders, constraints, assumptions, and exclusions are explicit.
- The current state and proposed solution are distinguishable, alternatives are recorded when material, and unapproved design choices are labeled proposed.
- Current-release scope, future considerations, and Must/Should/Could/Won't Have classifications are explicit and rationalized.
- Confirmed facts are traceable to evidence; proposals and open decisions are visibly labeled.
- Terms with domain-specific meanings are defined consistently.

## Requirements quality

- Every requirement is atomic, necessary, feasible enough to assess, unambiguous, prioritized, and verifiable.
- Each requirement records its source or rationale, MoSCoW priority, release, dependencies, verification method, and status.
- Functional behavior includes authorization, validation, boundary conditions, failure, recovery, and relevant state transitions.
- Non-functional expectations have measurable targets or are recorded as open decisions.
- Roles, business rules, data lifecycle, integrations, security, privacy, compliance, accessibility, and operational ownership were considered.
- Platform support, technical constraints, environments, testing, deployment, rollback, compatibility, migration, maintenance, support, training, and organizational change were considered.

## Stories and coverage

- Stories express user or operational value rather than implementation tasks.
- Acceptance criteria are testable and cover meaningful negative paths.
- Every in-scope goal maps to requirements; every requirement maps to delivery or an explicit non-story verification method.
- The traceability matrix connects goals, requirements, use cases or stories, acceptance evidence, releases, and status.
- Duplicate, conflicting, orphaned, and circular requirements are resolved or reported.

## Delivery readiness

- Dependencies, risks, migration, rollout, support, observability, and success measures are addressed when applicable.
- Open questions identify an owner, impact, and decision deadline.
- Acceptance authority, review method, entry/exit criteria, retained evidence, accepted exceptions, and formal sign-off are explicit.

Report the gate as `Pass`, `Pass with open decisions`, or `Not ready`. List every blocking item; do not hide uncertainty behind a percentage score.
