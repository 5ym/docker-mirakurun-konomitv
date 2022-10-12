#!/bin/sh

git clone https://github.com/5ym/docker-mirakurun-konomitv.git
cd docker-mirakurun-konomitv
cp docker-compose.example.yml docker-compose.yml
docker compose run --rm -e SETUP=true mirakurun
touch konomitv/config.yaml
docker compose run --rm -v $PWD/setup.py:/code/setup.py --entrypoint sh konomitv -c 'thirdparty/Python/bin/pip install pyyaml && thirdparty/Python/bin/python ../setup.py'