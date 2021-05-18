# fbjs-container

## Introduction

This is dockerized https://github.com/Makepad-fr/fbjs so I can run it easily on different test machines.

## Usage

Prepare config file:

```bash
copy facebook-group-posts-scraper.sample.json facebook-group-posts-scraper.json
vi facebook-group-posts-scraper.json
```

Build docker image (⚠️ make sure Docker client is running):

```bash
bash make.sh
```

Run it:

``` bash
bash run.sh
```

You'll be logged in as root with `fgps` command at your disposal.
