# Current Limitations / 当前限制

Meaning Assurance is a public preview. These boundaries are part of the product
definition, not fine print.

Meaning Assurance 目前是 Public Preview。以下边界属于产品定义，而不是隐藏条款。

## Runtime and platform / 运行环境与平台

- Windows and PowerShell are the only tested host environment.
- Windows PowerShell 5.1 and PowerShell 7 are the supported test targets.
- Claude Code and Reasonix are the only formal non-interactive adapters.
- Some canonical filenames and environment variables retain the historical
  Agent Workbench name for compatibility.

- 当前只测试 Windows 与 PowerShell 主机环境。
- Windows PowerShell 5.1 与 PowerShell 7 是支持的测试目标。
- Claude Code 与 Reasonix 是当前正式的非交互 Adapter。
- 部分规范文件名和环境变量为兼容性保留 Agent Workbench 历史名称。

## Isolation and permissions / 隔离与权限

- A Git worktree isolates files; it is not a complete operating-system sandbox.
- External CLI permissions remain subject to each CLI's configuration.
- Meaning Assurance does not automatically merge, apply patches, or accept work.
- Runtime artifacts can contain prompts, paths, snapshots, diffs, and model
  output. They require inspection before sharing.

- Git worktree 提供文件隔离，但不是完整的操作系统级沙箱。
- 外部 CLI 权限仍受各 CLI 自身配置约束。
- Meaning Assurance 不自动合并、不自动应用 Patch，也不自动接受工作。
- 运行产物可能包含提示词、路径、快照、diff 和模型输出，分享前必须检查。

## Evidence and correctness / 证据与正确性

- Frozen evidence proves what a reviewer received, not that the evidence was
  sufficient.
- Reviewer agreement is not proof.
- A moderator outcome records a bounded decision; it is not a correctness
  guarantee.
- `not-testable` is a valid outcome when the packet cannot support a conclusion.
- The included real case is first-party dogfooding, not independent validation.

- 冻结证据只能证明 Reviewer 收到了什么，不能证明证据一定充分。
- Reviewer 一致意见不是证明。
- Moderator 裁决记录有边界的决定，但不是正确性保证。
- 当参考包不足以支持结论时，`not-testable` 是有效结果。
- 仓库内真实案例属于第一方 dogfooding，不是独立验证。

## Product surface / 产品表面

- No graphical user interface is included.
- No hosted control plane, user account system, telemetry service, or provider
  key store is included.
- The deterministic demo is an explanatory fixture. It demonstrates artifact
  relationships but does not invoke a live model.
- The public API may change before `1.0.0`.

- 当前不包含图形界面。
- 不包含托管控制面、用户系统、遥测服务或供应商 Key 存储。
- 确定性 Demo 是解释性 Fixture，用于展示产物关系，不调用真实模型。
- `1.0.0` 之前公开 API 可能发生变化。

## Claims Meaning Assurance does not make / 不作出的主张

Meaning Assurance does not claim to:

Meaning Assurance 不声称：

- guarantee correct code or correct decisions;
- provide legal, regulatory, compliance, or certification assurance;
- independently validate its own effectiveness;
- support every coding agent;
- prevent every secret or private-path disclosure; or
- eliminate the need for tests, code review, or human acceptance.

- 保证代码或决定正确；
- 提供法律、监管、合规或认证意义上的鉴证；
- 独立验证自身有效性；
- 支持所有 Coding Agent；
- 阻止所有密钥或私人路径泄漏；
- 取代测试、代码审查或人工接受。

[Back to README / 返回首页](../README.md) ·
[Privacy / 隐私](PRIVACY.md) ·
[Security / 安全](../SECURITY.md)
