---
tags: ruby docker development workflow
title: Dockerize Ruby Apps Without A System Ruby or Multiple Bundle Installs
---

I recently started work on a Ruby on Rails microservices project. Docker containers are a great way to ship code. This makes it sensible to develop in a Docker container as well -- the development environment becomes (1) as close as possible to the production environment and (2) reproducible between team members. We spend less time wondering "but it worked on my machine..." Great!

## Solution!

The solution I have found:

- `bundle install` all dependencies into a Docker volume.
- Install dependencies on `run`, rather than on `build`!
- Install dependencies only if necessary.

So far, this seems to provide an excellent workflow! Using `docker-compose`, the workflow becomes simply:

```sh
docker-compose build
docker-compose up # run tests continuously (or develop however you prefer)
```

The `docker-compose up` command will initiate our standard development workflow, first having ensured that all dependencies are satisfied.  
Read on to find out how!

### Application

Let's set up a basic `Gemfile`

```ruby
source 'https://rubygems.org'

gem 'rspec'
```

and a `hello_world.rb` application:

```ruby
def main
  puts 'Hello world!'
end

main if $PROGRAM_NAME == __FILE__
```

### Dockerfile

Now we'll package the app in a Docker image.

```Dockerfile
FROM ruby:2.5

WORKDIR /app
COPY . /app/

# Bundler will install gems to BUNDLE_PATH
ENV BUNDLE_PATH /local_bundle

ENTRYPOINT [ "./entrypoint.sh" ]
```

Note that we don't `bundle install` in the `Dockerfile`, which means that the image will not be shippable. But we're not trying to ship this image -- we just want to develop a sensible local workflow that can be shared amongst multiple developers.

### entrypoint.sh

This entrypoint is used to ensure we only `bundle install` if dependencies cannot be satisfied. If dependencies _can't_ be satisfied, Bundler will install those dependencies -- whether all of them (for a new app) or just the newest additions to the Gemfile (for an existing app).

```sh
#!/bin/bash

bundle check || bundle install

exec "$@"
```

Otherwise, we just `exec`ute the entire Docker `command` -- after ensuring dependencies are satisfied!

### docker-compose.yml

Finally, we add a `docker-compose.yml` that defines a Docker volume that is mounted at the `BUNDLE_PATH` specified in the Dockerfile.

```yaml
version: "3"
services:
  develop:
    build: .
    volumes:
      - .:/app
      - local_bundle:/local_bundle
    command: ruby hello_world.rb

volumes:
  local_bundle:
```

that allows us to use the two commands above to develop!

## Adding a new gem

To add a new gem, we can add it to the `Gemfile` and seamlessly keep developing by issuing another `docker-compose up` -- Bundler will note that it can no longer satisfy dependencies, and install the missing gems before running our dev process!

## An additional optimization!

One thing I usually optimize for is to write code that doesn't require looking in multiple places to understand what's happening -- if it can be avoided. And so if we look at the `Dockerfile` -- it no longer really does much of anything! We copy our source code in, but for no reason -- we're going to by design mount it in during the `docker-compose` command. And then all we do is set an environment variable.

We can do all this in a single `docker-compose` file -- no need for a development `Dockerfile`! I'll have to experiment more with this. It definitely works in the Hello World case.

```yaml
version: "3"
services:
  develop:
    image: ruby:2.5
    volumes:
      - .:/app
      - local_bundle:/local_bundle
    environment:
      BUNDLE_PATH: /local_bundle
    working_dir: /app
    entrypoint: ./entrypoint.sh
    command: ruby hello_world.rb

volumes:
  local_bundle:
```

## Nuke the bundle

Sometimes things might still get out of sync. In this case, it might be useful to just destroy the stateful bundle and start from scratch.

```sh
docker volume ls
docker volume rm <the appropriate volume>
```

A somewhat nuclear option (use at your own risk!) would be to remove all Docker containers, and then remove all volumes not used by any containers.

```sh
docker rm $(docker ps -a -q) -f
docker volume prune -f
```
