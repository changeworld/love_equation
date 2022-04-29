FROM ruby:3.0.4

RUN apt-get update && \
    rm -rf /var/lib/apt/lists/*

ARG APP_HOME
ARG BUNDLE_JOBS=4

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]