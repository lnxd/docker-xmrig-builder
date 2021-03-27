#!/bin/sh

git clone $SOURCE
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
ls