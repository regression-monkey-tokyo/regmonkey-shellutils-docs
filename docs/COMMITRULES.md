# コミットルール

- このプロジェクトは [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) の使用に従います
- 一貫したスタイルに基づいたcommit historyにより，変更の可読性の向上，changelog の自動生成の土台作りが可能になります

## コミットメッセージのフォーマット

```text
<type>(<scope>): <description>   ← single line, mandatory

[任意の本文]

[任意のフッター]
```

- ヘッダー は最初の行であり必須，かつ **1行** で表現
- スコープ は任意
- 空行でヘッダーと本文を，本文とフッターを区切る

### Example

```text
feat(parser): add support for nested config blocks

ネストされたテーブルへ再帰的に処理するようになり，深く
構造化された pyproject.toml ファイルが正しく読み込まれる．

Closes #42
```

## Type

`<type>` は変更の種類を表し，次のいずれかで表現する:

| Type       | 説明                                    |
| ---------- | --------------------------------------- |
| `feat`     | 新機能                                  |
| `fix`      | バグ修正                                |
| `docs`     | ドキュメントのみの変更                  |
| `style`    | フォーマットなどスタイルに関する変更    |
| `refactor` | バグ修正でも機能追加でもないコード変更  |
| `perf`     | パフォーマンスを改善するコード変更      |
| `test`     | テストの追加や既存テストの修正          |
| `build`    | ビルドシステムや外部依存の変更          |
| `ci`       | CI設定ファイルやスクリプトの変更        |
| `chore`    | `src` やテストファイルを変更しない変更  |
| `revert`   | 以前のコミットを取り消す変更            |

## Scope

- `<scope>` は任意フィールド
- コードベースのどの部分が影響を受けたかという追加の文脈を記述すために使用
- 簡潔な一言で表現
  - 例: `feat(glossary):`，`fix(quarto):`，`docs(commitrules):`
- 変更が全体に及ぶ場合はスコープを省略

## Description

- description は 1行 に収める．複数行に折り返さないこと
- ピリオドで終わらせないこと
- ヘッダーは簡潔に，50文字以内 を目安に．上限は 72 文字
- さらに説明が必要な場合は，description ではなく 本文 に書くこと

## Body

- 任意フィールド
- 何(What)を なぜ(Why)変更したかを説明する．どのように(How)は書かないこと．
- 行は 72文字 で折り返すこと
- 空行1つでヘッダーと区切ること

## Footer

- 任意フィールド
- issue 参照や破壊的変更などのメタデータに使用
- issue は `Closes #<id>`，`Fixes #<id>`，`Refs #<id>` で参照

### Breaking Changes

- 破壊的変更は，`type/scope` の後に `!` を付けるか，`BREAKING CHANGE:` フッターを記載することで示す（両方併用も可）

```
feat(api)!: drop support for Python 3.9

BREAKING CHANGE: サポートする最小の Python バージョンが 3.10 に変更
```
