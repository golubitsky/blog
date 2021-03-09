---
tags: programming docker
---

The Docker docs are a great place to start [learning about containerization](https://www.docker.com/resources/what-container) and to understand the basic concepts, particularly what an image is:

> A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings.

What does packaging the code with all its dependencies buy us? Reproducibility. The notion is that if the program works in a container on your host, it will work the same way on my host, as well as in production—in short, on any host, so long as it’s running in a container based on the same Docker image.

It also means that if you did the work to _make_ the program work in an image, I’ll be able to leverage that work, without having to do it myself. I’ll just pull the image you made and say thank you!

## Most important Docker commands

When using Docker, the two most important commands are `docker build` (to build Docker images) and `docker run` (to run a Docker container from an image that you’ve either built or pulled from the cloud). Here's the Docker [cheat sheet](https://www.docker.com/sites/default/files/d8/2019-09/docker-cheat-sheet.pdf).

To build images, you’ll want to [familiarize yourself with Dockerfiles](https://docs.docker.com/engine/reference/builder/).

## The next layer of abstraction

You’ll soon find out that `docker run` commands can get fairly complicated, especially for orchestrating multiple containers. [`docker-compose`](https://docs.docker.com/compose/) is a layer on top of `docker run`; it essentially allows us to express a `docker run` command in the form of [YAML](https://yaml.org/) config.

## Where to start

I would start with a recent tutorial for “How to Dockerize &lt;something&gt; or &lt;application framework you are most familiar with, to minimize friction for learning Docker itself&gt;”—there are many out there for all the popular frameworks like React/Rails/Flask etc.

## Demo!

For the quickest demo, [install Docker for Desktop on macOS/Windows](https://www.docker.com/get-started) (it’s a bit more complicated on [Linux](https://docs.docker.com/engine/install/)) and then run the following command:

```
docker run -it python python
```

This will

- (inherently) pull the latest available `python` image (the first “python”) [from DockerHub](https://hub.docker.com/_/python) and
- run the `python` command inside that image (the second “python”).

Enjoy developing in consistent environments!
