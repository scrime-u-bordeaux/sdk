#!/bin/bash -eux

source ./common.sh
$GIT clone https://code.qt.io/qt/qt5.git

(
  cd qt5
  $GIT checkout dev
  $GIT submodule update --init --recursive qtbase qtdeclarative qtquickcontrols2 qtserialport qtimageformats qtgraphicaleffects qtsvg qtwebsockets
  $GIT config --global user.email "you@example.com"
  $GIT config --global user.name "Your Name"

  cd qtbase 
  $GIT checkout dev
  $GIT fetch https://codereview.qt-project.org/qt/qtbase refs/changes/16/248916/5
  $GIT cherry-pick FETCH_HEAD
  
  sed -i 's/fuse-ld=gold/fuse-ld=lld/g' \
    mkspecs/common/gcc-base-unix.conf \
    mkspecs/features/qt_configure.prf \
    configure.json   
    
  cd ../qtdeclarative
  $GIT checkout dev
)
