FROM ruby:2.3.1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get update && apt-get install -y build-essential \
    postgresql-client \
    vim \
    nodejs

WORKDIR /tmp/
COPY Gem* ./
RUN bundle install

WORKDIR /var/www/docflow
COPY . .

EXPOSE 3000

CMD ['rails', 's', '-b 0.0.0.0']

