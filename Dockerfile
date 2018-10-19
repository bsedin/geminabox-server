FROM ruby:2.5-alpine
LABEL maintainer="Sergey Besedin <kr3ssh@gmail.com>"

ENV WORKDIR /geminabox

RUN mkdir -p $WORKDIR /data

WORKDIR $WORKDIR

ADD . $WORKDIR

RUN \
  apk add --no-cache build-base && \
  bundle install --deployment && \
  apk del build-base

EXPOSE 8080

VOLUME ["/data"]

CMD ["sh -c 'bundle exec puma -C config/puma.rb'"]
