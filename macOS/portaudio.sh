#!/bin/bash

source ./common.sh

wget -nv http://www.portaudio.com/archives/pa_snapshot.tgz
gtar xaf pa_snapshot.tgz

cd portaudio/build

cmake .. \
 -DCMAKE_BUILD_TYPE=Release \
 -DPA_BUILD_SHARED=Off \
 -DCMAKE_OSX_DEPLOYMENT_TARGET=$MACOS_VERSION \
 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX/portaudio

make -j$NPROC
make install