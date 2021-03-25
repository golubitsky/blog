[live](https://golubitsky.github.io/blog/)

## Development

Spin up the dev server; live reload is enabled:

```sh
docker-compose build
docker-compose up
```

Live at http://localhost:4000/blog/

Update gems:

```sh
docker-compose run --rm develop bundle update github-pages
```

## TODO

- [ ] Solution to serve images
  - [ ] Prototype via Google Drive?
  - [ ] Prototype via S3 bucket or similar.
- [ ] Books main page or similar.
- [ ] Listening main page or similar.
- [ ] Add comments somehow. Desirable without ads.
  - Could roll my own using GCP cloud functions + NoSQL—[it's been done before](https://www.smashingmagazine.com/2020/08/comment-system-firebase/).
    - Also see [Ned's](https://github.com/ruggeri/ruggeri.github.io) that uses AWS.
    - [terraform + lambda + api gateway](https://learn.hashicorp.com/tutorials/terraform/lambda-api-gateway?in=terraform/aws)
  - Or [$60/year](https://fastcomments.com/traffic-pricing).
- [ ] Convert some old facebook posts into blog entries.
- [ ] Convert some old wordpress\* posts into blog entries (maybe in gmail, or maybe even that account is still somewhere).
- [ ] Musical notation.

  - [LilyPond](http://lilypond.org/download.html). [Jekyll LilyPond plugin](https://github.com/mikeknep/jekyll-lilypond-converter).
  - [GitHub Pages cannot build sites using unsupported plugins](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/about-github-pages-and-jekyll#plugins). Therefore, to use other plugins need CI/CD solution. Perhaps this [GitHub action](https://github.com/helaili/jekyll-action).
