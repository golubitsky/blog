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

- [ ] Convert some old facebook posts into blog entries.
- [ ] Convert some old wordpress\* posts into blog entries (maybe in gmail, or maybe even that account is still somewhere).
- [ ] Musical notation.

  - [LilyPond](http://lilypond.org/download.html). [Jekyll LilyPond plugin](https://github.com/mikeknep/jekyll-lilypond-converter).
  - [GitHub Pages cannot build sites using unsupported plugins](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/about-github-pages-and-jekyll#plugins). Therefore, to use other plugins need CI/CD solution. Perhaps this [GitHub action](https://github.com/helaili/jekyll-action).
