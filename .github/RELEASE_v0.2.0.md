# Meaning Assurance v0.2.0 — Coding Agent Verification and Adversarial Review

**Public Preview**

Verify coding-agent task claims against frozen evidence.

**Meaning Assurance** separates worker claims, reviewer findings, moderated
outcomes, and human final acceptance.

简体中文发布说明：[Meaning Assurance v0.2.0 — 公开预览版](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/.github/RELEASE_v0.2.0.zh-CN.md)

## Your coding agent says “done.” What evidence did it leave?

Running another coding agent is easy. The difficult part is deciding what can be
trusted:

- Did the worker stay inside the authorized scope?
- Were all declared checks actually run?
- What exact files did the reviewer inspect?
- Did a second reviewer independently verify the work or repeat the same
  confidence?
- Did the reviewer overstate what the evidence can prove?
- Who has authority to accept the result?

Meaning Assurance turns those questions into local task packets, frozen
evidence, explicit findings, moderated outcomes, and a human-controlled final
decision.

> **Agents propose. Evidence is verified. Humans decide what to accept.**

## What is new in v0.2.0

### A decision trail in one command

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\Run-Demo.ps1
```

The deterministic demo requires no API key, launches no live model, and does not
modify an existing repository. It shows:

```text
Worker claim: COMPLETE
Evidence: one declared test is missing; one changed file is outside scope
Review outcomes: 2 confirmed, 1 rejected, 1 not testable
Final acceptance: BLOCKED
```

The demo writes a SHA-256 evidence manifest so the copied fixture can be
inspected.

### A README built for first contact

- problem-first opening;
- one-command demo before installation;
- a real first-party audit before protocol detail;
- a compact mechanism diagram;
- explicit “is / is not” boundaries;
- English as the global primary entry; and
- a complete Simplified Chinese counterpart.

### A real first-party evidence case

The repository publishes a curated record of a real Claude Code strategy review
against nine frozen public files. Codex challenged the reviewer and moderated
ten outcomes:

```text
5 confirmed · 2 rejected · 2 duplicate · 1 not testable
```

The case is internal dogfooding. It is not third-party validation,
certification, or proof of product effectiveness.

### Public identity and compatibility

- Canonical product brand: **Meaning Assurance**
- Chinese audience-facing alias: **AI 对抗审计助手**
- Public author: **LEVIUS**

The public repository was renamed from `agent-workbench` to
`meaning-assurance` on 2026-07-29. v0.2.0 intentionally retains these
compatibility identifiers:

```text
.agent-workbench
AGENT_WORKBENCH_HOME
Install-AgentWorkbench.ps1
existing task, discussion, and evidence field names
```

## Core protocol

Meaning Assurance provides:

- bounded task and discussion packets;
- isolated Git worktrees for implementation workers;
- frozen, inventoried, and hashed review references;
- blind Round 1 and targeted Round 2 review;
- required and optional reviewer gates;
- canonical results and invalid-output quarantine;
- PID-backed invocation leases;
- evidence-based moderation with `confirmed`, `rejected`, `duplicate`, and
  `not-testable` outcomes;
- visible unresolved disagreement; and
- no automatic merge or patch application.

This is a role protocol, not a fixed agent trio. The current formal
non-interactive adapters are Claude Code and Reasonix. Other runtimes require an
implemented adapter and must not be described as built-in support.

## Install

```powershell
$env:AGENT_WORKBENCH_HOME = Join-Path $env:LOCALAPPDATA "AgentWorkbench"
powershell -NoProfile -ExecutionPolicy Bypass `
  -File .\scripts\Install-AgentWorkbench.ps1
```

Live provider credentials remain managed by the agent CLI. Meaning Assurance
does not store provider API keys.

## Verification status

For this release:

- All 18 repository tests pass under Windows PowerShell 5.1.
- All 18 repository tests pass under PowerShell 7.
- The deterministic demo passes cold-start and no-overwrite tests under both
  PowerShell versions.
- Gitleaks 8.30.1 reports no leaks in the complete reachable Git history or the
  current working tree.
- Public-email, private-path, bilingual, link, and claim-traceability checks
  pass locally.

These statements are bounded verification evidence, not independent validation
or a guarantee that the protocol produces a correct decision. See the
[verification record](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/docs/TURNAROUND_VERIFICATION_2026-07-28.md).

## Important boundaries

- Windows and PowerShell are the only tested host environment.
- A Git worktree is file isolation, not an operating-system sandbox.
- Frozen evidence can show what a reviewer received; it cannot prove that the
  evidence was sufficient.
- Reviewer agreement is not proof.
- The protocol does not guarantee correct code or correct decisions.
- No UI, hosted control plane, automatic merge, telemetry service, or provider
  key store is included.

See [Current Limitations](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/docs/LIMITATIONS.md),
[Privacy](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/docs/PRIVACY.md),
and [Security](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/SECURITY.md).

## Author and contact

- Author ID: **LEVIUS**
- Public contact: [agentworkbench@proton.me](mailto:agentworkbench@proton.me)

Licensed under the Apache License 2.0.
