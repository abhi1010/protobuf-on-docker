
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

# LD_LIBRARY_PATH=$TGT/lib:$LD_LIBRARY_PATH
export PROTOC=$TGT/bin/protoc
export LDFLAGS="-L$TGT/lib"
export LD_LIBRARY_PATH=$TGT/lib-$GRASS_GCC:$LD_LIBRARY_PATH:/ws/protoc-3.2/lib-gcc53/:/ws/protoc-3.2/:/ws/protoc-3.2/lib/
export LD_LIBRARY_PATH=/ws/$PKG/build-grassgcc/src/.libs/:$LD_LIBRARY_PATH

echo -e "%%%%%%%%%%%%%%%%%%%"
ldconfig -p
echo -e "%%%%%%%%%%%%%%%%%%%"
export PATH=$TGT/bin/:/ws/protoc-3.2/lib-gcc53:/ws/protoc-3.2/lib:/usr/local/python34/bin:$PATH  # For distros using grass-python34
VER=${PKG#protobuf-}

cd $PKG/build-system

cd ..
cd build-grassgcc

cp -av ../install-grassgcc/lib/* $TGT/lib

cd ../python


python3.4 setup.py build --cpp_implementation

echo -e "--- ABHI: 12"
python3.4 setup.py test --cpp_implementation

echo -e "--- ABHI: 13"
python3.4 setup.py sdist --cpp_implementation
