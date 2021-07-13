FROM docker.io/library/ruby:slim

RUN apt-get update && apt-get install make gcc build-essential -y

RUN mkdir /app
WORKDIR /app
COPY Gemfile* ./

RUN bundle install

COPY . .

CMD [ "bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0" ]