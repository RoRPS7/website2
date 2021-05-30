FROM ruby:2.7.3-alpine

ENV APP_PATH /var/app
ENV BUNDLE_VERSION 2.2.16
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000

COPY ./dev-docker-entrypoint.sh /usr/local/bin/dev-entrypoint.sh
RUN chmod +x /usr/local/bin/dev-entrypoint.sh

#setup dependencies for rails
RUN apk -U add --no-cache \
