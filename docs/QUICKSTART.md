# Five-Minute Quick Start / 五分钟快速开始

This guide separates the credential-free deterministic demo from live
coding-agent workflows.

本文将无需凭据的确定性演示与真实 Coding Agent 工作流分开说明。

## 1. Run the deterministic demo / 运行确定性演示

From a local clone:

在本地克隆目录运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\Run-Demo.ps1
```

The script creates a new output directory under the system temporary folder. It
does not start an agent, contact a provider, modify an existing repository, or
reuse previous runtime state.

脚本会在系统临时目录中新建输出目录。它不会启动 Agent、联系模型供应商、修改已有
仓库，也不会复用以前的运行状态。

The output contains:

输出包括：

```text
summary.md
task-packet.json
worker-claim.json
frozen-evidence/
reviewer-findings.json
moderation-result.json
final-decision.md
evidence-manifest.json
```

Open `summary.md` first. It shows why the worker's `COMPLETE` claim is blocked,
which findings were confirmed, which reviewer claim was rejected, and which
claim remains not testable.

首先打开 `summary.md`。它会说明为什么 Worker 的 `COMPLETE` 主张被阻止、哪些
Finding 得到确认、哪项 Reviewer 判断被驳回，以及哪项结论仍不可检验。

### Choose an explicit output directory / 指定输出目录

The directory must not already exist. The script never overwrites an existing
folder.

目标目录必须尚不存在；脚本不会覆盖已有目录。

```powershell
$demoOutput = Join-Path $env:TEMP "meaning-assurance-demo-review"
powershell -NoProfile -ExecutionPolicy Bypass `
  -File .\scripts\Run-Demo.ps1 `
  -OutputDirectory $demoOutput
```

## 2. Install live workflow scripts / 安装真实工作流脚本

```powershell
$env:AGENT_WORKBENCH_HOME = Join-Path $env:LOCALAPPDATA "AgentWorkbench"
powershell -NoProfile -ExecutionPolicy Bypass `
  -File .\scripts\Install-AgentWorkbench.ps1
```

`AGENT_WORKBENCH_HOME` is an existing compatibility identifier. The public
product name is Meaning Assurance, but the runtime identifier is intentionally
unchanged in v0.2.0.

`AGENT_WORKBENCH_HOME` 是既有兼容标识。公开产品名已经是 Meaning Assurance，
但 v0.2.0 有意不修改运行标识。

## 3. Run a read-only strategy review / 运行只读战略复审

Live review requires a supported CLI adapter and its own provider
authentication.

真实复审需要受支持的 CLI Adapter，以及该 CLI 自己管理的供应商认证。

```powershell
$WorkbenchRoot = $env:AGENT_WORKBENCH_HOME
$params = @{
  WorkbenchRoot = $WorkbenchRoot
  Slug = "sample-review"
  Topic = "Review a bounded design note"
  Question = "What assumptions are unsupported?"
  Context = "Use only the supplied reference snapshot."
  Mode = "strategy-review"
  Protocol = "adversarial-discussion"
  AuditProfile = "scientific"
  Agents = @("claude-code")
  ReferencePaths = @(".\examples\sample-design-note.md")
}

$discussion = & (Join-Path $WorkbenchRoot "scripts\New-AgentDiscussion.ps1") @params
& (Join-Path $WorkbenchRoot "scripts\Invoke-ClaudeFeedback.ps1") `
  -DiscussionFolder $discussion `
  -Round 1 `
  -Collect
```

The reference file is copied, inventoried, and hashed. If the source changes,
create a fresh discussion instead of reusing the old snapshot.

参考文件会被复制、清点并哈希。源文件变化后，应新建 discussion，而不是继续使用
旧快照。

## 4. Inspect before accepting / 接受前检查

Do not accept a reviewer or worker's summary by itself. Inspect:

不要只凭 Reviewer 或 Worker 的摘要做接受决定，应检查：

- `status.json`;
- frozen reference manifests and hashes;
- canonical reviewer or worker result files;
- normalized findings and disagreement records;
- the isolated worktree diff for implementation tasks;
- test output; and
- `decision.md` or `user-decision-needed.md`.

Meaning Assurance preserves this evidence. It does not replace human judgment
or guarantee correctness.

Meaning Assurance 保留这些证据，但不替代人类判断，也不保证结论正确。

[Back to README / 返回首页](../README.md) ·
[中文首页](../README.zh-CN.md) ·
[Protocol / 协议](PROTOCOL.md)
