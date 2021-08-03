FROM docker.io/library/ruby:2.7
# GitHub Pages doesn't work with Ruby 3.

RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/

# mount this in
ENV BUNDLE_PATH /local_bundle

COPY . /app/