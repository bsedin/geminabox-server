FROM ubuntu:14.04
MAINTAINER kr3ssh@gmail.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C3173AA6 \
 && echo 'deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main' >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y ca-certificates ruby2.2 ruby2.2-dev make \
 && gem install --no-document bundler

RUN mkdir -p /geminabox/config /data

WORKDIR /geminabox
ADD .env Gemfile Gemfile.lock config.ru Procfile /geminabox/
ADD config/unicorn.rb /geminabox/config/

RUN bundle install

RUN apt-get purge -y --auto-remove gcc make cpp libc6-dev \
  ruby2.2-dev manpages-dev libgmp-dev

ADD docker/run.sh /
RUN chmod +x /run.sh

EXPOSE 8080

VOLUME ["/data"]

CMD ["/run.sh"]
