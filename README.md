# Gruf Demo Rails Application

This is a demo Rails application that utilizes [gruf](https://github.com/bigcommerce/gruf) 2.15+, a gRPC Ruby framework.

This application is running Rails 6.1 in Ruby 3.1.

## Running with docker

- Build Image

```bash
docker-compose build --no-cache
```

- `bundle install`

```bash
docker-compose run --rm backend bundle config set path 'vendor/bundle'
docker-compose run --rm backend bundle install
```

Copy the `.env-example` file to `.env`, then set the database URL as `DATABASE_URL`. Next:

```bash
bundle exec rake db:create db:migrate
bundle exec rake db:seed
bundle exec gruf
```

## Running

Copy the `.env-example` file to `.env`, then set the database URL as `DATABASE_URL`. Next:

```bash
bundle install
bundle exec rake db:create db:migrate
bundle exec rake db:seed
bundle exec gruf
```

Alternatively, you can run `./script/e2e` to automatically run a server and issue a set of different types
of requests against it.

## Testing with a Client

Then in another console, you can run provided rake tasks to see it in action.

### Request/Response (Get a Product)

```bash
bundle exec rake test:get_product
```

### Server Streamer (Get a list of Products)

```bash
bundle exec rake test:get_products
```

### Client Streamer (Create a list of Products)

```bash
bundle exec rake test:create_products
```

### Bidirectional Streamer (Create a list of Products and get back responses immediately in stream)

```bash
bundle exec rake test:create_products_in_stream
```

## In Docker

This repository is also setup to run in a Docker container with docker-compose:

```bash
docker-compose up
```

Then, find the port docker exposed, and in another terminal, you can demo with:

```bash
GRPC_SERVER_URL=IP_OF_YOUR_DOCKER_INSTANCE:PORT_THAT_WAS_EXPOSED bundle exec rake test:get_product
```

## Link

- [Original Source](https://github.com/bigcommerce/gruf-demo)
-
