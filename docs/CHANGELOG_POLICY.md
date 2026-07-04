# Changelog Policy

このドキュメントは，本リポジトリ（`regmonkey-shellutils-docs`）における
`CHANGELOG.md` の運用方針を定めます．

## 基本方針

- CHANGELOG は **サイトの「仕組み」に対する変更** を記録するためのもの
- 個々のドキュメント記事（ポスト）の追加・修正内容そのものは記録対象としない

## 記録する変更（対象）

以下のような，サイトのビルド・構造・見た目に関わる変更を記録

- **Quarto Extension の実装・変更**
  （例: `_extensions/card-grid/` などの Lua フィルタ，shortcode，
  カスタム extension の追加・修正・削除）
- **CSS / スタイルの変更**
  （例: `styles/custom.css` の追加・修正，テーマ調整，レイアウト変更）
- **サイト設定の変更**
  （例: `_quarto.yml` の構造変更 —— navbar / sidebar の構成方針，
  format 設定，grid 幅，filters の追加など）
- **ビルド・公開まわりの変更**
  （例: GitHub Pages のデプロイ設定，`output-dir`，CI ワークフロー）
- **サイト全体に共通する仕組みの導入・変更**
  （例: 全記事に効くテンプレート，共通コンポーネント，命名規約）

## 記録しない変更（対象外）

以下は CHANGELOG の対象外とする

- 個別記事（ポスト）の本文の追加・修正・誤字修正
  （例: `contents/agent/*.qmd`, `contents/utils/*.qmd` の内容更新）
- 新しいドキュメントページ 1 本の追加そのもの
  （※ ただし，それに伴う sidebar 構成方針や extension の変更は対象）
- 誤植・リンク切れの修正など，仕組みに影響しない軽微なコンテンツ修正


## フォーマット

CHANGELOG は [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) 形式，
バージョニングは [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
に従います．

変更カテゴリは Keep a Changelog に準拠します．

- `Added` — 新しい extension・スタイル・仕組みの追加
- `Changed` — 既存の extension・CSS・設定の挙動変更
- `Deprecated` — 今後削除予定の仕組み
- `Removed` — 削除した extension・スタイル・設定
- `Fixed` — 仕組み上の不具合修正（ビルドエラー，表示崩れ等）
- `Security` — セキュリティに関わる修正

### 記載例

```markdown
## [Unreleased]

### Added
- `_extensions/card-grid`: カードグリッド表示用の Lua フィルタを追加

### Changed
- `styles/custom.css`: サイドバー幅を 600px に調整し，コードブロックの
  折り返し挙動を変更
- `_quarto.yml`: format.html.grid の body-width を 900px に変更

### Fixed
- `styles/custom.css`: モバイル表示時のナビバー崩れを修正
```

## 更新タイミング

- 上記「記録する変更」を含む変更を行うたびに，`CHANGELOG.md` の`[Unreleased]` セクションに追記- リリース（タグ付け / 公開）時に`[Unreleased]` をバージョン番号付きセクションへ確定させる
