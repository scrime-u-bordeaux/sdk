#!/bin/bash

export NPROC=$(nproc)
export INSTALL_PREFIX=/opt/score-sdk
export SDK_ROOT=$PWD

if [[ -f "$INSTALL_PREFIX/llvm/bin/clang" ]]; then
  export CC=$INSTALL_PREFIX/llvm/bin/clang
  export CXX=$INSTALL_PREFIX/llvm/bin/clang++
  export PATH=$INSTALL_PREFIX/llvm/bin:$PATH
  export LD_LIBRARY_PATH=$INSTALL_PREFIX/llvm/lib
  export CFLAGS="-O3"
  export CXXFLAGS="-O3"
fi

export GIT=/opt/rh/rh-git29/root/usr/bin/git
export CMAKE=cmake3
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/rh/rh-git29/root/usr/lib:/opt/rh/httpd24/root/usr/lib64
