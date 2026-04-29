# Security Policy

## Scope

このリポジトリは Claude Code 用のエージェント定義（Markdown と最小限の JSON）を含むテンプレート集です。実行可能コードは含みません。

そのため、典型的な「脆弱性」よりは、以下のような問題が報告対象になります：

- エージェント定義に含まれる**プロンプトインジェクション可能性**（悪意あるユーザー入力で意図と異なる挙動を誘発する設計）
- `settings.json.template` のデフォルト許可セットに**過度に広い権限**が含まれていないか
- 例ファイル（`examples/*`）に**実在の機微情報**が混入していないか
- ドキュメント上の手順に従うとユーザーが**意図せず資格情報を公開**してしまう導線

## 報告方法

**公開 Issue には書かず、以下のいずれかでご連絡ください**：

- Email: `system@oceans-creative.com` 宛に件名「[Security] claude-code-c-suite-agents」
- GitHub の [Private Vulnerability Reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability)

報告に含めていただきたい情報：
1. 影響内容（何が起こりうるか）
2. 再現手順 or 該当箇所のファイル / 行番号
3. 想定される影響範囲（このテンプレを使っているユーザーへの影響）
4. もし提案がある場合は修正案

## 対応方針

- 受領後 7 日以内に初動連絡をお返しします
- 重大度に応じて非公開で修正パッチを準備し、リリース時に公表します
- 報告者のクレジット表記の希望（実名 / ハンドル / 匿名）を確認します

## 利用者向けの注意

このテンプレを **public リポジトリ** で運用する場合：

- `CLAUDE.md`（実体）は `.gitignore` 済みです。**必ず private リポジトリで運用するか、`.gitignore` を維持してください**
- `settings.local.json` も同様に `.gitignore` 対象です
- `examples/` 内のサンプルは**全て架空の会社情報**です。自社情報に書き換える際、置換漏れがないか push 前に必ず確認してください
- 進行中の紛争・顧客名・契約金額など機微情報は `CLAUDE.md` には書かず、別ファイル（例：`CLAUDE.private.md`）に切り出して `.gitignore` に追加してください

---

# Security Policy (English)

## Scope

This repository is a template collection of Claude Code agent definitions (Markdown plus minimal JSON). It contains no executable code.

Reportable issues are therefore broader than classical vulnerabilities:

- **Prompt injection vectors** in agent definitions
- **Over-permissive defaults** in `settings.json.template`
- **Real sensitive data** accidentally embedded in `examples/*`
- **Documentation paths** that lead users to unintentionally leak credentials

## Reporting

**Do not file public Issues for security reports.** Use one of:

- Email `system@oceans-creative.com` with subject `[Security] claude-code-c-suite-agents`
- GitHub [Private Vulnerability Reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability)

Please include:
1. Impact description
2. Reproduction steps or affected file paths / line numbers
3. Estimated affected user population
4. Proposed fix (optional)

## Response

- Initial reply within 7 days
- Patches prepared privately and published with the release
- We will confirm credit preference (real name / handle / anonymous)

## User-side hardening

When using this template in a **public repository**:

- `CLAUDE.md` (filled instance) is in `.gitignore` — keep it that way, or run in a private repo
- `settings.local.json` is similarly excluded
- All `examples/*` content uses **fictional company data**. Double-check before pushing your customized version
- Keep ongoing-dispute / customer-name / contract-amount details out of `CLAUDE.md`; put them in `CLAUDE.private.md` and add it to `.gitignore`
