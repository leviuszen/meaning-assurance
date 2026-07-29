# v0.2.0 Publication Readiness / v0.2.0 发布准备

This document records the TURNAROUND-01 release gates, publication
authorization, and externally verifiable receipts.

本文记录 TURNAROUND-01 的发布门禁、公开授权与可外部核验的回执。

## Candidate identity / 候选身份

- Product: **Meaning Assurance**
- Chinese audience-facing alias: **AI 对抗审计助手**
- Author ID: **LEVIUS**
- Public contact: [agentworkbench@proton.me](mailto:agentworkbench@proton.me)
- License: Apache License 2.0
- Current public Release: `v0.2.0`
- Current repository slug: `meaning-assurance`
- Former repository slug: `agent-workbench` — GitHub redirect retained
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
- `v0.2.0` is described as the current public preview only after its Tag and
  Release exist.

### Migration and links / 迁移与链接

- All internal links resolve in the release tree.
- Old repository URL occurrences were classified before rename.
- Old and new web URLs plus old/new Git remote resolution were verified after
  rename.
- Tag, Release, Social Preview, homepage, and Pages require their own live
  receipts.

## Minimal Pages rule / 最小 Pages 规则

The authorized Pages implementation:

已授权的 Pages 实施：

- reuses README, case, demo, and mechanism assets;
- creates no second factual source;
- introduces no framework or complex build chain;
- can be completed and verified within half a day;
- does not delay README, demo, case, tests, or Release; and
- has a clear post-rename URL.

Current decision: [minimal Pages is implemented](PAGES_DECISION.md).

## Publication authorization and receipts / 发布授权与回执

The user authorized the complete release window on 2026-07-29. Authorization
includes merge, rename, GitHub metadata, Social Preview, Pages, Tag/Release,
native English and Chinese launch posts, and bounded outreach.

用户于 2026-07-29 授权执行完整发布窗口，包括 Merge、仓库改名、GitHub 元数据、
Social Preview、Pages、Tag/Release、中英文原生发布与有边界的外联。

| Action | Receipt rule |
|---|---|
| PR merge | Merged PR URL and merge commit |
| Repository rename | New URL plus old/new web and Git redirect checks |
| Metadata and Social Preview | Read-back from the live repository |
| Pages | Successful deployment URL and HTTP/render checks |
| `v0.2.0` | Published Tag and Release URL |
| Community posts | Public post URL or explicit platform failure |
| Outreach | Message receipt, public reply URL, or explicit delivery failure |

Authorization is not a delivery receipt. Each completed external action must be
reported with its own observable URL, identifier, or success response.

授权本身不是送达回执。每项外部动作完成后，必须保留可观察的 URL、标识符或成功
响应。

Current receipts / 当前回执：
[Publication Receipts — 2026-07-29](launch/PUBLICATION_RECEIPTS_2026-07-29.md).
