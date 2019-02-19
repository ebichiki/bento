# README

## 概要

学童保育のお弁当注文をイメージしたWebアプリケーションを作成する
デプロイ先：https://cryptic-refuge-56253.herokuapp.com/

- Ruby on Railsにて開発。
- RSpecによるテスト。
- Deviseを使用したユーザー認証。
- has_many throughを使用して多対多のリレーションを実装。
  - ユーザー <-1対多-> 注文 <-多対1-> 商品 により多対多を表現。
- DB(RDB)に対するCRU操作。

## 環境、フレームワーク
- Ruby 2.5
- Ruby on Rails 5.2
- PostgreSQL
- heroku
- Bootstrap v4
- devise

## 使い方（ローカル環境）
- git clone XXXXXX.git
- cd bento/
- `.envrc`ファイルを用意し、以下を記述。
~~~
export GOOGLE_CLIENT_ID=xxxxxxxx
export GOOGLE_CLIENT_SECRET=xxxxxxxx
~~~
- rails db:migrate
- rails s

## 作った Web アプリケーションのアピールポイント
- 実際のお弁当注文の申込用紙を意識して、1か月分をまとめて更新できるようにした。
- Googleアカウントでログイン可能にした。
 
## 苦労した点
- DB(RDB)に対するCRU操作を一つの画面で行ったため、ページ遷移やパラメータをどう設定したらよいかわからず悩んだ。

## 工夫した点
- Bootstrapによるレスポンシブデザインを適用し、スマートフォンからの利用も可能にした。
- マスタデータが存在していない月にアクセスした時はその都度、月のデータを一括で作成するようにした。

## その他感想など

