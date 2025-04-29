# README
攻略EVERY

## 📝 プロジェクト概要
個人ポートフォリオサイトの開発プロジェクトです。  
Ruby on Rails を用いてWebアプリケーションを構築し、AWS EC2上にデプロイしています。

---
## サービス概要

このアプリはユーザー同士が同じゲームの攻略情報を出し合ってそれについてのコメントなどを入力することで
その攻略を深く知ることができるアプリケーションがあったらいいなと思い作成しました。

## 🚀 使用している主な技術
- **バックエンド**: Ruby 3.1.2
- **フレームワーク**: Ruby on Rails 6.1.7.8
- **フロントエンド**: HTML, SCSS, JavaScript (Webpacker)
- **データベース**: MySQL / MariaDB
- **インフラ**: AWS EC2 (Amazon Linux 2023), Nginx, Puma
- **パッケージ管理**: Bundler, Yarn

---

## 🔑 必要な環境変数・設定
`.env` または環境設定で以下を設定します。

| 変数名              | 説明                     |
|---------------------|---------------------------|
| `DATABASE_NAME`      | 使用するデータベース名      |
| `DATABASE_USER`      | データベース接続ユーザー名   |
| `DATABASE_PASSWORD`  | データベース接続パスワード   |
| `SECRET_KEY_BASE`    | Railsアプリケーション用秘密鍵 |

---

## 🛠️ 開発環境の構築方法

```bash
# 依存パッケージのインストール
bundle install
yarn install

# データベース作成・マイグレーション
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:migrate
RAILS_ENV=production rails db:seed

# アセットプリコンパイル
RAILS_ENV=production bundle exec rails assets:precompile

