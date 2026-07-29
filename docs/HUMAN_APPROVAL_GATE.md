# Human Approval Gate / 人类接受门

## Why the gate exists

A coding agent can propose code. A reviewer can propose findings. A moderator
can classify those findings. None of those roles should silently convert its own
output into accepted repository state.

The human approval gate is the boundary between:

```text
the available evidence supports this bounded conclusion
```

and:

```text
the project accepts the change and its remaining risk
```

Meaning Assurance preserves the first statement so a human can make the second.

## Evidence before acceptance

Before accepting an agent change, check:

- **Scope:** the implementation stayed inside the authorized files and task.
- **Diff:** the isolated worktree contains only intended changes.
- **Checks:** declared tests and required validation actually ran.
- **Evidence identity:** reviewers inspected the frozen files recorded by the
  manifest and hashes.
- **Findings:** blocking findings are resolved or explicitly rejected with
  evidence.
- **Disagreement:** unresolved material disagreement remains visible.
- **Authority:** no worker, reviewer, or script merged or accepted the work on
  the human's behalf.

## Possible human decisions

The gate does not force a binary answer. A human may:

- accept the bounded result;
- reject it;
- request a narrower implementation;
- require another test or evidence source;
- keep a finding as `not-testable`; or
- defer the decision while disagreement remains unresolved.

## What the gate is not

The human approval gate is not a claim that every human decision is correct. It
is also not a hosted approval service, compliance certification, automatic merge
rule, or substitute for branch protection.

Meaning Assurance includes no automatic merge or patch application. Repository
settings and organizational approval policies remain separate controls.

## Related guidance

- [Coding agent verification](CODING_AGENT_VERIFICATION.md)
- [Claude Code review workflow](CLAUDE_CODE_REVIEW_WORKFLOW.md)
- [Architecture and trust model](ARCHITECTURE.md)
- [Current limitations](LIMITATIONS.md)

---

## 为什么需要这道门？

Coding Agent 可以提出代码，Reviewer 可以提出 Finding，Moderator 可以裁决这些
Finding，但任何角色都不应该悄悄把自己的输出转化为仓库已经接受的状态。

人类接受门用于区分：

```text
当前证据支持这项有边界的结论
```

和：

```text
项目接受这项变更及其剩余风险
```

Meaning Assurance 保存第一项陈述所需的证据，由人类作出第二项决定。

## 接受前检查证据

接受 Agent 变更前，应检查：

- **范围：**实现始终位于授权任务和文件范围内。
- **Diff：**隔离 worktree 只包含预期修改。
- **检查：**声明的测试和必要验证确实执行过。
- **证据身份：**Reviewer 检查的是清单和哈希所记录的冻结文件。
- **Finding：**阻断 Finding 已解决，或已经依据证据明确驳回。
- **分歧：**尚未解决的重要分歧仍然保持可见。
- **权力：**Worker、Reviewer 和脚本都没有代替人类合并或接受工作。

## 人类可以作出的决定

这道门不强迫人类只回答“通过”或“不通过”。人类可以：

- 接受有边界的结果；
- 拒绝结果；
- 要求缩小实现范围；
- 要求增加测试或新的证据来源；
- 将某项 Finding 保持为 `not-testable`；
- 在重要分歧解决前推迟决定。

## 它不是什么？

人类接受门并不声称每个人类决定都正确。它也不是托管审批服务、合规认证、自动
合并规则或分支保护的替代品。

Meaning Assurance 不包含自动合并或自动应用 Patch。仓库设置和组织审批政策仍是
相互独立的控制层。

## 相关指南

- [Coding Agent 证据核验](CODING_AGENT_VERIFICATION.md)
- [Claude Code 复核工作流](CLAUDE_CODE_REVIEW_WORKFLOW.md)
- [架构与信任模型](ARCHITECTURE.md)
- [当前限制](LIMITATIONS.md)
