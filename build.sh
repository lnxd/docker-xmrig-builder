#!/bin/bash

mkdir -p $PWD/build-output/fee $PWD/build-output/no-fee
docker stop xmrig-builder
docker rm xmrig-builder
docker build . -t xmrig-builder
docker run -e TZ="Australia/Melbourne" -v $PWD/build-output:/home/docker/build-output -e SOURCE="--depth 1 https://github.com/lnxd/xmrig.git" --name="xmrig-builder" xmrig-builder
mv $PWD/build-output/xmrig $PWD/build-output/fee/
docker rm xmrig-builder
docker run -e TZ="Australia/Melbourne" -v $PWD/build-output:/home/docker/build-output -e SOURCE="--depth 1 --branch no-fee https://github.com/lnxd/xmrig.git" --name="xmrig-builder" xmrig-builder
mv $PWD/build-output/xmrig $PWD/build-output/no-fee/
