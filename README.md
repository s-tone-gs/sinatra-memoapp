# sinatra-memoapp
## アプリの概要
メモの作成、表示、編集、削除が簡単に簡単に行えるアプリです
## 動作環境
以下の環境で動作することを確認済みです
- OS：Debian 12(bookworm)
- 使用言語：ruby 3.4.5
- パッケージ管理：bundler 2.6.9
## ローカルで動かす
1. githubからソースコードをクローンします  
`git clone -b memoapp https://github.com/s-tone-gs/sinatra-memoapp.git`
2. gemをインストール  
`bundle install`
3. アプリを起動させる  
`bundle exec ruby app.rb`  
http://localhost:4567 にてアクセスできます。
