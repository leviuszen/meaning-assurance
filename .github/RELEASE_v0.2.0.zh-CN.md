# Meaning Assurance v0.2.0 — 公开预览版

**Meaning Assurance（AI 对抗审计助手）**是一套本地优先、以文件为载体的协议，
用于把 Coding Agent 的完成主张与冻结证据、独立挑战、经过裁决的 Finding 和人工
接受分离开来。

English release notes: [Meaning Assurance v0.2.0 — Public Preview](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/.github/RELEASE_v0.2.0.md)

## 你的 Coding Agent 说“完成了”，它留下了什么证据？

再启动一个 Coding Agent 并不难，真正困难的是判断什么可以被信任：

- Worker 是否停留在授权范围内？
- 所有声明检查是否真的执行过？
- Reviewer 究竟看到了哪些文件？
- 第二个 Reviewer 是否独立核验，还是重复了同一种自信？
- Reviewer 是否超出了证据能够支持的范围？
- 谁拥有最终接受权？

Meaning Assurance 将这些问题转换为本地任务包、冻结证据、显式 Finding、裁决结果
和由人类控制的最终决定。

> **Agent 提出结果，证据接受核验，人类决定是否采纳。**

## v0.2.0 新增内容

### 用一条命令查看裁决链

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\Run-Demo.ps1
```

确定性 Demo 不需要 API Key、不启动真实模型，也不修改已有仓库。它展示：

```text
Worker claim: COMPLETE
Evidence: one declared test is missing; one changed file is outside scope
Review outcomes: 2 confirmed, 1 rejected, 1 not testable
Final acceptance: BLOCKED
```

Demo 会写入 SHA-256 证据清单，以便检查复制后的 Fixture。

### 面向首次接触重构的 README

- 先提出用户已经遇到的问题；
- 安装前先提供一命令 Demo；
- 协议细节前先展示真实第一方审计；
- 使用紧凑机制图解释角色关系；
- 明确“是什么 / 不是什么”；
- 英文作为全球主入口；
- 提供完整简体中文对应版。

### 一份真实第一方证据案例

仓库公开了一份经过整理的真实 Claude Code 战略复审记录。Reviewer 检查了 9 个
冻结公开文件，Codex 随后挑战 Reviewer 的结论，并裁决 10 项结果：

```text
5 confirmed · 2 rejected · 2 duplicate · 1 not testable
```

该案例属于内部 dogfooding，不是第三方验证、认证或产品有效性证明。

### 公开身份与兼容性

- 规范产品品牌：**Meaning Assurance**
- 中文受众名称：**AI 对抗审计助手**
- 公开作者：**LEVIUS**

仓库未来可能在获得单独授权并完成迁移检查后改名。v0.2.0 有意保留以下兼容标识：

```text
.agent-workbench
AGENT_WORKBENCH_HOME
Install-AgentWorkbench.ps1
现有 task、discussion 与 evidence 字段名
```

## 核心协议

Meaning Assurance 提供：

- 有明确边界的任务包与讨论包；
- 实现 Worker 使用的隔离 Git worktree；
- 经过冻结、清点和哈希的复审参考包；
- blind Round 1 与 targeted Round 2；
- required 与 optional Reviewer gate；
- 规范结果文件与无效输出隔离；
- PID-backed invocation lease；
- 使用 `confirmed`、`rejected`、`duplicate` 与 `not-testable` 的证据裁决；
- 可见的未解决分歧；
- 不自动合并，也不自动应用 Patch。

这是一套角色协议，不是固定 Agent 三件套。当前正式非交互 Adapter 是 Claude Code
与 Reasonix。其他 Runtime 必须先实现 Adapter，不能被描述为内置支持。

## 安装

```powershell
$env:AGENT_WORKBENCH_HOME = Join-Path $env:LOCALAPPDATA "AgentWorkbench"
powershell -NoProfile -ExecutionPolicy Bypass `
  -File .\scripts\Install-AgentWorkbench.ps1
```

真实模型凭据继续由 Agent CLI 自己管理。Meaning Assurance 不保存供应商 API Key。

## 验证状态

本版本验证状态：

- Windows PowerShell 5.1 下 18 项仓库测试全部通过。
- PowerShell 7 下 18 项仓库测试全部通过。
- 确定性 Demo 已在两个 PowerShell 版本下通过冷启动与禁止覆盖测试。
- Gitleaks 8.30.1 对完整可达 Git 历史和当前工作树的扫描均未发现泄漏。
- 公开邮箱、私人路径、双语、链接与主张追溯检查均在本地通过。

这些内容属于有边界的验证证据，不是独立验证，也不保证协议一定产生正确决定。
参见[验证记录](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/docs/TURNAROUND_VERIFICATION_2026-07-28.md)。

## 重要边界

- 当前只测试 Windows 与 PowerShell 主机环境。
- Git worktree 提供文件隔离，不是操作系统级沙箱。
- 冻结证据可以说明 Reviewer 收到了什么，但不能证明证据充分。
- Reviewer 一致意见不是证明。
- 协议不保证代码或决定正确。
- 不包含 UI、托管控制面、自动合并、遥测服务或供应商 Key 存储。

参见[当前限制](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/docs/LIMITATIONS.md)、
[隐私说明](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/docs/PRIVACY.md)和
[安全策略](https://github.com/leviuszen/meaning-assurance/blob/v0.2.0/SECURITY.md)。

## 作者与联系

- 作者 ID：**LEVIUS**
- 公开联系邮箱：[agentworkbench@proton.me](mailto:agentworkbench@proton.me)

使用 Apache License 2.0。
