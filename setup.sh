#!/bin/sh

git clone https://github.com/5ym/docker-mirakurun-konomitv.git
cd docker-mirakurun-konomitv
cp docker-compose.example.yml docker-compose.yml
cp konomitv/config.example.yaml konomitv/config.yaml
docker compose run --rm -e SETUP=true mirakurun
