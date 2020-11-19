ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

ARG NODE_MAJOR
ARG BUNDLER_VERSION
ARG YARN_VERSION

# NodeとYarnをソースリストに追加した後依存関係をインストール
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    yarn=$YARN_VERSION-1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

ENV LANG=C.UTF-8

# ユーザーの作成(sudo権限付き)
ARG UID=1000
ARG USER_NAME=fp-user
ARG PASSWORD=password
RUN useradd -m --uid ${UID} --groups sudo ${USER_NAME} && \
    echo ${USER_NAME}:${PASSWORD} | chpasswd

# railsプロジェクトの準備
ARG WORKDIR=/app
RUN mkdir ${WORKDIR}
WORKDIR ${WORKDIR}
COPY Gemfile ${WORKDIR}/Gemfile
COPY Gemfile.lock ${WORKDIR}/Gemfile.lock
RUN bundle install
COPY . ${WORKDIR}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails","server","-b","0.0.0.0"]
