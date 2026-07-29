# Claude Code Review Workflow / Claude Code 复核工作流

## The verification question

When Claude Code says a task is complete, do not ask only whether the answer
sounds plausible. Ask:

- Did it stay inside the authorized scope?
- What files changed in the isolated worktree?
- Were the declared checks actually run?
- What exact evidence did the reviewer receive?
- Which findings survived verification?
- Which decision still requires a human?

Meaning Assurance treats Claude Code as a replaceable worker or reviewer role,
not as an authority that can approve its own output.

## Implementation path

For a task that allows Claude Code to edit code:

1. Create a bounded task packet with `New-AgentTask.ps1`.
2. Create an isolated Git worktree with `New-AgentWorktree.ps1`.
3. Run the worker through `Invoke-AgentTask.ps1`.
4. Collect the canonical result, logs, metrics, and isolated diff.
5. Run the relevant repository tests outside the worker's completion message.
6. Review the evidence before accepting or merging anything.

Meaning Assurance does not automatically apply the patch or merge the worker
branch.

## Read-only adversarial review path

To challenge a Claude Code completion claim without allowing the reviewer to
edit:

1. Define the question, scope, non-goals, and expected review sections.
2. Freeze the relevant source files, diff, test output, and claim as a reference
   bundle.
3. Create a discussion with `New-AgentDiscussion.ps1`.
4. Run a supported reviewer through the governed feedback runner.
5. Collect canonical findings and the disagreement matrix.
6. Verify each material finding against files, tests, or other direct evidence.
7. Record unsupported conclusions as `rejected` or `not-testable`.
8. Leave final acceptance with a human.

A fresh review context reduces shared conversational bias, but it does not prove
statistical independence. Two Claude sessions can still repeat the same error.
Evidence, not model agreement, determines the moderated outcome.

## What to preserve

Keep these artifacts together:

- task or discussion packet;
- frozen reference manifest and hashes;
- canonical worker and reviewer outputs;
- isolated worktree diff;
- test output;
- normalized findings and moderation outcomes;
- unresolved disagreement; and
- `decision.md` or `user-decision-needed.md`.

Runtime artifacts may contain prompts, paths, diffs, and model output. Inspect
and redact them before sharing.

## Related guidance

- [Five-minute quick start](QUICKSTART.md)
- [Coding agent verification](CODING_AGENT_VERIFICATION.md)
- [Protocol](PROTOCOL.md)
- [Architecture](ARCHITECTURE.md)
- [Privacy](PRIVACY.md)
- [Current limitations](LIMITATIONS.md)

---

## 要核验的问题

当 Claude Code 声称任务完成时，不要只判断它的回答听起来是否可信，而应追问：

- 它是否始终处于授权范围内？
- 隔离 worktree 中究竟修改了哪些文件？
- 所有声明过的检查是否真的执行？
- Reviewer 实际收到了哪些证据？
- 哪些 Finding 经受住了核验？
- 哪项决定仍然必须由人类作出？

Meaning Assurance 将 Claude Code 视为可替换的 Worker 或 Reviewer 角色，而不是
能够批准自己输出的权威。

## 实现路径

当任务允许 Claude Code 修改代码时：

1. 使用 `New-AgentTask.ps1` 创建有边界的任务包。
2. 使用 `New-AgentWorktree.ps1` 创建隔离 Git worktree。
3. 通过 `Invoke-AgentTask.ps1` 运行 Worker。
4. 收集规范结果、日志、指标和隔离 diff。
5. 在 Worker 的完成报告之外运行相关仓库测试。
6. 在接受或合并任何内容之前检查证据。

Meaning Assurance 不会自动应用 Patch，也不会自动合并 Worker 分支。

## 只读对抗复审路径

如果要挑战 Claude Code 的完成声明，同时不允许 Reviewer 修改文件：

1. 定义问题、范围、非目标和预期复审章节。
2. 将相关源文件、diff、测试输出和完成主张冻结为参考包。
3. 使用 `New-AgentDiscussion.ps1` 创建 discussion。
4. 通过受控 Feedback Runner 运行受支持的 Reviewer。
5. 收集规范 Finding 和分歧矩阵。
6. 根据文件、测试或其他直接证据核验每项重要 Finding。
7. 将缺乏支持的结论记录为 `rejected` 或 `not-testable`。
8. 把最终接受权留给人类。

新的复审上下文可以减少共享对话偏差，但不能证明统计独立性。两个 Claude 会话仍
可能重复同一种错误；裁决结果取决于证据，而不是模型一致意见。

## 应保留什么？

将以下产物一起保留：

- task 或 discussion 包；
- 冻结参考清单与哈希；
- 规范的 Worker 和 Reviewer 输出；
- 隔离 worktree diff；
- 测试输出；
- 规范化 Finding 与裁决结果；
- 未解决分歧；
- `decision.md` 或 `user-decision-needed.md`。

运行产物可能包含提示词、路径、diff 和模型输出，分享前必须检查并脱敏。

## 相关指南

- [五分钟快速开始](QUICKSTART.md)
- [Coding Agent 证据核验](CODING_AGENT_VERIFICATION.md)
- [协议](PROTOCOL.md)
- [架构](ARCHITECTURE.md)
- [隐私](PRIVACY.md)
- [当前限制](LIMITATIONS.md)
