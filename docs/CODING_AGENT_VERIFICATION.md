# Coding Agent Verification / Coding Agent 证据核验

## What problem does it solve?

A coding agent can edit files, run commands, and produce a convincing completion
message. That message is still a claim. Coding agent verification asks a
different question:

> What evidence supports the agent's “done” claim, what contradicts it, and who
> has authority to accept the result?

Meaning Assurance is a local-first protocol for answering that question with
file-backed evidence rather than another reassuring chat response.

## What verification means here

Meaning Assurance separates five records:

1. **Worker claim** — what the coding agent says it completed.
2. **Frozen evidence** — the files, manifests, hashes, diffs, and test output
   supplied for review.
3. **Reviewer findings** — challenges tied to that bounded evidence.
4. **Moderated outcomes** — findings recorded as `confirmed`, `rejected`,
   `duplicate`, or `not-testable`.
5. **Human acceptance** — the decision to accept, reject, or request more
   evidence.

This structure makes disagreement inspectable. A second agent's agreement does
not become proof merely because it is confident.

## Evidence to inspect

For an implementation task, inspect at least:

- the authorized task packet and scope;
- the isolated Git worktree diff;
- the frozen reference manifest and hashes;
- the canonical worker and reviewer results;
- the commands and test output that support the completion claim;
- confirmed and unresolved findings; and
- the final decision record.

The [deterministic demo](../examples/demo-fixture/README.md) shows a worker
claiming `COMPLETE` while the evidence shows a missing declared test and an
out-of-scope file. The final acceptance remains `BLOCKED`.

## What it does not prove

Frozen evidence proves what a reviewer received, not that the packet was
complete. Reviewer agreement is not proof. A moderated outcome is a bounded
decision, not a correctness guarantee.

Meaning Assurance therefore complements tests, code review, security controls,
and human judgment. It does not replace them.

## Start here

- [Run the five-minute demo](QUICKSTART.md)
- [Read the protocol](PROTOCOL.md)
- [Review Claude Code output](CLAUDE_CODE_REVIEW_WORKFLOW.md)
- [Keep final acceptance human](HUMAN_APPROVAL_GATE.md)
- [Read the current limitations](LIMITATIONS.md)

---

## 它解决什么问题？

Coding Agent 可以修改文件、执行命令，并生成一份很有说服力的完成报告。但这份
报告仍然只是一项主张。Coding Agent 证据核验追问的是：

> 有什么证据支持 Agent 的“已经完成”声明？哪些证据与它矛盾？谁拥有最终接受权？

Meaning Assurance 是一套本地优先协议。它使用可检查的文件证据回答这些问题，而
不是继续向同一个对话索取更让人安心的说法。

## 这里的“核验”意味着什么？

Meaning Assurance 将五类记录分开：

1. **Worker 主张**——Coding Agent 声称完成了什么。
2. **冻结证据**——提交给 Reviewer 的文件、清单、哈希、diff 和测试输出。
3. **Reviewer Finding**——针对有边界证据提出的挑战。
4. **Moderator 裁决**——将 Finding 记录为 `confirmed`、`rejected`、
   `duplicate` 或 `not-testable`。
5. **人类接受**——决定接受、拒绝或要求补充证据。

这种结构让分歧保持可见。第二个 Agent 即使同样自信，它的一致意见也不会自动
变成证明。

## 应检查哪些证据？

对实现任务，至少检查：

- 授权任务包和范围；
- 隔离 Git worktree 的 diff；
- 冻结参考清单与哈希；
- 规范的 Worker 和 Reviewer 结果；
- 支持完成声明的命令与测试输出；
- 已确认和仍未解决的 Finding；
- 最终决定记录。

[确定性 Demo](../examples/demo-fixture/README.md) 展示了一个 Worker 声称
`COMPLETE`，但证据显示缺少声明测试且存在范围外文件的案例，因此最终接受状态
保持为 `BLOCKED`。

## 它不能证明什么？

冻结证据只能证明 Reviewer 收到了什么，不能证明证据包一定完整。Reviewer 一致
不是证明；Moderator 裁决是有边界的决定，不是正确性保证。

因此，Meaning Assurance 用于补充测试、代码审查、安全控制和人类判断，而不是
取代它们。

## 从这里开始

- [运行五分钟 Demo](QUICKSTART.md)
- [阅读协议](PROTOCOL.md)
- [复核 Claude Code 输出](CLAUDE_CODE_REVIEW_WORKFLOW.md)
- [把最终接受权留给人类](HUMAN_APPROVAL_GATE.md)
- [阅读当前限制](LIMITATIONS.md)
