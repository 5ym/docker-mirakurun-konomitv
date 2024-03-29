#!/bin/sh

git clone https://github.com/5ym/docker-mirakurun-konomitv.git
cd docker-mirakurun-konomitv
cp compose.example.yml compose.yml
docker compose run --rm -e SETUP=true mirakurun
touch konomitv/config.yaml
docker compose run --rm -v $PWD/setup.py:/code/setup.py --entrypoint sh konomitv -c '.venv/bin/python ../setup.py'
