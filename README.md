## Docflow

### Requirements

- Ruby 2.3.1
- Bundler 1.16
- PostgreSQL 9.6
- Docker (Optional)

### Environment Variables

- POSTGRESQL_HOST
- POSTGRESQL_USERNAME
- POSTGRESQL_PASSWORD

### Setup

#### App

Install Dependencies

```
bundle install
```

Make database and load schema

```
cp config/database.yml.app.sample config/database.yml
bundle exec rails db:create db:schema:load
```

#### Setup by Docker

```
cp config/database.yml.docker.sample config/database.yml
docker-compose run build
```

### Test

Run tests

```
rspec spec
```

### Run application

#### App

```
bundle exec rails server -b 0.0.0.0 -p 3000
```

#### Docker

```
docker-compose up
```
