# Context budget guidance

Use this only for a genuinely large task. Allocate context in this order:

1. User request and acceptance criteria.
2. Relevant code, tests, contracts, and changed-file evidence.
3. Focused tool output needed for the next decision.
4. A small reserve for verification and recovery.

Measure before optimizing when possible. Remove duplicate observations, stale logs, and unrelated files first. Keep failure output and evidence needed to reproduce a defect. A smaller prompt is not an improvement if it causes a missed requirement or unverified result.
