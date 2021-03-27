#!/bin/sh

echo "Running git clone ${SOURCE}"
git clone $SOURCE
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
ldd xmrig
echo "Compressing"
tar -czvf xmrig.tar.gz xmrig 
echo "Moving archive to build-output"
mv xmrig.tar.gz /home/docker/build-output/xmrig.tar.gz
echo "Done!"
