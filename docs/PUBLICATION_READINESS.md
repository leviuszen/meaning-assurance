# v0.2.0 Publication Readiness / v0.2.0 发布准备

This document separates the authorized TURNAROUND-01 local build from actions
that change GitHub or expose material externally.

本文将已授权的 TURNAROUND-01 本地构建，与修改 GitHub 或对外公开材料的动作分开。

## Candidate identity / 候选身份

- Product: **Meaning Assurance**
- Chinese audience-facing alias: **AI 对抗审计助手**
- Author ID: **LEVIUS**
- Public contact: [agentworkbench@proton.me](mailto:agentworkbench@proton.me)
- License: Apache License 2.0
- Current public Release: `v0.1.0`
- Local candidate: `v0.2.0`
- Current repository slug: `agent-workbench`
- Proposed future slug: `meaning-assurance` — not authorized
- Local verification record:
  [TURNAROUND_VERIFICATION_2026-07-28.md](TURNAROUND_VERIFICATION_2026-07-28.md)

## Local build scope / 本地构建范围

The authorized local build may prepare:

已授权本地构建可以准备：

- English and Simplified Chinese README files;
- quick start, limitations, migration, privacy, and claim-traceability docs;
- a credential-free deterministic demo and its tests;
- a first-party evidence case and explicit case boundaries;
- `v0.2.0` Release candidates;
- Social Preview source artwork;
- native launch drafts for selected channels;
- repository-rename migration checks; and
- local test, secret, privacy, path, link, and claim audits.

Preparing these artifacts does not authorize any external action.

准备这些产物不授权任何外部动作。

## Day 6 blocking gate / 第 6 天阻断门

Every blocking item must pass before a public-release recommendation.

必须全部通过以下阻断项，才能提出公开发布建议。

### Brand and bilingual parity / 品牌与双语一致性

- `README.md` uses Meaning Assurance as the canonical English brand.
- `README.zh-CN.md` is a complete Simplified Chinese counterpart.
- The first Chinese reference is `Meaning Assurance（AI 对抗审计助手）`.
- Chinese text does not expand English claims; English text does not omit
  Chinese limitations.
- Historical compatibility identifiers remain clearly classified.

### Runtime and demo / 运行与 Demo

- Current complete repository suite passes under Windows PowerShell 5.1.
- Current complete repository suite passes under PowerShell 7.
- The deterministic demo runs in a clean environment.
- The demo requires no provider key or live agent.
- The demo refuses to overwrite an existing output directory.
- The demo does not modify the source repository or an existing user project.
- Every PowerShell command published in README and Release materials is parsed
  and, where practical, executed.

### Security and privacy / 安全与隐私

- Gitleaks scans the working tree and complete reachable Git history.
- Public files contain only approved public email addresses or
  `@example.invalid` fixtures.
- Public files and reachable history contain no private user-profile path,
  unrelated workspace path, secret, token, or private project identifier.
- Case redaction retains the original finding meaning and records its limits.
- No private runtime folder is included.

### Evidence and claims / 证据与主张

- Every material capability claim maps to code, tests, or bounded documentation.
- The real case is labeled first-party internal dogfooding.
- The deterministic demo is labeled synthetic.
- No adoption, conversion, ranking, performance, demand, certification, or
  independent-validation claim is made without current traceable evidence.
- `v0.2.0` is described as a candidate until the Tag and Release exist.

### Migration and links / 迁移与链接

- All internal links resolve in the candidate tree.
- Old repository URL occurrences are classified before rename.
- After an authorized rename, old and new web URLs, clean Clone, existing-remote
  Fetch, Tag, Release, Badge, raw link, Actions reference, and Pages behavior
  are verified.
- Pages is optional and cannot block release if it was explicitly downgraded
  before the gate.

## Conditional Pages rule / Pages 条件规则

Pages may remain in the candidate only if it:

只有同时满足以下条件，Pages 才保留在候选范围内：

- reuses README, case, demo, and mechanism assets;
- creates no second factual source;
- introduces no framework or complex build chain;
- can be completed and verified within half a day;
- does not delay README, demo, case, tests, or Release; and
- has a clear post-rename URL.

Otherwise Pages is deferred without blocking `v0.2.0`.

否则 Pages 后置，不阻挡 `v0.2.0`。

Current local decision: [Pages is deferred](PAGES_DECISION.md).

## External actions still requiring explicit approval / 仍需明确授权的外部动作

The following remain unauthorized:

以下动作仍未授权：

1. push a branch;
2. open a Pull Request;
3. merge to `main`;
4. rename the repository;
5. change About, Topics, Social Preview, homepage, branch rules, or other
   GitHub settings;
6. enable or publish GitHub Pages;
7. create the `v0.2.0` Tag or Release;
8. publish to Show HN, Reddit, V2EX, Zhihu, or another community;
9. submit an ecosystem-directory Pull Request; or
10. contact any person or organization.

The local candidate may contain drafts and migration instructions for these
actions. Drafts are not delivery receipts.

本地候选可以包含这些动作的草稿和迁移说明，但草稿不是已经发布或送达的证据。
