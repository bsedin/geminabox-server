FROM ruby:2.3-alpine
MAINTAINER kr3ssh@gmail.com

ADD .env Gemfile Gemfile.lock config.ru Procfile /geminabox/
ADD config/unicorn.rb /geminabox/config/
ADD docker/run.sh /

WORKDIR /geminabox

RUN \
  apk add --no-cache \
    build-base \
    linux-headers \
    git \
    bash \
  && mkdir -p /geminabox/config /data \
  && bundle install \
  && apk del \
    build-base \
    linux-headers \
    gcc \
    git \
  && chmod +x /run.sh

EXPOSE 8080

VOLUME ["/data"]

CMD ["/run.sh"]
