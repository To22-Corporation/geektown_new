## Dockerについて
Dockerは仮想コンテナを立てることができるツールです。
以下の記事がわかりやすいかと思います。
[わかりやすい記事](https://qiita.com/miyasakura_/items/87ccb6d4a52d4a00a999)

## 環境構築方法

### 1. Dockerの準備

環境構築には[Docker for Mac](https://www.docker.com/products/docker-desktop)が必要です。
Windowsの人は[Docker for Windows](https://www.docker.com/products/docker-desktop)からインストールしてください。

### 2. リポジトリをクローンする

```
$ git clone https://github.com/To22-Corporation/geektown_new.git
$ cd geektown_new
```

### 3. envファイルの用意

```
$ cp .env.example .env
```


### 4. 開発環境の起動

```
# 以下geektownディレクトリ下で
# 初回のみmysqlのgrantを設定
docker exec -it geektown_db mysql -u root -p -e"$(cat db/grant_user.sql)"
# パスワードはroot_password

# 初回のみdb作成
docker-compose run --rm app rails db:create

# imageを作成
docker-compose build

# dockerを立ち上げる
docker-compose up -d

# コンテナにアクセスする
docker-compose run --rm app bash

# db作成
rails db:create
# マイグレーション実行
rails db:migrate
# シード実行
rails db:seed_fu

exit
```

あとは[http://localhost](http://localhost)にアクセスしてアプリケーションが起動していれば完了です。

### 5. 開発環境の終了方法

```
$ docker-compose stop
```

## その他のコマンド

### Docker

```

# コンテナの起動
docker-compose up
# コンテナの停止
docker-compose stop
# 新しくappコンテナを起動してアクセスし、bashを起動する。この時dbコンテナと通信することでmysqlとのやりとりもできる。
docker-compose run --rm app bash
# すでに起動しているappコンテナにアクセスし、bashを起動する。この時dbコンテナと通信することでmysqlとのやりとりもできる。
docker exec -it geektown_app_1 /bin/bash
```

### erd
railsがマイグレーションを実行する度にスキーマからER図をpdfで出力してくれます。
以下のコマンドで確認できます。
```
open erd.pdf
```


## Githubの運用について

### 開発手順
1. 機能追加、バグフィックスのためのissueを立てる
    1. 以下を記入
        1. 目的
        1. 外部仕様(満たすべき機能)
    1. ラベルを設定(develop, bugfix, enhancement, invalid)
1. ブランチを切る(masterでは作業をしない)
    1. ブランチ名は{user名}/{issue番号}_{実装機能} :ex) oky123/5_add_user_registration
1. プルリクを立てる(masterと差分ができた段階で)
    1. タイトルに[WIP] とつける(Work In Progressの意味)
    1. 以下を記入
        1. 関連issue番号 :ex) #2 みたいな感じで入力するとgithubが自動で関連づけしてくれます
        1. 実装すべきこと(TODOみたいな感じトップダウンに考えると実装が捗ります)
    1. assignee に自分(開発者)を選択
1. 設計段階や実装中に相談やレビューして欲しい際はプルリクのreviewerにoky123をアサインしてレビューお願いすると良いです
1. 実装完了したらレビューしてもらい、OKが出たらマージする

以下各項目の詳細

## issue
実装すべきタスクを整理するために使います。
一つのissueにつき一つのプルリクという決まりにしましょう。
プルリクは一つの機能ごとですが, レビューする負担を減らすためなるべく小さい粒度で立てるようにしましょう。

## プルリク
以下の目的でプルリクを使います。

- 他の開発者とコードの共有, 確認
- 自分の開発の進捗の整理

困った時には気軽にレビューや相談を求めましょう！

## レビュー
masterは常にデプロイできる状態(のはず)です。
注意しててもバグは起こってしまうものなのですがバグの起こる確率を最小限に抑える、
またバグが未来に起きそうなコーディングを防ぐためにレビューをします。
他の人からOKが出たらマージしましょう。

LGTMという言葉がマージのGoサインということに決めましょう！
LGTMが出たら、緊急時以外実装した人がプルリクエストをマージします。

## 参考記事

https://qiita.com/tbpgr/items/4ff76ef35c4ff0ec8314

https://qiita.com/luccafort/items/c91e817e78f1167221cc

https://qiita.com/maeda_t/items/4344bdeabcc6a18a34cc
