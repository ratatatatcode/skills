# [Product or Initiative Name]

## Document control

| Field | Value |
|---|---|
| Document type | Business Requirements Document / Software Requirements Specification |
| Document owner | [Name or role] |
| Business owner | [Name or role] |
| Product owner | [Name or role] |
| Technical owner | [Name or role] |
| Version | [Version] |
| Status | Draft / In Review / Approved / Superseded |
| Classification | Public / Internal / Confidential / Restricted |
| Created | [Date] |
| Last revised | [Date] |
| Target release | [Release or date] |

### Revision history

| Version | Date | Author | Change summary | Review status |
|---|---|---|---|---|

### Review and approval

| Role | Name | Decision | Date | Conditions or comments |
|---|---|---|---|---|

Approval means the named stakeholders accept the documented scope and requirements. Blank approval fields do not imply approval.

## 1. Introduction

### 1.1 Purpose

State why this document exists and which decision or delivery effort it governs.

### 1.2 Intended audience

Identify business owners, product, design, engineering, quality, security, operations, support, vendors, or regulators who should use it.

### 1.3 Background

Summarize the relevant organizational, customer, market, regulatory, or technical context.

### 1.4 Document conventions

Define requirement keywords, identifiers, priorities, evidence labels, and status meanings.

### 1.5 References

List source briefs, research, policies, contracts, standards, repositories, designs, and earlier decisions with stable links or locations.

### 1.6 Glossary and acronyms

| Term | Definition |
|---|---|

## 2. Executive summary

Summarize the problem, affected users or operations, desired outcome, proposed solution direction, current-release scope, principal risks, and unresolved decisions.

## 3. Business context

### 3.1 Problem statement

Describe the observable problem, who experiences it, its frequency or scale, and the evidence that it exists. Do not embed the preferred solution in the problem statement.

### 3.2 Current state

Describe the existing journey, process, systems, workarounds, costs, failure points, and baseline measures.

### 3.3 Goals and objectives

| ID | Goal | Measure | Baseline | Target | Measurement owner |
|---|---|---|---|---|---|

### 3.4 Success metrics

Define outcome, adoption, quality, operational, and guardrail measures, including when and how each will be assessed.

### 3.5 Stakeholders

| Stakeholder or role | Interest | Responsibility | Decision authority | Engagement needed |
|---|---|---|---|---|

## 4. Solution overview

### 4.1 Proposed solution

Describe the proposed capability and how it addresses the problem without presenting unapproved design choices as requirements.

### 4.2 Product or process boundary

Identify what the solution controls, what remains external, and the principal actors and systems around it.

### 4.3 Alternatives considered

| Alternative | Benefits | Costs or risks | Decision and rationale |
|---|---|---|---|

## 5. Scope and release strategy

### 5.1 In scope

List capabilities and outcomes included in the initiative.

### 5.2 Out of scope

List explicit exclusions and explain ambiguous boundaries.

### 5.3 Current release

Define the minimum coherent outcome for this release.

### 5.4 Future considerations

Record deferred possibilities without treating them as committed requirements.

### 5.5 MoSCoW summary

| Priority | Included items | Rationale | Decision owner |
|---|---|---|---|
| Must Have | | | |
| Should Have | | | |
| Could Have | | | |
| Won't Have (this release) | | | |

## 6. Users, actors, and permissions

### 6.1 Personas or operational roles

Describe goals, context, capabilities, constraints, and accessibility needs using available evidence.

### 6.2 Role and permission matrix

| Role | View | Create | Update | Approve | Delete | Export | Administrative actions |
|---|---|---|---|---|---|---|---|

## 7. Assumptions, constraints, dependencies, and risks

### 7.1 Assumptions

| ID | Assumption | Validation owner | Due date | Impact if false | Status |
|---|---|---|---|---|---|

### 7.2 Constraints

| ID | Constraint | Source | Impact | Verification |
|---|---|---|---|---|

### 7.3 Dependencies

| ID | Dependency | Owner | Needed by | Failure impact | Mitigation | Status |
|---|---|---|---|---|---|---|

### 7.4 Risk register

| ID | Risk | Likelihood | Impact | Owner | Mitigation | Trigger or contingency | Status |
|---|---|---|---|---|---|---|---|

## 8. Journeys, processes, and use cases

### 8.1 Journey or process overview

Describe the start condition, normal flow, handoffs, decisions, end condition, and measurable outcome. Add a diagram when it materially improves understanding.

### 8.2 Use cases

For each `UC-###`, record the actor, objective, trigger, preconditions, normal flow, alternate flows, exceptions, postconditions, business rules, data involved, and linked requirements.

