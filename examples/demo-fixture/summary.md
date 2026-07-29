# Meaning Assurance Demo Decision

## Outcome

```text
Worker claim: COMPLETE
Evidence: one declared test is missing; one changed file is outside scope
Review outcomes: 2 confirmed, 1 rejected, 1 not testable
Final acceptance: BLOCKED
```

## Why acceptance is blocked

The worker's completion claim is not accepted because the frozen evidence shows
two material gaps:

1. only two of three required checks were executed; and
2. `docs/implementation-note.md` is outside the allowed file list.

## Why the reviewer is not automatically trusted

One reviewer finding claimed that no tests were run. That finding is rejected:
the frozen test record shows two passing tests. A second finding claims a
performance regression, but the packet contains no performance evidence, so
the outcome is `not-testable`.

## Boundary

This is a synthetic deterministic fixture. It explains the evidence and
moderation model but does not invoke a live agent or prove product effectiveness.
