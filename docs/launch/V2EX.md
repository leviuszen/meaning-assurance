# 候选中文技术社区发布草稿——禁止直接发布

候选渠道标签：`V2EX`。这只是规划标签，不代表发布时该渠道或任何节点仍然存在、
适合本帖或允许此类内容。

## 候选标题

```text
两个 Coding Agent 都说完成，为什么仍然不能算验证？
```

## 正文

我在使用 Claude Code、Codex 等 Coding Agent 做真实仓库工作时，反复遇到一个
问题：

> Agent 说任务完成了，我究竟凭什么相信它？

如果我不信，通常只能继续追问同一个 Agent，或者再找一个 Agent 说“帮我检查一下”。
但第二个 Agent 也表示同意，并不等于它独立核验了事实。有时只是两个系统表现出了
同步的自信。

我做了一个本地开源协议 **Meaning Assurance（AI 对抗审计助手）**，核心不是再
增加一个 Agent，而是把这些对象分开：

```text
Worker 主张
→ 冻结证据
→ Reviewer Finding
→ Moderator 裁决
→ 人类最终接受
```

仓库提供了一个不需要 API Key 的确定性 Demo：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\Run-Demo.ps1
```

Demo 故意同时放入 Worker 和 Reviewer 的错误：

```text
Worker claim: COMPLETE
Evidence: one declared test is missing; one changed file is outside scope
Review outcomes: 2 confirmed, 1 rejected, 1 not testable
Final acceptance: BLOCKED
```

这里有两个我认为比“再找一个 Agent”更重要的点：

1. Worker 声称完成，不代表检查已经完成。
2. Reviewer 提出 Finding，也不能自动获得正确性；它的过度推断同样需要被驳回。

真实工作流目前以 Windows 和 PowerShell 为主，正式非交互 Adapter 是 Claude Code
与 Reasonix。实现 Worker 使用隔离 Git worktree，Reviewer 可以读取冻结并哈希的
参考包，但系统不会自动合并。

限制也写在前面：

- Git worktree 不是操作系统级沙箱；
- 冻结证据仍可能不充分；
- 多个 Reviewer 一致不是证明；
- 仓库中的真实案例属于第一方 dogfooding；
- 协议不保证代码或决定正确。

仓库：`<最终仓库地址>`

我更希望讨论机制本身，而不是求 Star：如果是你的真实任务，在接受 Coding Agent
结果前，你还会要求什么证据？Reviewer 又有哪些常见越界方式？

## 发布前检查

- 确认候选渠道仍然存在且适合本帖。
- 根据最终内容选择当前允许此类技术讨论的节点。
- 重新阅读节点与全站规则。
- 替换仓库地址。
- 确认 Demo 可从干净 Clone 运行。
- 不写成只有链接的推广帖。
