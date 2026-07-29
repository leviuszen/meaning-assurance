# Show HN Draft — Do Not Publish

Candidate destination label only. Destination availability and current rules
must be re-checked before use.

## Title

```text
Show HN: Meaning Assurance – evidence-based review for coding agents
```

## Submission URL

```text
https://github.com/leviuszen/meaning-assurance
```

## Founder comment

I kept running into the same failure mode with coding agents: the agent would
say a task was done, and my next step was to ask the same system whether I
should trust that claim.

Meaning Assurance is my attempt to separate production from acceptance. It is a
local, file-backed PowerShell protocol that keeps five things distinct:

1. the worker's claim;
2. the evidence a reviewer actually received;
3. the reviewer's findings;
4. moderation outcomes; and
5. the human acceptance decision.

The repository now includes a credential-free deterministic demo:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\Run-Demo.ps1
```

It shows a worker claiming `COMPLETE`, two findings being confirmed, one
reviewer overstatement being rejected, one claim being marked not testable, and
final acceptance remaining blocked.

The live workflow is Windows-first and currently has formal non-interactive
adapters for Claude Code and Reasonix. Implementation workers use isolated Git
worktrees, review inputs can be frozen and hashed, and nothing is merged
automatically.

Important limitations:

- this is not an OS sandbox;
- frozen evidence can still be insufficient;
- reviewer agreement is not proof;
- the included real audit is first-party dogfooding; and
- the protocol does not guarantee correct code or correct decisions.

I would value adversarial feedback on the boundary itself: what evidence would
you still need before accepting an agent's work, and where could a reviewer or
moderator still overreach?

## Posting checklist

- Re-open the current
  [Show HN Guidelines](https://news.ycombinator.com/showhn.html).
- Confirm the final repository and Release URLs resolve.
- Confirm the demo runs from a clean clone.
- Publish only after the repository and Release are public.
- Be available to answer technical questions.
- Do not ask anyone to upvote or comment.
