#!/bin/bash

# current version of local gcc version
GRASS_GCC=${GRASS_GCC:-"gcc53"}
GRASS_GCC_PATH=${GRASS_GCC_PATH:-"/opt/$GRASS_GCC"}
CXXSTD=gnu++14

HIGGS_ROOT=${HIGGS_ROOT:-"/home/abhishek.pandey/code/higgs"}
ARCH_SH=${ARCH_SH:-"$HIGGS_ROOT/build/arch.sh"}
GENARCH_SH=${GENARCH_SH:-"$HIGGS_ROOT/build/genarch.sh"}

ARCH=$($ARCH_SH)
GENARCH=$($GENARCH_SH)

VENDOR_DIR=${VENDOR:-"$HIGGS_ROOT/vendor/unix/$ARCH"}
GENVENDOR_DIR=${VENDOR:-"$HIGGS_ROOT/vendor/unix/$GENARCH"}

export AR="gcc-ar"
export RANLIB="gcc-ranlib"


