#!/bin/sh

echo "Running git clone ${SOURCE}"
git clone $SOURCE
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
ldd xmrig
cp xmrig /home/docker/build-output/xmrig
