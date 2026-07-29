# Deterministic Decision-Trail Demo

## 确定性裁决链演示

This fixture is a synthetic, credential-free explanation of the Meaning
Assurance artifact model. It is not a real user case, a live model run, or
evidence of product effectiveness.

本 Fixture 是一个无需凭据的合成示例，用于解释 Meaning Assurance 的产物关系。
它不是真实用户案例，不调用真实模型，也不是产品有效性证据。

## Scenario / 场景

A worker is asked to add one bounded validation rule, change only two allowed
files, and run three checks. The worker claims `COMPLETE`.

Worker 被要求增加一项有边界的校验规则，只修改两个允许文件，并运行三项检查。
Worker 随后声称 `COMPLETE`。

Frozen evidence shows:

冻结证据显示：

- only two of the three declared checks were run;
- one file outside the allowed scope was changed;
- the two executed tests passed; and
- no performance evidence was supplied.

- 三项声明检查中只运行了两项；
- 修改了一个范围之外的文件；
- 已执行的两项测试均通过；
- 没有提供性能证据。

The reviewer produces four findings. Moderation confirms two, rejects one
overstatement, and marks one claim not testable. Final human acceptance remains
blocked.

Reviewer 提出四项 Finding。Moderator 确认其中两项，驳回一项过度判断，并将一项
结论标记为不可检验。最终人工接受状态保持阻断。

Run the fixture with:

运行方式：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\Run-Demo.ps1
```

[Back to README / 返回首页](../../README.md)
