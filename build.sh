#!/bin/bash

rm -rf $PWD/build-output
docker stop xmrig-builder
docker rm xmrig-builder
docker build . -t xmrig-builder
docker run -e TZ="Australia/Melbourne" -v $PWD/build-output:/home/docker/build-output -e SOURCE="--depth 1 https://github.com/lnxd/xmrig.git" --name="xmrig-builder" xmrig-builder
mv $PWD/build-output/xmrig.tar.gz $PWD/build-output/xmrig-fee.tar.gz

docker rm xmrig-builder
docker run -e TZ="Australia/Melbourne" -v $PWD/build-output:/home/docker/build-output -e SOURCE="--depth 1 --branch no-fee https://github.com/lnxd/xmrig.git" --name="xmrig-builder" xmrig-builder
mv $PWD/build-output/xmrig.tar.gz $PWD/build-output/xmrig-no-fee.tar.gz

docker rm xmrig-builder
docker run -e TZ="Australia/Melbourne" -v $PWD/build-output:/home/docker/build-output -e SOURCE="--depth 1 --branch lnxd-fee https://github.com/lnxd/xmrig.git" --name="xmrig-builder" xmrig-builder
mv $PWD/build-output/xmrig.tar.gz $PWD/build-output/xmrig-lnxd-fee.tar.gz
