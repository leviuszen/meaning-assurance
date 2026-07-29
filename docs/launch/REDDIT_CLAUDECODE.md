# Candidate Reddit Draft — Do Not Publish

Candidate destination label: `r/ClaudeCode`. This is a planning label, not a
claim that the community exists or accepts this post at publication time.

## Suggested title

```text
I built a local protocol that separates Claude Code's “done” claim from evidence and human acceptance
```

## Body

I use coding agents for real repository work, and the recurring problem was not
generation quality alone. It was the acceptance boundary.

An agent would say “done.” A reviewer agent might agree. But neither response
answered:

- what exact evidence was checked;
- whether the task drifted outside scope;
- whether every declared test ran;
- whether the reviewer was independently verifying or merely repeating the
  same confidence; or
- whether the reviewer had made a claim the evidence could not support.

I built **Meaning Assurance**, a Windows-first, local, file-backed protocol for
that boundary.

The shortest way to inspect the idea is a deterministic demo with no API key:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\Run-Demo.ps1
```

The fixture deliberately includes both worker and reviewer failures:

```text
Worker claim: COMPLETE
Evidence: one declared test is missing; one changed file is outside scope
Review outcomes: 2 confirmed, 1 rejected, 1 not testable
Final acceptance: BLOCKED
```

The live path can freeze and hash review inputs, run a blind first review,
target only disputed findings in Round 2, and keep implementation workers inside
isolated Git worktrees. It does not automatically merge anything.

Current boundaries:

- Windows and PowerShell only;
- formal non-interactive adapters for Claude Code and Reasonix;
- no UI or hosted service;
- Git worktree isolation is not an OS sandbox; and
- no claim of guaranteed correctness.

Repository: `<FINAL_REPOSITORY_URL>`

I am not asking for stars. I would like people who already use Claude Code to
run the fixture and challenge the protocol: where can evidence still be
misleading, and what would you require before accepting a real task?

## Before posting

- Verify that the candidate destination still exists and is appropriate.
- Re-check current subreddit rules and flairs.
- Replace the URL placeholder.
- Remove claims that are not true at the published commit.
- Do not cross-post the identical body to another subreddit.
