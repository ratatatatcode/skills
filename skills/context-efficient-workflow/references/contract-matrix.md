# Contract matrix

Use for API, persistence, event, audit, notification, or batch changes. Keep it short and specific to the changed behavior.

| Case | Input | Response | State change | Side-effect count |
|---|---|---|---|---|
| Valid change |  |  |  |  |
| Invalid input |  |  | none | 0 |
| No-op |  |  |  | 0 unless explicitly required |
| Repeated request |  |  |  | 0 additional duplicates |
| Bulk/partial input |  |  |  | one per real change |

Fill this before implementation, then turn each row into a focused check. Preserve the matrix until final verification is complete.
