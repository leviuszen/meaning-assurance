# TURNAROUND-01 Local Verification / TURNAROUND-01 本地验证

Date: 2026-07-28
Branch: `codex/turnaround-01`
Base commit: `f0ad137d342da35c5ac7d66667724741f4511205`
Candidate: `v0.2.0` — pushed to Draft PR
[#2](https://github.com/leviuszen/agent-workbench/pull/2), not merged, tagged,
or released

This record captures the authorized local verification completed before PR
creation. Current GitHub Actions receipts are attached to Draft PR #2. This
record is not a Release receipt, an independent endorsement, or authorization
to publish.

本记录保存创建 PR 之前完成的已授权本地验证。当前 GitHub Actions 回执已关联到
Draft PR #2。本记录不是 Release 回执、独立背书，也不构成发布授权。

## Test matrix / 测试矩阵

| Environment | Result |
|---|---|
| Windows PowerShell 5.1 | 17/17 passed |
| PowerShell 7.6.3 portable | 17/17 passed |

The PowerShell 7.6.3 Windows x64 portable archive was checked against the
vendor-published SHA-256:

`07DDB0D00B660459560EF82A9841DA7705B27CD5DCCA5A0D7B025A98ECA29ECA`

PowerShell 7.6.3 Windows x64 便携包已按供应商公布的 SHA-256 校验。

## Demo and artifact checks / Demo 与资产检查

- The deterministic demo starts without an API key or live model.
- It writes only to a new caller-selected output directory.
- It refuses to overwrite an existing output directory.
- Its JSON evidence files parse successfully.
- All repository PowerShell scripts parse successfully.
- README, bilingual, launch-asset, link, public-email, private-path, and
  claim-traceability assertions pass in the repository test suite.
- `git diff --check` reports no whitespace error.

- 确定性 Demo 无需 API Key 或真实模型即可启动。
- 它只写入调用者指定的新输出目录。
- 它拒绝覆盖已有输出目录。
- 其中的 JSON 证据文件可成功解析。
- 仓库内全部 PowerShell 脚本可成功解析。
- README、双语、传播资产、链接、公开邮箱、私人路径和主张追溯断言均通过仓库测试。
- `git diff --check` 未发现空白错误。

## Secret scanning / Secret 扫描

Gitleaks 8.30.1 was used for both scans:

| Scope | Result |
|---|---|
| Complete reachable Git history | No leaks found |
| Current working tree | No leaks found |

The official checksum manifest had SHA-256:

`061476C21ADAF5441516F96F185C1A4706A83CD6329B9B38762271B3D4A52FAE`

The verified Windows x64 archive had SHA-256:

`D29144DEFF3A68AA93CED33DDDF84B7FDC26070ADD4AA0F4513094C8332AFC4E`

Gitleaks 8.30.1 已扫描完整可达 Git 历史和当前工作树，两个范围均未发现泄漏。
其校验清单和 Windows x64 压缩包均已按上方 SHA-256 验证。

## Read-only adversarial review / 只读对抗审计

A local Agent Workbench review used frozen copies of the candidate files. The
first review found no high-severity issue and identified advisory hardening.
After those changes, a fresh-snapshot re-audit found a public demo-summary
mismatch. The script, READMEs, Release drafts, fixture summary, launch drafts,
and regression tests were aligned. A final fresh-snapshot review found no
remaining blocking mismatch.

本地 Agent Workbench 使用候选文件的冻结副本完成只读审计。第一轮没有发现高风险
问题，但提出了加固建议；修正后，新快照复审发现公开 Demo 摘要与脚本输出不一致。
脚本、双语 README、Release 草稿、Fixture 摘要、传播草稿与回归测试统一后，最终
新快照复审未发现剩余阻断项。

This is external-model adversarial review evidence, not third-party independent
validation, certification, or proof of product effectiveness. Review transcripts
remain local and are not part of the public candidate.

这是外部模型对抗审计证据，不是第三方独立验证、认证或产品有效性证明。审计记录
保留在本地，不属于公开候选内容。

## 2026-07-29 pre-merge delta verification / 合并前增量验证

The final Draft PR snapshot at
`a6a55d3166845c43e5d5fb5b598c8d6d980d1ae9` was verified again after the last
README and turnaround-asset edits:

- Windows PowerShell 5.1: all 17 repository tests passed locally.
- PowerShell 7: both current Draft PR CI runs passed on the same commit.
- Gitleaks 8.30.1: no leaks in all 7 reachable commits or the working tree.
- `git diff --check`: no whitespace errors.
- The repository contains exactly 17 files under `tests/test-*.ps1`.
- A new frozen-snapshot, read-only adversarial audit found no blocking
  correctness, privacy, or misleading-claim defect.

The audit also identified two publication-time checks: use absolute repository
URLs in the GitHub Release body, and replace every launch-draft URL placeholder
after the final repository slug exists. These are release gates, not evidence
that the candidate has already been published.

在最后一次 README 与传播资产编辑后，Draft PR 最终快照
`a6a55d3166845c43e5d5fb5b598c8d6d980d1ae9` 已重新验证：

- Windows PowerShell 5.1 本地 17 项仓库测试全部通过。
- PowerShell 7 针对同一提交的两次当前 Draft PR CI 均通过。
- Gitleaks 8.30.1 扫描全部 7 个可达提交与工作树，均未发现泄漏。
- `git diff --check` 未发现空白错误。
- `tests/test-*.ps1` 下的测试文件数量确认为 17。
- 新的冻结快照只读对抗审计未发现正确性、隐私或误导性主张阻断项。

审计同时提出两个发布时检查：GitHub Release 正文应使用绝对仓库 URL；仓库最终
slug 确定后，应替换全部传播草稿 URL 占位符。这些是发布门禁，不表示候选已经
完成公开发布。

## Deliberately deferred / 明确后置

- GitHub-rendered link and layout review
- Remote CI for the candidate branch
- Repository rename and redirect validation
- GitHub About, Topics, Social Preview, Pages, and repository settings
- Tag and Release creation
- Community posts, directory submissions, and outreach

- GitHub 渲染后的链接与版式检查
- 候选分支的远程 CI
- 仓库改名与重定向验证
- GitHub About、Topics、Social Preview、Pages 与仓库设置
- Tag 与 Release 创建
- 社区发布、目录提交与外联

These are external gates. None was performed during the local build.

这些属于外部门禁；本地构建阶段未执行其中任何一项。
