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
