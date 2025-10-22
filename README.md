# sinatra-memoapp
## アプリの概要
メモの作成、表示、編集、削除が簡単に簡単に行えるアプリです
## 動作環境
以下の環境で動作することを確認済みです
- OS：Debian 12(bookworm)
- 使用言語：ruby 3.4.5
- パッケージ管理：bundler 2.6.9
- DB:PostgreSQL 15.13
## 注意
このアプリではデータベースのアクセスにruby-pgを使用しています。動作にはPostgreSQL 10以上が必要になります。 
参考：https://github.com/ged/ruby-pg?tab=readme-ov-file
## ローカルで動かす
1. githubからソースコードをクローンします
`git clone -b memoapp https://github.com/s-tone-gs/sinatra-memoapp.git`
2. gemをインストール
`bundle install`
1. データベースの準備を行います
    1. PostgreSQLをインストールしてください
    2. PostgreSQLにログインし、以下を実行してください 
    `CREATE DATABASE memoapp;`
    3. example.envファイルをコピーし、.envファイルを作成してください
    4. .envファイルにアクセスするデータベース名、ユーザー名、パスワードを記述してください
    4. `ruby create_table.rb`を実行してください
3. アプリを起動させる
`bundle exec ruby app.rb`
http://localhost:4567 にてアクセスできます。
