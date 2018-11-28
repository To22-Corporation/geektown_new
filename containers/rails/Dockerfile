FROM ruby:2.5.1
LABEL title="rails web server"
LABEL version="1.0"

# リポジトリを更新、依存モジュールをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       default-libmysqlclient-dev \
                       nodejs \
                       graphviz

# ルート直下にコンテナ内作業ディレクトリ作成
RUN mkdir /app
WORKDIR /app

# ホストにGemfileと.lockをコピー
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# gemをインストール
RUN bundle install

# ホストのアプリケーションディレクトリをコピー
ADD . /app

RUN mkdir -p tmp/sockets
