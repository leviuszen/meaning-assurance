# GitHub Pages Decision / GitHub Pages 决定

**Status:** deferred from the v0.2.0 release candidate.

**状态：**不纳入 v0.2.0 发布候选。

## Reason / 原因

The v0.2.0 first-contact path is already complete in the repository:

v0.2.0 的首次接触路径已经在仓库内完整形成：

```text
problem-first README
→ deterministic one-command demo
→ real first-party evidence case
→ protocol and limitations
→ native launch drafts
```

Adding Pages before the repository-rename decision would create a second public
URL and a second copy of the same facts. The project Pages URL also depends on
the final repository slug. Building it now would increase migration and
maintenance work without adding a distinct proof or activation path.

在仓库改名决定前增加 Pages，会产生第二个公开 URL 和第二份相同事实来源；项目
Pages URL 还依赖最终仓库 slug。现在建设会增加迁移与维护成本，却不会增加新的
证明或激活路径。

## Revisit conditions / 重新评估条件

Reconsider a static Pages entry only when:

仅在以下条件满足后重新评估静态 Pages：

- the repository slug is final;
- README analytics or community feedback show that GitHub is a material
  first-contact barrier;
- the page can reuse repository assets without a second content source;
- no framework or complex build pipeline is introduced; and
- the page can be built and verified within half a day.

Deferral does not block the local v0.2.0 candidate.

后置 Pages 不阻挡本地 v0.2.0 候选。
