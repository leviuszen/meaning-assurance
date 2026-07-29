# Meaning Assurance Brand and Repository Migration

## Meaning Assurance 品牌与仓库迁移

This document prepares a possible public repository rename. It does not
authorize or perform that rename.

本文用于准备未来可能发生的公开仓库改名，不构成改名授权，也不会执行改名。

## Public identity / 公开身份

| Layer / 层级 | Current decision / 当前决定 |
|---|---|
| Canonical product brand / 规范产品品牌 | **Meaning Assurance** |
| Chinese audience-facing alias / 中文受众名称 | **AI 对抗审计助手** |
| Public author / 公开作者 | **LEVIUS** |
| Current repository slug / 当前仓库 slug | `agent-workbench` |
| Proposed future slug / 候选未来 slug | `meaning-assurance` |

## Compatibility identifiers that remain / 保留的兼容标识

The v0.2.0 candidate does not rename:

v0.2.0 候选版本不修改：

```text
.agent-workbench
AGENT_WORKBENCH_HOME
Install-AgentWorkbench.ps1
existing task and discussion directories
existing protocol field names
existing canonical result filenames
```

Changing these identifiers would create operational risk without improving
public discovery. A future breaking migration requires a separate design,
compatibility period, tests, and explicit authorization.

修改这些标识会增加运行风险，却不会改善公开发现能力。未来如需 Breaking
Migration，必须单独设计兼容期、测试并获得明确授权。

## Repository rename checklist / 仓库改名检查表

Before any rename:

执行任何改名前：

- inventory repository, Issue, Pull Request, Wiki, Release, and raw-file URLs;
- scan README, docs, badges, Actions, templates, scripts, and fixtures for the
  old repository URL;
- classify each `Agent Workbench` occurrence as public brand, compatibility
  identifier, historical record, or test fixture;
- verify whether this repository is referenced as a reusable GitHub Action;
- decide the Pages URL only after the final repository slug is known;
- prepare `git remote set-url origin ...` guidance; and
- do not create a new repository under the old slug after rename, because that
  can break redirect expectations.

- 清点仓库、Issue、Pull Request、Wiki、Release 与 raw 文件 URL；
- 扫描 README、文档、Badge、Actions、模板、脚本和 Fixture 中的旧仓库 URL；
- 将每个 `Agent Workbench` 出现位置分类为公开品牌、兼容标识、历史记录或测试
  Fixture；
- 核对本仓库是否被其他项目作为可复用 GitHub Action 引用；
- 只有仓库最终 slug 确定后再决定 Pages URL；
- 准备 `git remote set-url origin ...` 迁移说明；
- 改名后不要重新创建旧 slug 仓库，以免破坏重定向预期。

After an authorized rename:

获得改名授权并执行后：

- verify both old and new repository web URLs;
- perform clean clones with both old and new URLs;
- verify `git fetch` from an existing old remote;
- verify tags and Release assets;
- verify badges, raw links, Pages links, and social-preview destinations;
- verify Actions and reusable workflow references explicitly; and
- publish the compatibility note with the v0.2.0 Release.

- 验证新旧仓库网页 URL；
- 使用新旧 URL 分别执行干净 Clone；
- 从已有旧 remote 执行 `git fetch`；
- 验证 Tag 与 Release 附件；
- 验证 Badge、raw 链接、Pages 链接和 Social Preview 目标；
- 明确验证 Actions 与可复用 Workflow 引用；
- 在 v0.2.0 Release 中发布兼容说明。

## Current authorization boundary / 当前授权边界

The TURNAROUND-01 local build may prepare this migration. It may not rename the
repository, change GitHub settings, push, merge, publish a Release, enable
Pages, or update external references.

TURNAROUND-01 本地构建可以准备迁移，但不得改仓库名、修改 GitHub 设置、Push、
Merge、发布 Release、启用 Pages或更新外部引用。
