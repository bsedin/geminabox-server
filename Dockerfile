FROM ruby:2.3-alpine
MAINTAINER kr3ssh@gmail.com

RUN \
  apk add --no-cache \
    build-base \
    linux-headers \
    git \
    bash

RUN mkdir -p /geminabox/config /data

WORKDIR /geminabox
ADD .env Gemfile Gemfile.lock config.ru Procfile /geminabox/
ADD config/unicorn.rb /geminabox/config/

RUN bundle install

ADD docker/run.sh /
RUN chmod +x /run.sh

EXPOSE 8080

VOLUME ["/data"]

CMD ["/run.sh"]
