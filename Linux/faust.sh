#!/bin/bash

source ./common.sh

$GIT clone --depth=1 https://github.com/grame-cncm/faust
cd faust/build
echo '
set ( ASMJS_BACKEND  OFF CACHE STRING  "Include ASMJS backend" FORCE )
set ( C_BACKEND      COMPILER STATIC DYNAMIC        CACHE STRING  "Include C backend"         FORCE )
set ( CPP_BACKEND    COMPILER STATIC DYNAMIC        CACHE STRING  "Include CPP backend"       FORCE )
set ( FIR_BACKEND    OFF        CACHE STRING  "Include FIR backend"       FORCE )
set ( INTERP_BACKEND OFF        CACHE STRING  "Include INTERPRETER backend" FORCE )
set ( JAVA_BACKEND   OFF        CACHE STRING  "Include JAVA backend"      FORCE )
set ( JS_BACKEND     OFF        CACHE STRING  "Include JAVASCRIPT backend" FORCE )
set ( LLVM_BACKEND   COMPILER STATIC DYNAMIC        CACHE STRING  "Include LLVM backend"      FORCE )
set ( OLDCPP_BACKEND OFF        CACHE STRING  "Include old CPP backend"   FORCE )
set ( RUST_BACKEND   OFF        CACHE STRING  "Include RUST backend"      FORCE )
set ( WASM_BACKEND   OFF   CACHE STRING  "Include WASM backend"  FORCE )
' > backends/llvm.cmake

mkdir -p faustdir
cd faustdir

$CMAKE \
    -C ../backends/llvm.cmake \
    -DINCLUDE_OSC=0 \
    -DINCLUDE_HTTP=0 \
    -DINCLUDE_EXECUTABLE=0 \
    -DINCLUDE_STATIC=1 \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX/faust \
    .. 
    
make -j$NPROC
make install
