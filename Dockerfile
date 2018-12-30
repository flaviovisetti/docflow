FROM ruby:2.5.3-alpine

RUN set -x \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache --virtual build-dependencies \
    build-base libc-dev linux-headers tzdata vim \
    libressl postgresql-dev nodejs imagemagick \
    && apk add --no-cache \
    libxml2-dev \
    libxslt-dev \
    && gem install nokogiri \
    -- --use-system-libraries \
    --with-xml2-config=/usr/bin/xml2-config \
    --with-xslt-config=/usr/bin/xslt-config

WORKDIR /tmp
COPY Gemf* ./
RUN bundle install

WORKDIR /var/www/docflow
COPY . ./

EXPOSE 3000

CMD ["bundle exec puma -C config/puma.rb"]