## 9. Business rules

| ID | Rule | Source or owner | Applies when | Exceptions | Verification |
|---|---|---|---|---|---|

## 10. Functional requirements

| ID | Requirement | Rationale/source | MoSCoW | Release | Dependencies | Verification | Status |
|---|---|---|---|---|---|---|---|

Write each `FR-###` as one observable system or process obligation. Include authorization, validation, state transitions, boundary conditions, failure, recovery, and audit behavior where applicable.

## 11. Non-functional requirements

Use measurable targets or record an open decision. Address relevant categories:

- Performance and responsiveness
- Capacity and scalability
- Availability, reliability, resilience, backup, and disaster recovery
- Security, authentication, authorization, audit, and abuse prevention
- Privacy, consent, retention, residency, deletion, and regulatory compliance
- Accessibility and inclusive use
- Compatibility, portability, localization, and time zones
- Usability and supportability
- Maintainability, testability, configurability, and extensibility
- Observability, logging, metrics, tracing, and alerting

| ID | Category | Requirement and target | Measurement method | MoSCoW | Release | Owner | Status |
|---|---|---|---|---|---|---|---|

## 12. Data requirements

### 12.1 Data entities and ownership

| ID | Entity or dataset | Purpose | System of record | Owner | Classification | Key quality rules |
|---|---|---|---|---|---|---|

### 12.2 Data lifecycle

Document collection, validation, use, sharing, retention, archival, export, deletion, reconciliation, and audit requirements.

### 12.3 Migration and conversion

Define sources, mapping, cleansing, reconciliation, cutover, rollback, and acceptance measures.

### 12.4 Reporting and analytics

Define reports, metrics, calculation rules, audience, cadence, freshness, and access restrictions.

## 13. External interfaces and integrations

| ID | Interface/system | Direction | Data or operation | Protocol/format | Authentication | Availability | Failure/retry behavior | Owner |
|---|---|---|---|---|---|---|---|---|

Address user interfaces, APIs, files, devices, third-party platforms, notifications, webhooks, and manual handoffs as applicable.

## 14. User experience and content requirements

Describe navigation, information architecture, critical states, responsive or device behavior, content ownership, localization, accessibility, errors, confirmations, empty states, and recovery guidance.

## 15. Software development and technical requirements

Record only approved constraints and necessary delivery requirements:

- Supported platforms, operating systems, browsers, devices, and versions
- Required architecture boundaries, hosting, environments, and network constraints
- Approved technologies, prohibited technologies, standards, and licensing constraints
- Configuration, secrets, feature flags, and environment separation
- Source control, review, build, testing, quality gates, and CI/CD expectations
- Deployment, rollback, versioning, backward compatibility, and migration
- Test data, test environments, performance testing, security testing, and accessibility testing
- Technical documentation and operational handoff requirements

Keep implementation preferences clearly separated from stakeholder requirements.

## 16. Operational and organizational requirements

Define service ownership, monitoring, alerting, incident response, support hours, service levels, escalation, maintenance windows, continuity, training, communications, change management, adoption, and offboarding.

## 17. User stories and acceptance criteria

For each `US-###`, provide:

- **Story:** As a [role], I want [capability], so that [outcome].
- **Linked requirements:** IDs.
- **MoSCoW priority and release:** value and rationale.
- **Preconditions and business rules:** IDs where available.
- **Acceptance criteria:** normal, boundary, permission, validation, failure, recovery, and accessibility scenarios as applicable.
- **Dependencies and open questions:** IDs.

Use Given/When/Then where it improves testability.

## 18. Validation and acceptance strategy

Define requirement reviews, prototypes, demonstrations, user acceptance, functional tests, integration tests, non-functional tests, operational-readiness checks, acceptance authority, entry criteria, exit criteria, and evidence to retain.

## 19. Traceability

| Goal | Requirement | Use case/story | Acceptance criterion or test | Release | Status |
|---|---|---|---|---|---|

Identify goals without requirements, requirements without verification, stories without requirements, and tests without a justified requirement.

## 20. Open questions and decisions

| ID | Question or decision | Owner | Impact | Affected IDs | Needed by | Status | Resolution |
|---|---|---|---|---|---|---|---|

## 21. Final readiness and approval status

Record the quality-gate result, blocking items, accepted exceptions, evidence limitations, remaining open decisions, and whether the package is documented, reviewed, or formally approved.

## Appendices

Include diagrams, research summaries, field dictionaries, calculation definitions, policy mappings, mockups, prototypes, or other supporting evidence only when they improve verification or decision-making.
