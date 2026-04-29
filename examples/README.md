# Examples

`CLAUDE.md.template` の記入例集です。状況に近いものをコピーして自社情報に書き換えてご利用ください。

## ファイル一覧

| ファイル | 想定読者 | 特徴 |
|---|---|---|
| [CLAUDE.sample-studio.md](./CLAUDE.sample-studio.md) | 一人合同会社（SaaS + 受託の二本柱） | プロダクト + 受託の両輪、PMF 探索期 |
| [CLAUDE.sole-proprietor.md](./CLAUDE.sole-proprietor.md) | 個人事業主（屋号運営・受託メイン） | 青色申告 65 万円控除活用、法人成り検討中 |
| [CLAUDE.early-stage-startup.md](./CLAUDE.early-stage-startup.md) | シード期ひとり株式会社（調達検討中） | β ユーザー獲得段階、投資家交渉あり |

## 使い方

```bash
# 状況に近い記入例をベースに自社の CLAUDE.md を作る場合
cp examples/CLAUDE.sole-proprietor.md /path/to/your/project/CLAUDE.md
# その後、自社情報に書き換える
```

実例を見ながら自社用に書き換えるほうが、`{{...}}` プレースホルダーをゼロから埋めるより速いケースが多いです。

## どの例から始めるべきか

| あなたが… | 推奨 |
|---|---|
| 屋号でフリーランス・個人事業主をしている | `CLAUDE.sole-proprietor.md` |
| 一人合同会社・一人株式会社で SaaS + 受託をやっている | `CLAUDE.sample-studio.md` |
| シード期で調達 / 投資家対応がある | `CLAUDE.early-stage-startup.md` |
| どれにも完全には当てはまらない | 一番近い例をコピー → 不要部分を削って構築 |

新しいパターンの記入例の追加 PR も歓迎です（[CONTRIBUTING.md](../CONTRIBUTING.md) 参照）。
