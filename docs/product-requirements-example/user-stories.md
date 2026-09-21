# Community Clinic Appointment Booking — User Stories

> Draft, synthetic, and illustrative. These stories are proposals for review, not stakeholder-approved scope.

## US-001 — Request an appointment

**Story:** As an authenticated patient, I want to select a service and available slot so that I can request care without calling the clinic.

- **Linked requirements:** `GOAL-001`, `FR-001`, `FR-002`, `FR-003`, `FR-004`, `FR-005`
- **Priority/release:** Must Have; proposed Release 1.
- **Preconditions:** The patient is authenticated; service and availability data can be retrieved.
- **Business rules:** `BR-001`, `BR-002`, `BR-003`.
- **Dependencies:** `DEP-001`; identity and platform decisions in `OQ-003`, `OQ-006`, and `OQ-007`.

### Acceptance criteria

```gherkin
Given I am authenticated and have selected a service and available slot
When I submit the appointment request
Then the request is submitted once
And I see a confirmation containing the request identifier

Given I have not selected a required service or slot
When I submit the request
Then the app identifies the missing selection
And preserves my other selections
And does not create a request

Given the selected slot is taken before submission completes
When the service rejects the request for a slot conflict
Then the app explains that the slot is unavailable
And lets me choose another slot
And does not show a success confirmation

Given I retry after an ambiguous network failure
When the service has already recorded the request
Then the app does not create a duplicate pending request
And shows the existing request outcome when it can be reconciled

Given the request journey is presented on a supported mobile device
When I use a screen reader or keyboard navigation where supported
Then controls have meaningful labels, focus order is logical, and validation errors are announced
```

## US-002 — Understand request status

**Story:** As an authenticated patient, I want to see whether my request was accepted or rejected so that I know what to do next.

- **Linked requirements:** `FR-003`, `FR-004`, `NFR-003`.
- **Priority/release:** Should Have; proposed Release 1, subject to status-source decisions.
- **Preconditions:** A request outcome exists or the service can report its state.
- **Open questions:** `OQ-001`, `OQ-007`.

### Acceptance criteria

```gherkin
Given my request was acknowledged successfully
When I view the result
Then I see the request identifier and its current status

Given the service rejects my request
When I view the result
Then I see an actionable explanation
And I am not told that an appointment was confirmed

Given the status service is unavailable
When I open the result
Then the app explains that status is temporarily unavailable
And does not replace the last known status with an invented value
```

## US-003 — Recover from interrupted mobile use

**Story:** As a patient using a mobile device, I want the app to recover safely after interruption or poor connectivity so that I do not lose selections or submit duplicates.

- **Linked requirements:** `FR-002`, `FR-005`, `NFR-003`, `NFR-005`.
- **Priority/release:** Must Have; proposed Release 1.
- **Preconditions:** The user has entered selections and the app is interrupted or connectivity changes.
- **Open questions:** `OQ-003`, `OQ-007`.

### Acceptance criteria

```gherkin
Given I have selected a service and slot
When the app is interrupted before submission
Then returning to the journey preserves or clearly resets the selections according to the approved policy

Given connectivity is lost before the request is acknowledged
When I return to the app
Then I see that the outcome is unknown or can be checked
And the app does not silently submit a second request

Given the device is not on a supported platform version
When I start the app
Then the app communicates the support limitation
And does not present the journey as fully supported
```

## Story coverage notes

All stories are proposals. `NFR-001`, `NFR-002`, and `NFR-004` also require non-story verification through performance, accessibility, privacy, and data-lifecycle reviews.
