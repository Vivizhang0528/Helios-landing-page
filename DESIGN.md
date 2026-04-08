# Ship 官网 × 插件 — 设计说明

面向 **Ship**（AI 软件研发 harness）的公开站点与 **Cursor / Claude Code / Codex 插件**在视觉与叙事上保持一致：同一套「不是 copilot，是约束与门禁」的定位。

---

## 1. 品牌与叙事


| 维度   | 官网                                       | 插件 / 文档                                |
| ---- | ---------------------------------------- | -------------------------------------- |
| 一句话  | Harness，不是聊天补全                           | README 首段                              |
| 核心隐喻 | **航道 + 门禁 + 证据链**（quality gates, phases） | stop-gate、phase artifacts              |
| 调性   | 冷静、工程感、可信赖；避免「魔法按钮」营销腔                   | 与 skills 里 L1/L2/L3 证据层级一致             |
| CTA  | GitHub、`ship.tech`、各运行时安装入口              | marketplace / `/plugin` / Cursor hooks |


---

## 2. 视觉语言（Design tokens）

与落地页 `styles.css` 中 CSS 变量对齐，便于以后做插件图标、文档站或 Figma。


| Token           | 值                          | 用途           |
| --------------- | -------------------------- | ------------ |
| `--bg-deep`     | `#070b12`                  | 主背景          |
| `--bg-elevated` | `#0f1623`                  | 卡片、导航条       |
| `--text`        | `#e8edf5`                  | 主文案          |
| `--text-muted`  | `#8b9cb3`                  | 次要说明         |
| `--accent`      | `#2ee6c0`                  | 主强调（通行/门禁通过） |
| `--accent-dim`  | `#1a9e86`                  | 悬停、边框        |
| `--warning`     | `#f0b429`                  | 警示步骤、次要高亮    |
| `--border`      | `rgba(46, 230, 192, 0.12)` | 细分隔          |


**字体**

- 标题/UI：`Outfit`（几何、偏工程，非通用 Inter）
- 正文：`Source Sans 3`
- 等宽/命令：`JetBrains Mono`

**图形语言**

- 细线网格 + 轻微噪点：暗示「规范、可重复流程」
- 阶段用 **横向航道线 + 节点**（非卡通船插图），与 pipeline 心智一致
- 无库存图；必要装饰用内联 SVG（罗盘刻度简化图形）

---

## 3. 信息架构（单页）

1. **Hero**：产品名 + 副标题 + 双 CTA（GitHub / 了解工作流）
2. **Problem**：AI agent 不可靠的几种失败模式（与 README 对齐）
3. **Pillars**：Orchestrator / 对抗式规划 / 证据优先 / TDD（四卡）
4. **Pipeline**：design → dev → review → qa → handoff（简版，可链到文档）
5. **Skills**：表格或卡片，与 README 技能表一致（含 Cursor 说明：skills + hooks，非 `/ship` 必选）
6. **Install**：Claude Code / Codex / Cursor 三列
7. **Footer**：MIT、Helio / ship.tech、GitHub

---

## 4. 与插件物料的对应关系


| 官网区块             | 插件侧                                              |
| ---------------- | ------------------------------------------------ |
| Install · Cursor | `.cursor-plugin/plugin.json`、`hooks-cursor.json` |
| Skills 列表        | `skills/*/SKILL.md` 目录名与展示名                      |
| Quality gates    | `stop-gate.sh`、`.ship/` 状态（文案层提及即可）              |


---

## 5. 后续可扩展

- 独立 `docs` 子路径或第二页：深度讲 L1/L2/L3 证据、peer challenger
- 暗色截图区：Cursor 中 skills 面板（需产品图）
- Open Graph：`og:image` 使用纯 CSS 导出或简单 SVG

---

## 6. 本地预览

在 `website` 目录执行：

```bash
npx --yes serve .
```

或直接双击打开 `index.html`（部分字体仍从 CDN 加载，需联网）。