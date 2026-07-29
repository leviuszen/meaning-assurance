# GitHub Pages Decision / GitHub Pages 决定

**Status:** authorized and implemented for the v0.2.0 launch.

**状态：**已授权，并在 v0.2.0 发布窗口实施。

## Purpose / 用途

The repository slug is final. The Pages site is a small static discovery,
sharing, and measurement entry that links back to versioned repository facts.
It does not introduce a framework, CMS, database, hosted control plane, or
second product backend.

仓库 slug 已经确定。Pages 仅作为轻量静态发现、分享与测量入口，并链接回仓库中
受版本控制的事实来源；它不引入框架、CMS、数据库、托管控制面或第二套产品后端。

## Implemented boundary / 实施边界

The implementation:

- uses plain HTML and CSS under `site/`;
- provides English and Simplified Chinese entry pages;
- exposes the no-key demo and bounded first-party strategy-review case;
- uses the repository README, Release, protocol, and limitations as canonical
  sources;
- provides canonical, hreflang, Open Graph, robots, and sitemap metadata; and
- deploys through the official GitHub Pages Actions workflow.

本次实施：

- 使用 `site/` 下的纯 HTML 与 CSS；
- 提供英文和简体中文入口；
- 公开无需 Key 的 Demo 与有边界的第一方战略复审案例；
- 以仓库 README、Release、协议和限制说明为事实来源；
- 提供 canonical、hreflang、Open Graph、robots 与 sitemap 元数据；
- 通过 GitHub Pages 官方 Actions 工作流部署。

Pages improves search intake and link sharing. It does not itself create
audience demand or guarantee indexing or ranking.

Pages 改善搜索承接与链接分享，但本身不会创造受众需求，也不保证收录或排名。
