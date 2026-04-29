# Claude Code C-Suite Agents

> ひとり社長・ひとり法人・個人事業主のための Claude Code サブエージェント集。
> CFO・CTO・CLO から補助金リサーチャーまで、外部委託すれば月数十万円かかる役割を AI で内製化する。

[English version below](#english)

---

## 🎯 これは何か

[Claude Code](https://docs.claude.com/en/docs/claude-code/overview) のサブエージェント機能を使って、ひとり経営者の意思決定を補佐する **13 の専門エージェント**を定義したテンプレート集です。

`CLAUDE.md` に自社の経営コンテキスト（事業フェーズ・プロダクト・技術スタック・判断ルール）を一度書いておけば、各エージェントがそれを踏まえて回答してくれます。

```
あなた: @cfo
        来期の役員報酬を上げるか下げるか迷っている。判断材料を出して。

cfo:    現在のキャッシュ残高と累積損失を踏まえると、私の優先順位は…
        （御社の状況に合わせた具体的助言）
```

## 👥 含まれるエージェント

| エージェント | 主な相談内容 |
|---|---|
| **cfo** | 財務・キャッシュフロー・役員報酬・税務・補助金/融資判断 |
| **cto** | 技術選定・アーキテクチャ・開発優先度・技術的負債 |
| **clo** | 契約レビュー・法的リスク・紛争対応・利用規約 |
| **cmo** | マーケ戦略・SEO/AIO/LLMO・コンテンツ・ブランディング |
| **cpo** | プロダクトロードマップ・MVP 設計・機能優先度 |
| **cro** | 価格設計・初期ユーザー獲得・収益化戦略 |
| **cso** | 中長期事業戦略・撤退判断・ポートフォリオ設計 |
| **ciso** | 情報セキュリティ・個人情報保護・API 利用規約遵守 |
| **code-reviewer** | コード品質レビュー・脆弱性チェック・リファクタリング提案 |
| **competitor-analyst** | 競合調査・差別化ポイント整理・市場規模把握 |
| **content-writer** | ブログ・LP・Kindle 原稿・SNS の文章作成 |
| **contract-drafter** | 業務委託契約書・NDA・利用規約のドラフト作成 |
| **grant-researcher** | 補助金・助成金の調査と申請書類サポート |

## 🚀 クイックスタート

### 1. リポジトリをクローンして設定をコピー

```bash
# このリポジトリを任意の場所にクローン
git clone https://github.com/OceansCreative/claude-code-c-suite-agents.git ~/c-suite-agents

# 自分のプロジェクトディレクトリに移動して設定をコピー
cd /path/to/your/project
cp -r ~/c-suite-agents/.claude .
cp ~/c-suite-agents/CLAUDE.md.template ./CLAUDE.md
```

### 2. `CLAUDE.md` を埋める

`CLAUDE.md` 内のプレースホルダー（`{{...}}` の箇所）を自社情報で置換します。
ゼロから埋めるのが面倒な場合は、`examples/CLAUDE.sample-studio.md`（架空の一人合同会社の記入例）をベースに書き換えるのが速いです。

```bash
# 記入例をベースにする場合（上の cp コマンドの代わり）
cp ~/c-suite-agents/examples/CLAUDE.sample-studio.md ./CLAUDE.md
# その後、自社情報に置換
```

### 3. パーミッション設定（任意）

`.claude/settings.json.template` に、ひとり経営者の Claude Code 利用を想定した安全めなデフォルト許可（git・各種パッケージマネージャ・read-only シェル・公式ドキュメント参照など）が入っています。
そのまま使うなら `settings.json` にコピー、用途に応じて追加・削除してください。

```bash
cp .claude/settings.json.template .claude/settings.json
```

なお、個別マシン固有の許可は `settings.local.json`（`.gitignore` 済み）に書くとリポジトリを汚さずに済みます。

### 4. エージェントの呼び出し

Claude Code 上で `/agents` コマンドを使うか、自然言語で呼び出します。

```
@cfo 来月のキャッシュフロー予測を出して
@cto 既存 DB スキーマをレビューして
@clo この業務委託契約書のリスク箇所を洗い出して
```

## 🛠️ カスタマイズ

各エージェント（`.claude/agents/*.md`）は YAML フロントマター + 役割定義の Markdown です。

```markdown
---
name: cfo
description: 財務分析・資金繰り・税務戦略について相談するときに使う
tools: Read, Write, Edit
---

あなたは {{COMPANY_NAME}} の CFO として判断・助言するエージェントです。
...
```

事業内容に合わせて `description` ・役割・判断基準を書き換えてください。
不要なエージェントは削除、新規エージェントは追加可能です。

## 💡 設計思想

このテンプレートは「**ひとり法人・ひとり個人事業主**」を主な想定読者として作られています。

- **固定費最小化**：判断基準には「人を雇う」前提を入れない
- **キャッシュフロー最優先**：将来の売上より今の手元資金を重視する
- **書面化の徹底**：法務・契約周りは必ず書面化を促す
- **専門家への委ねを明記**：法律・税務の最終判断は弁護士・税理士に委ねる旨を必ず付記

## 📜 ライセンス

MIT License - [LICENSE](./LICENSE) を参照。

自由に fork ・改変・商用利用してください。改善案やプルリクエスト歓迎です。

## 🙋 つくったひと

開発・メンテナンス：**池田和司（[OceansBase](https://oceans-base.com)）**

[OceansBase](https://oceans-base.com) は島根県を拠点とする個人事業屋号で、受託開発・IT コンサル・コンテンツ制作を行っています。

ホスティング元の [OceansCreative](https://oceans-creative.com) は同代表者が運営する法人で、SaaS プロダクト開発を行っています。
本テンプレートは OceansCreative 内で実運用しているエージェント定義をベースに、OceansBase が汎用化・公開しています。

---

<a id="english"></a>

# Claude Code C-Suite Agents (English)

> A collection of [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) subagents for solo founders, one-person LLCs, and freelancers. Replicate a full C-suite (CFO, CTO, CLO, etc.) for the cost of a Claude subscription.

## 🎯 What is this?

A template defining **13 specialist agents** for [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) that act as the executive team for a one-person operation. Define your business context once in `CLAUDE.md`, and every agent advises based on it.

```
You: @cfo
     I'm torn on whether to raise or cut my owner's salary next year.

cfo: Based on your current cash position and accumulated losses,
     my priority would be...
     (concrete advice tailored to your context)
```

## 👥 Included Agents

| Agent | Typical use |
|---|---|
| **cfo** | Cash flow, owner's salary, tax strategy, grants vs. loans |
| **cto** | Tech stack choices, architecture, dev priorities, technical debt |
| **clo** | Contract review, legal risk, dispute response, terms of service |
| **cmo** | Marketing strategy, SEO/AIO/LLMO, content, branding |
| **cpo** | Product roadmap, MVP scoping, feature prioritization |
| **cro** | Pricing, early-user acquisition, monetization |
| **cso** | Mid-to-long-term strategy, exit/portfolio decisions |
| **ciso** | InfoSec policy, privacy law compliance, API ToS |
| **code-reviewer** | Code quality review, security checks, refactoring |
| **competitor-analyst** | Competitor research, differentiation, market sizing |
| **content-writer** | Blog posts, landing pages, Kindle drafts, social copy |
| **contract-drafter** | Drafting NDAs, service agreements, terms of service |
| **grant-researcher** | Grant/subsidy research and application support |

## 🚀 Quickstart

### 1. Clone and copy the configuration

```bash
# Clone this repo somewhere convenient
git clone https://github.com/OceansCreative/claude-code-c-suite-agents.git ~/c-suite-agents

# From your project directory, copy the agents and CLAUDE.md template
cd /path/to/your/project
cp -r ~/c-suite-agents/.claude .
cp ~/c-suite-agents/CLAUDE.md.template ./CLAUDE.md
```

### 2. Fill in `CLAUDE.md`

Replace the `{{...}}` placeholders with your company info.
If filling in from scratch feels tedious, start from the worked example:

```bash
cp ~/c-suite-agents/examples/CLAUDE.sample-studio.md ./CLAUDE.md
# Then customize for your business
```

### 3. (Optional) Permission settings

`.claude/settings.json.template` ships with a curated permission set tuned for solo-founder workflows (git, package managers, read-only shell utilities, official docs).

```bash
cp .claude/settings.json.template .claude/settings.json
```

Machine-specific permissions belong in `settings.local.json` (already in `.gitignore`).

### 4. Invoke agents

Use the `/agents` command or natural language inside Claude Code:

```
@cfo Forecast next month's cash flow
@cto Review my existing DB schema
@clo Highlight risks in this service agreement
```

## 🛠️ Customization

Each agent at `.claude/agents/*.md` is a Markdown file with YAML frontmatter:

```markdown
---
name: cfo
description: When to consult on financial analysis, runway, and tax strategy
tools: Read, Write, Edit
---

You are the CFO of {{COMPANY_NAME}}, advising on financial decisions.
...
```

Rewrite `description` / role / criteria to fit your business. Delete agents you don't need. Add new ones.

## 💡 Design Philosophy

This template is built for **solo founders, one-person LLCs, and freelancers** — not teams:

- **Minimize fixed costs** — no agent ever suggests "let's hire someone"
- **Cash flow first** — current liquidity beats projected revenue
- **Get it in writing** — legal/contract advice always pushes toward written agreements
- **Defer to professionals** — final legal/tax/accounting decisions explicitly defer to lawyers and CPAs

## 📜 License

MIT — free to fork, modify, and use commercially. PRs and improvement suggestions welcome (see [CONTRIBUTING.md](./CONTRIBUTING.md)).

## 🙋 Author

Maintained by **Kazushi Ikeda** ([OceansBase](https://oceans-base.com)) — a solo IT consulting practice in Shimane, Japan, doing contract development, IT consulting, and content production.

Hosted under [OceansCreative](https://oceans-creative.com), the company operated by the same founder for SaaS product development. These agents are extracted from a working setup used to run an actual one-person company.
