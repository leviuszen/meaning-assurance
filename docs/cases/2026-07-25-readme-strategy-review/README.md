# README Strategy Discussion and Read-Only Audit

## README 战略讨论与只读审计

> **Internal dogfooding / 内部 dogfooding**
>
> This case shows Meaning Assurance reviewing its own public README. It is not
> a third-party audit, independent validation, certification, or evidence of
> product effectiveness.
>
> 本案例展示 Meaning Assurance 如何审视自己的公开 README。它不是第三方审计、
> 独立验证、认证，也不是产品有效性证据。

```text
Case type: First-party real evidence case
Mode: Read-only strategy review
Source: Actual project record
Independent validation: No
Third-party endorsement: No
Product-effectiveness proof: No
```

## Case at a Glance / 案例概览

| Item / 项目 | Record / 记录 |
|---|---|
| Subject / 对象 | The public README communication strategy / 公开 README 传播策略 |
| Date / 日期 | 2026-07-25 |
| Use case / 使用场景 | Strategic planning brainstorm followed by read-only adversarial review / 战略规划头脑风暴及后续只读对抗复审 |
| Mode / 模式 | `strategy-review` |
| Protocol / 协议 | `adversarial-discussion` |
| Audit profile / 审计配置 | `scientific` |
| External reviewer / 外部 Reviewer | Claude Code |
| Moderator / 裁决者 | Codex |
| Human authority / 人类权力 | The user authorized the work and retains final acceptance / 用户授权工作并保留最终接受权 |
| Evidence / 证据 | 9 frozen public files with SHA-256 hashes / 9 个带 SHA-256 的冻结公开文件 |
| Final state / 最终状态 | `decision_ready` |
| Outcomes / 结果 | 5 confirmed · 2 rejected · 2 duplicate · 1 not testable |

## Read the Record / 阅读记录

- [Strategy discussion / 战略讨论](strategy-discussion.md) — the initial
  strategic challenge, Codex's counter-challenge, and the Round 2 response.
- [Read-only audit / 只读审计](read-only-audit.md) — frozen evidence,
  finding-by-finding moderation, evidence boundaries, and artifact digests.

## Strategic Planning Brainstorm / 战略规划头脑风暴

This case began as a planning problem, not a request for prettier copy. The
project needed to decide how to make an unfamiliar governance mechanism
discoverable without overstating evidence or hiding its technical limits.

The brainstorm explored competing directions around:

- a problem-led trust hook versus a technical-definition-led opening;
- bilingual visibility versus first-screen density;
- the `Meaning Assurance` product promise versus the existing repository
  identity;
- human marketing psychology versus AI/GEO extractability; and
- publishing a first-party case versus the risk of self-serving proof.

It then turned those directions into seven adversarial questions, explicit
counter-challenges, evidence boundaries, and an adopt/do-not-add decision. The
result was not selected by model vote: unsupported proposals were withdrawn or
rejected, unresolved claims remained visible, and the human retained final
authority.

本案例从规划问题开始，而不是要求 Agent“把文案写得更漂亮”。项目需要决定：如何
让一个陌生的治理机制更容易被发现，同时不夸大证据，也不隐藏技术边界。

头脑风暴比较了多组相互竞争的方向：

- 问题驱动的信任钩子与技术定义驱动的开场；
- 双语可见性与首屏信息密度；
- `Meaning Assurance` 产品承诺与既有仓库身份；
- 人类营销心理与 AI/GEO 可抽取性；
- 公开第一方案例与“自我证明”风险。

这些方向随后被转化为 7 个对抗性问题、明确反向挑战、证据边界以及
“采纳/不增加”决定。结果不是由模型投票选出：缺乏支持的方案被撤回或驳回，
未解决主张保持可见，最终决定权仍由人类保留。

## What Happened / 发生了什么

1. Codex froze nine public repository files. Claude Code received the copies,
   not mutable source paths.
2. Claude Code produced a blind Round 1 strategy review with adversarial
   questions, evidence, counter-evidence, falsifiers, and recommendations.
3. Codex accepted some concerns, rejected unsupported claims, and issued eight
   targeted Round 2 questions.
4. Claude Code withdrew two findings, narrowed several claims, and supplied
   stable finding IDs.
5. Codex recorded every material outcome as `confirmed`, `rejected`,
   `duplicate`, or `not-testable`.

1. Codex 冻结了 9 个公开仓库文件。Claude Code 读取的是副本，而不是可变的源路径。
2. Claude Code 在 blind Round 1 中给出战略审视，包括对抗性问题、证据、反证、
   可证伪条件和建议。
3. Codex 接受部分问题，驳回缺乏证据的判断，并提出 8 个针对性 Round 2 追问。
4. Claude Code 撤回 2 项 finding，收窄多项判断，并补充稳定 finding ID。
5. Codex 将每项重要结果记录为 `confirmed`、`rejected`、`duplicate` 或
   `not-testable`。

## Publication Boundary / 公开边界

The repository publishes a curated, bilingual decision record. Local absolute
paths, process IDs, launcher details, invocation logs, credentials, and other
machine-specific runtime metadata are intentionally omitted. The record keeps
the questions, evidence identifiers, challenged conclusions, final outcomes,
and SHA-256 provenance needed to inspect the reasoning.

仓库公开的是经过整理的双语决策记录。本机绝对路径、进程 ID、启动器细节、调用
日志、凭据和其他机器特定运行元数据被有意省略；记录保留了检查推理所需的问题、
证据标识、受挑战结论、最终结果和 SHA-256 来源信息。
