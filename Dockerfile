FROM ruby:2.5

RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/

# mount this in
ENV BUNDLE_PATH /local_bundle

COPY . /app/

ENTRYPOINT [ "./entrypoint.sh" ]