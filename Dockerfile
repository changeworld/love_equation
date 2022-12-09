ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

ARG NODE_MAJOR_VERSION
RUN set -x \
  && curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev libxslt-dev libxml2-dev \
    nodejs yarn \
    curl vim sudo cron \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/cache/yum/*

ARG APP_HOME
ARG BUNDLE_JOBS

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
ENV BUNDLER_VERSION 2.3.12
RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION \
    && bundle install -j 4
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]