# Changelog

このプロジェクトの注目すべき変更を記録します。
書式は [Keep a Changelog](https://keepachangelog.com/ja/1.1.0/) に準拠し、バージョニングは [Semantic Versioning](https://semver.org/lang/ja/) に従います。

## [1.0.3] - 2026-04-29

### Added
- `CODE_OF_CONDUCT.md`（Contributor Covenant 2.1 ベース、JP/EN）
- `.github/ISSUE_TEMPLATE/bug_report.yml` / `feature_request.yml` / `config.yml`（GitHub フォーム形式の Issue テンプレ、JP/EN）
- `.github/PULL_REQUEST_TEMPLATE.md`（PR チェックリスト、JP/EN）
- `.github/FUNDING.yml`（OceansBase へのカスタム sponsor リンク）
- `.github/workflows/lint.yml`（agent-lint / markdownlint / lychee link checker の 3 ジョブ CI）
- `scripts/lint-agents.sh`（フロントマター・名前一致・許可ツール・必須セクションの自動検証）
- `.markdownlint-cli2.jsonc`（バイリンガル H1 等を許容するルール調整）
- `lychee.toml`（バッジ URL 等の除外設定）
- README に 4 種のバッジ追加（License / Release / Lint status / Stars）
- `examples/CLAUDE.sole-proprietor.md`（個人事業主版の記入例）
- `examples/CLAUDE.early-stage-startup.md`（シード期ひとり株式会社版の記入例）
- `examples/README.md` を一覧表 + 使い分けガイドに拡充

### Fixed
- 日本語 README から `CONTRIBUTING.md` へのリンクが欠けていた問題を修正
- README 末尾で `CODE_OF_CONDUCT.md` を案内（日英両方）

## [1.0.2] - 2026-04-29

### Fixed
- `competitor-analyst` / `grant-researcher` / `cmo` に Web アクセス権限が無く、本来の役割（Web リサーチ）を果たせなかった問題を修正（`WebFetch` / `WebSearch` を追加）
- `contract-drafter` の役割定義冒頭が `{{COMPANY_NAME}}` を参照しておらず、経営コンテキストを継承しない問題を修正
- `grant-researcher` の役割定義冒頭の文体を他エージェントと統一
- 日本語クイックスタートに含まれていたパス矛盾を修正（`cd` 後に `examples/` を相対参照していた問題）

### Added
- 全 13 エージェントに「呼び出し例」セクションを追加（具体的なプロンプト 3 つずつ）
- `clo` / `cso` / `ciso` / `cto` / `code-reviewer` / `content-writer` / `contract-drafter` に `WebFetch` / `WebSearch` を追加（リサーチ性能向上）
- 英語 README を日本語版とほぼ同等の情報量に拡充（エージェント一覧表・カスタマイズ章・設計思想の 4 項目を追加）
- `CHANGELOG.md`（本ファイル）
- `CONTRIBUTING.md`（貢献ガイド）
- `SECURITY.md`（脆弱性報告ポリシー）

## [1.0.1] - 2026-04-29

### Added
- `examples/CLAUDE.sample-studio.md`：架空の一人合同会社「サンプルスタジオ」で `CLAUDE.md.template` をすべて埋めた記入例
- `examples/README.md`：examples ディレクトリのインデックス
- `.claude/settings.json.template` に、ひとり経営者の Claude Code 利用を想定した安全めなデフォルト許可セット（git・各種パッケージマネージャ・read-only シェル・公式ドキュメント参照）を追加
- README（日英）クイックスタートに上記 2 点を反映

### Fixed
- `CLAUDE.md.template` 内の `examples/` 参照が、対応するディレクトリの存在しないリンク切れ状態だった問題を解消

## [1.0.0] - 2026-04-29

### Added
- 13 個のエージェント定義（CFO / CTO / CLO / CMO / CPO / CRO / CSO / CISO / code-reviewer / competitor-analyst / content-writer / contract-drafter / grant-researcher）
- 日本語・英語のバイリンガル README
- `CLAUDE.md.template`（経営コンテキスト記入用テンプレート）
- `.claude/settings.json.template`（パーミッション設定の雛形）
- `.gitignore`（CLAUDE.md 実体・settings.local.json などを除外）
- MIT License

[1.0.3]: https://github.com/OceansCreative/claude-code-c-suite-agents/releases/tag/v1.0.3
[1.0.2]: https://github.com/OceansCreative/claude-code-c-suite-agents/releases/tag/v1.0.2
[1.0.1]: https://github.com/OceansCreative/claude-code-c-suite-agents/releases/tag/v1.0.1
[1.0.0]: https://github.com/OceansCreative/claude-code-c-suite-agents/releases/tag/v1.0.0
