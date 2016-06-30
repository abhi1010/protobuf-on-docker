
set -e

# source vars.sh
#!/bin/bash
echo "========================="
pwd
ls
echo "========================="
# current version of local gcc version
GRASS_GCC=${GRASS_GCC:-"gcc53"}
# GRASS_GCC_PATH=${GRASS_GCC_PATH:-"/opt/$GRASS_GCC"}
CXXSTD=gnu++14

PKG=protobuf-3.0.0-beta-3.2

TGT=/ws/protoc-3.2

VER=${PKG#protobuf-}

cd $PKG/build-system
# Default configure RPATH is absolute - we want a relative one instead for protoc
../configure --prefix=$TGT --libdir=$TGT/lib --disable-rpath LDFLAGS='-Wl,-rpath,'\''$$ORIGIN'\''/../lib'


echo -e "--- ABHI: 1"
CC=distcc make -j32
echo -e "--- ABHI: 2"

make install
echo -e "--- ABHI: 3"

cd ..
mkdir -p build-grassgcc
cd build-grassgcc

echo -e "--- ABHI: 4"

# export PATH=$GRASS_GCC_PATH/bin:$PATH
# export LD_LIBRARY_PATH=$GRASS_GCC_PATH/lib64:$LD_LIBRARY_PATH
export CXXFLAGS="-g -O2 -flto -ffat-lto-objects -std=$CXXSTD"
export LDFLAGS="-g -O2 -flto -ffat-lto-objects -std=$CXXSTD"
echo -e "--- ABHI: 5"
