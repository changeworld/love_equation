# ARG RUBY_VERSION
# FROM ruby:$RUBY_VERSION-slim
FROM ruby:3.2.2-slim

RUN apt-get update -qq\
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends\
    build-essential\
    gnupg2\
    curl\
    less\
    git\
  && apt-get clean\
  && rm -rf /var/cache/apt/archives/*\
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
  && truncate -s 0 /var/log/*log

ARG NODE_MAJOR_VERSION
ARG YARN_VERSION
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash -
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends\
    nodejs\
    && apt-get clean\
    && rm -rf /var/cache/apt/archives/*\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
    && truncate -s 0 /var/log/*log
RUN npm install -g yarn@$YARN_VERSION

RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends\
    && apt-get clean\
    && rm -rf /var/cache/apt/archives/*\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
    && truncate -s 0 /var/log/*log

ARG APP_HOME
ARG BUNDLE_JOBS

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
ENV BUNDLER_VERSION 2.4.20
RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION \
    && bundle install -j 4
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]