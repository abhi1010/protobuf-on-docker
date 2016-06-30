
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
CXXSTD=gnu++11

PKG=protobuf-3.0.0-beta-3.2

TGT=/ws/protoc-3.2

VER=${PKG#protobuf-}

cd $PKG/build-system
# Default configure RPATH is absolute - we want a relative one instead for protoc


echo -e "--- ABHI: 1"
echo -e "--- ABHI: 2"

echo -e "--- ABHI: 3"

cd ..
cd build-grassgcc

echo -e "--- ABHI: 4"

# export PATH=$GRASS_GCC_PATH/bin:$PATH
# export LD_LIBRARY_PATH=$GRASS_GCC_PATH/lib64:$LD_LIBRARY_PATH
export CXXFLAGS="-g -O2 -flto -ffat-lto-objects -std=$CXXSTD"
export LDFLAGS="-g -O2 -flto -ffat-lto-objects -std=$CXXSTD"
echo -e "--- ABHI: 5"

../configure --prefix=$(readlink -f ../install-grassgcc)
# find ../ -name config.log | xargs cat 
echo -e "--- ABHI: 6"

CC=distcc make -j32
echo -e "--- ABHI: 7"

make install

echo -e "--- ABHI: 8"


mkdir -p $TGT/lib-$GRASS_GCC
echo -e "dir = $TGT/lib-$GRASS_GCC"
echo -e "--- ABHI: 9"

cp -av ../install-grassgcc/lib/* $TGT/lib-$GRASS_GCC
echo -e "--- ABHI: 10"

# Build pip-friendly source distribution
cd ../python
# patch < ../../$PKG.patch
export PROTOC=$TGT/bin/protoc
export LDFLAGS="-L$TGT/lib"
export LD_LIBRARY_PATH=$TGT/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$TGT/lib-$GRASS_GCC:$LD_LIBRARY_PATH
# export PATH=/usr/local/python34/bin:$PATH  # For distros using grass-python34
echo -e "--- ABHI: 11"
