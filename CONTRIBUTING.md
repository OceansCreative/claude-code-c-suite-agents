# Contributing

このリポジトリへの貢献を歓迎します。Issue 報告・改善 PR・新エージェント追加 PR、いずれも歓迎です。
[English version below](#english).

## 貢献の種類

| 種類 | 受付方針 |
|---|---|
| 既存エージェントの改善 | 既存ファイルの構造（フロントマター + 役割 + 呼び出し例 + 判断基準 + 出力形式 + 重要な注意）を維持してください |
| 新エージェントの追加 | 「ひとり経営者の意思決定を補佐する」スコープに合っていれば歓迎。下記の規約参照 |
| README / 例の改善 | 誤字修正・記入例の追加・実体験ベースの修正、いずれも歓迎 |
| バグ報告 | Issue で再現手順を添えてください |
| 機能要望 | Issue で背景（どんな状況で何に困ったか）を書いてください |

## エージェント追加の規約

### 1. ファイル名と配置
- パス：`.claude/agents/<agent-name>.md`
- ファイル名はケバブケース（`code-reviewer.md` のように）
- `agent-name` はそのまま `@<name>` での呼び出し記号になる

### 2. フロントマター
```yaml
---
name: <agent-name>            # ファイル名と一致
description: <呼び出すべき場面を具体的に。description で呼び分けが決まる>
tools: <必要なツールのみ。Read, Write, Edit, Bash, Glob, Grep, WebFetch, WebSearch から選択>
---
```

`tools` は最小権限の原則で。`Bash` を入れる場合は理由が説明できる役割であること。

### 3. 本文構造（推奨）
```markdown
あなたは {{COMPANY_NAME}} の <役割名> エージェントです。

## 呼び出し例
- `@<name> <具体的なプロンプト 1>`
- `@<name> <具体的なプロンプト 2>`
- `@<name> <具体的なプロンプト 3>`

## 役割
- <この エージェントが対応する具体的タスクを箇条書き>

## 判断基準
- <ひとり経営前提の判断軸を書く。「人を雇う前提を入れない」「キャッシュフロー優先」など本テンプレ全体の方針と整合させる>

## 出力形式の推奨
- <レスポンスの構造化方針>

## 重要な注意
- <専門家への委ねを明記。法律・税務・医療など>
```

### 4. README の更新
新エージェントを追加した場合、README の日本語版・英語版両方の「含まれるエージェント」表に行を追加してください。

## コミット・PR

- ブランチ名：`feat/<agent-name>` `fix/<short-desc>` `docs/<short-desc>`
- コミットメッセージは命令形 1 行サマリ + 必要なら本文。日本語・英語どちらでも可
- PR には「何を変えたか」「なぜ変えたか」を簡潔に書いてください
- 機微情報（実在の会社名・契約金額・係争中の固有名詞など）が含まれていないか push 前に確認してください

## 動作確認

エージェント定義を編集したら、Claude Code で実際に呼び出してレスポンス品質を確認することを推奨します（自動テストは現状ありません）。

---

<a id="english"></a>

# Contributing (English)

Contributions welcome — bug reports, improvements, and new agents.

## Types of contribution

| Type | Notes |
|---|---|
| Improving existing agents | Keep the file structure (frontmatter + role + usage examples + criteria + output format + important notes) consistent |
| Adding a new agent | Welcome if it fits the "support a solo founder's decision-making" scope. See conventions below |
| README / example improvements | Typos, additional examples, lessons learned from real use — all welcome |
| Bug reports | File an Issue with reproduction steps |
| Feature requests | File an Issue describing the situation and pain point |

## Agent conventions

### File path and naming
- Path: `.claude/agents/<agent-name>.md`
- Kebab-case filenames (e.g. `code-reviewer.md`)
- `agent-name` becomes the `@<name>` invocation handle

### Frontmatter
```yaml
---
name: <agent-name>
description: <When to invoke. The description drives which agent gets selected>
tools: <Minimum tools needed. Pick from Read, Write, Edit, Bash, Glob, Grep, WebFetch, WebSearch>
---
```

Apply least-privilege. Justify `Bash` if you include it.

### Body structure
```markdown
You are the <role> agent for {{COMPANY_NAME}}.

## Usage examples
- `@<name> <prompt 1>`
- `@<name> <prompt 2>`
- `@<name> <prompt 3>`

## Role
- <Concrete tasks this agent handles>

## Judgment criteria
- <Solo-founder-aligned criteria. "No 'hire someone' suggestions", "cash flow first", etc.>

## Output format (recommended)
- <How to structure responses>

## Important notes
- <Defer to professionals where applicable: law, tax, medicine>
```

### README updates
If you add a new agent, update both the Japanese and English agent tables in `README.md`.

## Commits and PRs

- Branch naming: `feat/<agent-name>` / `fix/<short-desc>` / `docs/<short-desc>`
- Commit messages: imperative subject line + body if needed. Japanese or English both fine.
- PR description: what changed and why
- Before pushing: scan for sensitive info (real company names, contract amounts, ongoing dispute parties)

## Testing

After editing an agent definition, invoke it from Claude Code to spot-check response quality (no automated tests yet).
