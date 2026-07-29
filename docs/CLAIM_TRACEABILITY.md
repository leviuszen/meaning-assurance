# Public Claim Traceability / 公开主张追溯

This ledger maps high-impact public statements to inspectable repository
evidence. It prevents launch copy from outrunning implementation.

本台账将高影响公开主张映射到可检查的仓库证据，避免传播文案超越实际实现。

| Public claim / 公开主张 | Evidence / 证据 | Boundary / 边界 |
|---|---|---|
| Implementation workers use isolated Git worktrees. / 实现 Worker 使用隔离 Git worktree。 | `scripts/New-AgentWorktree.ps1`; `tests/test-agent-worktree.ps1`; `tests/test-public-example-workflows.ps1` | File isolation, not an OS sandbox. / 文件隔离，不是 OS 沙箱。 |
| Review references can be frozen, inventoried, and hashed. / 复审材料可以冻结、清点并哈希。 | `scripts/New-AgentDiscussion.ps1`; `scripts/Test-AgentReferenceManifest.ps1`; `tests/test-agent-discussion.ps1` | Hashes identify supplied bytes; they do not prove sufficiency. / 哈希标识所提供字节，不证明证据充分。 |
| Missing canonical reviewer files block completion. / 缺少规范 Reviewer 文件会阻止完成。 | `scripts/Collect-AgentDiscussion.ps1`; `tests/test-agent-discussion.ps1` | Applies to governed discussion packets. / 适用于受控 discussion packet。 |
| Reviewer agreement is not treated as proof. / Reviewer 一致意见不被视为证明。 | `docs/PROTOCOL.md`; `scripts/Record-AgentAuditOutcome.ps1`; `tests/test-agent-audit-calibration.ps1` | Moderator verification can still be incomplete. / Moderator 核验仍可能不完整。 |
| Findings can be confirmed, rejected, deduplicated, or marked not testable. / Finding 可被确认、驳回、去重或标记为不可检验。 | `scripts/Record-AgentAuditOutcome.ps1`; `tests/test-agent-audit-calibration.ps1` | These are bounded moderation outcomes, not universal truth labels. / 这些是有边界裁决结果，不是普遍真值。 |
| Caller timeouts do not require blind duplicate retries. / 调用超时后不需要盲目重复启动。 | invocation lease handling in `scripts/Invoke-ClaudeFeedback.ps1`; `tests/test-agent-audit-reliability.ps1` | Depends on the recorded process and completion state. / 依赖已记录的进程与完成状态。 |
| The system does not automatically merge worker changes. / 系统不会自动合并 Worker 修改。 | `scripts/Collect-AgentResult.ps1`; `docs/ARCHITECTURE.md`; worktree tests | Humans or controllers may merge separately after authorization. / 人类或 Controller 可在另行授权后合并。 |
| The deterministic demo needs no provider key. / 确定性 Demo 不需要供应商 Key。 | `scripts/Run-Demo.ps1`; `examples/demo-fixture/`; `tests/test-run-demo.ps1` | The demo uses fixed evidence and does not invoke a live model. / Demo 使用固定证据，不调用真实模型。 |
| The published case is a real first-party audit record. / 公开案例是真实第一方审计记录。 | `docs/cases/2026-07-25-readme-strategy-review/` with artifact digests | Not third-party validation or product-effectiveness proof. / 不是第三方验证或产品有效性证明。 |
| Meaning Assurance can structure strategic planning brainstorming. / Meaning Assurance 可以组织战略规划头脑风暴。 | `scripts/New-AgentDiscussion.ps1` with `strategy-review`; `docs/cases/2026-07-25-readme-strategy-review/` | It structures candidate options, adversarial questions, and a decision record; it does not automatically choose a correct strategy or provide market validation. / 它组织候选方案、对抗性追问和决策记录，不会自动选择正确战略，也不等于市场验证。 |
| Meaning Assurance keeps final acceptance human-controlled. / Meaning Assurance 将最终接受权留给人类。 | task and discussion status gates; `docs/PROTOCOL.md`; `docs/ARCHITECTURE.md` | The protocol preserves the boundary; it cannot guarantee good human judgment. / 协议保留边界，但不能保证人类判断正确。 |

## Claims prohibited in launch materials / 发布材料禁止主张

- guaranteed correctness or defect detection;
- independent validation of product effectiveness;
- legal, compliance, certification, or formal audit assurance;
- cross-platform support not covered by tests;
- support for adapters that are not implemented;
- adoption, performance, conversion, ranking, or market-demand numbers without
  current traceable evidence.

- 保证正确或保证发现缺陷；
- 产品有效性已经获得独立验证；
- 法律、合规、认证或正式审计意义上的鉴证；
- 测试没有覆盖的跨平台支持；
- 尚未实现的 Adapter 支持；
- 缺少当前可追溯证据的采用率、性能、转化率、排名或市场需求数字。
