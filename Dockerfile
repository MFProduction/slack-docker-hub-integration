FROM ruby:alpine

ENV APP_NAME app
ENV APP_PATH /${APP_NAME}
WORKDIR $APP_PATH

RUN apk update && \
    apk upgrade && \
    apk add --no-cache make g++ && \
    rm -rf /var/cache/apk/*

ADD . /app
RUN gem install bundler && \
    bundle install

CMD rackup config.ru
EXPOSE 9292
