
FROM ruby:3.1

ENV LANG C.UTF-8
ENV APP_ROOT /app
ENV RUBY_YJIT_ENABLE=1

RUN apt-get update -qq && \
  apt-get install -y build-essential nodejs redis \
  mariadb-client default-libmysqlclient-dev \
  unattended-upgrades \
  libjemalloc-dev libjemalloc2 

ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem update --system --no-document \
  && gem install bundler --no-document -v 2.4.21

RUN bundle config set path 'vendor/bundle'
RUN bundle config build.nokogiri --use-system-libraries
# RUN bundle install --jobs 4 --retry 3



