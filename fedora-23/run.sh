
set -e

# source vars.sh
#!/bin/bash

# current version of local gcc version
GRASS_GCC=${GRASS_GCC:-"gcc53"}
# GRASS_GCC_PATH=${GRASS_GCC_PATH:-"/opt/$GRASS_GCC"}
CXXSTD=gnu++14

# HIGGS_ROOT=${HIGGS_ROOT:-"/home/abhishek.pandey/code/higgs"}
# ARCH_SH=${ARCH_SH:-"$HIGGS_ROOT/build/arch.sh"}
# GENARCH_SH=${GENARCH_SH:-"$HIGGS_ROOT/build/genarch.sh"}
#
# ARCH=$($ARCH_SH)
# GENARCH=$($GENARCH_SH)
#
# VENDOR_DIR=${VENDOR:-"$HIGGS_ROOT/vendor/unix/$ARCH"}
# GENVENDOR_DIR=${VENDOR:-"$HIGGS_ROOT/vendor/unix/$GENARCH"}
#
# export AR="gcc-ar"
# export RANLIB="gcc-ranlib"
# --------------------
# PKG=$(basename $0 .sh)
PKG=protobuf-3.0.0-beta-3.2
echo -e "PKG= $(ls)"
TGT=/ws/protoc-3.2
echo -e "----------"
ls
tar xf $PKG.tar
echo -e "----------"
ls
cd $PKG
echo -e "----------"
ls
echo -e "Installing $PKG to $TGT using $GRASS_GCC, ctrl-c to abort..."
echo -e "1"
VER=${PKG#protobuf-}
echo -e "Ver = $VER"
# We need to build two versions - one using system gcc for running the compiler and one
# using grass gcc for linking to applications

echo -e "3"
# ./autogen.sh
echo -e "4"
./autogen.sh

mkdir -p build-system
echo "5"
echo "----------------"
cd build-system
echo "----------------"
pwd
echo "----------------"
#
# # Default configure RPATH is absolute - we want a relative one instead for protoc
# ../configure --prefix=$TGT --libdir=$TGT/lib --disable-rpath LDFLAGS='-Wl,-rpath,'\''$$ORIGIN'\''/../lib'
#
#
# echo -e "--- ABHI: 1"
# CC=distcc make -j32
# echo -e "--- ABHI: 2"
#
# make install
# echo -e "--- ABHI: 3"
#
# cd ..
# mkdir -p build-grassgcc
# cd build-grassgcc
#
# echo -e "--- ABHI: 4"
#
# # export PATH=$GRASS_GCC_PATH/bin:$PATH
# # export LD_LIBRARY_PATH=$GRASS_GCC_PATH/lib64:$LD_LIBRARY_PATH
# export CXXFLAGS="-g -O2 -flto -ffat-lto-objects -std=$CXXSTD"
# export LDFLAGS="-g -O2 -flto -ffat-lto-objects -std=$CXXSTD"
# echo -e "--- ABHI: 5"
#
# ../configure --prefix=$(readlink -f ../install-grassgcc)
# echo -e "--- ABHI: 6"
#
# CC=distcc make -j32
# echo -e "--- ABHI: 7"
#
# make install
#
# echo -e "--- ABHI: 8"
#
#
# mkdir -p $TGT/lib-$GRASS_GCC
# echo -e "dir = $TGT/lib-$GRASS_GCC"
# echo -e "--- ABHI: 9"
#
# cp -av ../install-grassgcc/lib/* $TGT/lib-$GRASS_GCC
# echo -e "--- ABHI: 10"
#
# # Build pip-friendly source distribution
# cd ../python
# # patch < ../../$PKG.patch
# export PROTOC=$TGT/bin/protoc
# export LDFLAGS="-L$TGT/lib"
# export LD_LIBRARY_PATH=$TGT/lib:$LD_LIBRARY_PATH
# # export PATH=/usr/local/python34/bin:$PATH  # For distros using grass-python34
# echo -e "--- ABHI: 11"
#
# python3.4 setup.py build --cpp_implementation
#
# echo -e "--- ABHI: 12"
# python3.4 setup.py test --cpp_implementation
#
# echo -e "--- ABHI: 13"
# python3.4 setup.py sdist --cpp_implementation
