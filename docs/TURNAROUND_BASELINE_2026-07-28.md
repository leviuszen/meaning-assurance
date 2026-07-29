# TURNAROUND-01 Day 0 Baseline

## TURNAROUND-01 第 0 天基线

Captured on `2026-07-28` in the Asia/Shanghai time zone. This baseline preserves
the state before the local TURNAROUND-01 build. It does not block implementation
and does not claim causal diagnosis.

记录时间为亚洲/上海时区 `2026-07-28`。本文件保存 TURNAROUND-01 本地构建前的
状态，不阻挡实施，也不声称已经完成因果诊断。

## Repository facts / 仓库事实

| Item / 项目 | Baseline / 基线 |
|---|---|
| Public repository | `leviuszen/agent-workbench` |
| Remote `main` commit | `f0ad137d342da35c5ac7d66667724741f4511205` |
| Current public tag | `v0.1.0` |
| `v0.1.0` target commit | `9252d5105f3f9c6d91624adbcf7109a846d5cfb3` |
| Public product H1 | `Meaning Assurance` |
| Public author identity | `LEVIUS` |
| Public contact | `agentworkbench@proton.me` |
| License | Apache License 2.0 |

## Public-surface baseline / 公开表面基线

- The README already led with the “agent says done” problem.
- English and Chinese were interleaved section by section in one long document.
- A real Claude Code strategy discussion and moderated read-only audit were
  already public.
- The existing quick starts required a configured live CLI agent.
- No credential-free, deterministic one-command decision-trail demo existed.
- No separate Simplified Chinese README existed.
- The public Release remained `v0.1.0`.
- The repository slug remained `agent-workbench`.

- README 已经使用“Agent 声称完成”的问题式开头。
- 英文与中文按章节交织在同一份长文档中。
- 仓库已经公开一份真实 Claude Code 战略讨论和经过裁决的只读审计。
- 现有 Quick Start 需要配置真实 CLI Agent。
- 尚无无需凭据、可确定性运行的一命令裁决链 Demo。
- 尚无独立的简体中文 README。
- 当前公开 Release 仍为 `v0.1.0`。
- 仓库 slug 仍为 `agent-workbench`。

## Test baseline / 测试基线

- Windows PowerShell 5.1: all 15 baseline repository tests passed locally.
- PowerShell 7: not available in the current local command environment at
  baseline capture; this is an environment gap, not a passing result.

- Windows PowerShell 5.1：15 项基线仓库测试全部通过。
- PowerShell 7：基线记录时当前本地命令环境不可用；这是环境缺口，不是通过结果。

## Data not claimed / 未作出的数据主张

Owner-only GitHub Traffic and Referrer data were not copied into this repository.
This local baseline therefore makes no claim about current unique visitors,
clones, conversion, search ranking, or demand.

GitHub 所有者可见的 Traffic 与 Referrer 数据没有复制进仓库，因此本地基线不对
当前独立访客、Clone、转化、搜索排名或需求作出判断。

## Authorization boundary / 授权边界

The authorized local build may create a branch and modify README, documentation,
demo, cases, tests, and launch assets. It does not authorize push, Pull Request,
merge, repository rename, GitHub settings, Pages activation, Tag, Release, or
external publication.

当前授权允许创建本地分支，并修改 README、文档、Demo、案例、测试与发布资产；
不授权 Push、Pull Request、Merge、仓库改名、GitHub 设置、Pages 启用、Tag、
Release 或外部发布。
