---
tags: microservices workflow docker
---

I've been working with a lot of microservices recently.

Each of these microservices:

- Is written in the same language using the same application framework.
- Requires many environment configuration settings to run.
- Is deployed using Docker.

Particularly due to the last point, to me it is a no-brainer that I will develop in Docker. That being said, some of my fellow developers insist on developing on bare metal; so they don't necessarily want to collectively support a Docker development environment in the source code. In fact, they'd be happier if they didn't see devenv-related Dockerfiles-and-what-not committed to the repos.

## Towards a solution

Well and so that got me thinking: do we even _want_ to commit the Docker environment to the source for each of these (many) repos?

In the past I've worked on a couple of services at most, and in that scenario this approach seemed to make sense -- the result was that we could pull down a repo, read its wonderful `README.md`, and, armed with a couple of Docker commands, be off to the races.

But in the context of a dozen microservices (or more) -- it seems less appealing to commit Docker-related files to each of these repos. That wouldn't be very DRY.

I've hit on what I've found thus far to be a rather sensible pattern. It's in a bit of a prototype stage, but thus far it's working. "Working" means: without polluting my host (almost: I still need to learn vim to get off the host completely), in a portable manner, I can quickly switch between isolated, reproducible development environments for each of the services.

This solution does not require committing anything Docker-related (or anything at all, in fact) to any of the many microservice repos we must support.

Critically, this solution consistently provides the most production-like development environment possible: there is a known base Docker image used to package each of these microservices for deployment in production (a fantastic system property!); and so, during development, every service runs in a separate Docker container that is built using this exact same base Docker image.

## Solution

I use a single "devenv" repo.

The repo contains a single parameterized point of entry that, for each of the microservices, supports running:

- the unit tests (95% of the time this is the only one I use),
- the application server (for integration testing),
- an arbitrary command inside the isolated service dev environment (e.g. to update dependencies).

## Current Implementation

The `Makefile` serves as an entrypoint into the docker-compose-based Docker environments.

### Makefile

```makefile
SERVER_CMD=<command to run the application server>
TESTS_CMD=<command to run the tests continuously>
DOCKER_COMPOSE_RUN=docker-compose -f docker-compose.production-like.yml -f docker-compose.overrides.yml run --rm

tests:
    ${DOCKER_COMPOSE_RUN} $$SERVICE $$TESTS_CMD

server:
    ${DOCKER_COMPOSE_RUN} --service-ports $$SERVICE ${SERVER_CMD}

run:
    ${DOCKER_COMPOSE_RUN} $$SERVICE $$CMD
```

Each of the microservices are written in the same framework, so we have the same `TESTS_CMD` and, for development purposes, the same `SERVER_CMD`. Note that `$$SERVICE` is the `Makefile` syntax to pass in environment variables. So for example we could run

```
SERVICE=awesome_service CMD="awesome-ize everything" make run
```

such that `awesome-ize everything` would be executed inside of the `awesome_service`'s Docker container.

### docker-compose files

Note that there are two docker-compose files:

- `docker-compose.production-like.yml` is in order to support bringing up any number of these services in a local almost-entirely-production-like environment (e.g. using the exact images that will be deployed etc.).
- `docker-compose.overrides.yml` is for all very devenv-specific setup, such as:
  - Volume-mounting source code for individual repos (to support the `docker-compose run` commands in the `Makefile`)
  - Custom `entrypoint` (to install all library dependencies, setup the db if it hasn't already been setup, wait for any required resources, etc.)

Having this separation makes it clear where all the devenv-related tweaks are.

### .env

[This file](https://docs.docker.com/compose/environment-variables/#the-env-file) contains the most shared and host-specific config. In this case we need:

```sh
# this BASE_IMAGE is used in the docker-compose.overrides.yml file
BASE_IMAGE=<production-like-docker-image>
AWESOME_SERVICE_DIR=/path/to/awesome/service/so/we/can/volume/mount/it/during/development
# other services' local directories
```

## The Glorious Future

The notion is that in some dreamy future (not _so_ far off..), another developer could download this "devenv" repo, setup the `.env` file, `git clone` all the repos per the `.env` file, and have a complete Docker dev environment setup for each of the repos our team supports. And we wouldn't have to commit a single `Dockerfile-dev` in the process.
