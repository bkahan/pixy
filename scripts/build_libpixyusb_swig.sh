#!/bin/bash

cd ..

PIXY_ROOT=$PWD
TARGET_BUILD_FOLDER=libpixyusb_swig

mkdir $PIXY_ROOT/build/
mkdir $PIXY_ROOT/build/$TARGET_BUILD_FOLDER

cd $PIXY_ROOT/src/host/libpixyusb_swig

# Abort script on error
set -e

echo "-----------------------------------------"
echo " Building libpixyusb SWIG module"
echo "-----------------------------------------"

cp get_blocks.py $PIXY_ROOT/build/$TARGET_BUILD_FOLDER
cp pixy.i $PIXY_ROOT/build/$TARGET_BUILD_FOLDER
cp setup.py $PIXY_ROOT/build/$TARGET_BUILD_FOLDER

cd $PIXY_ROOT/build/$TARGET_BUILD_FOLDER

swig -c++ -python pixy.i
python setup.py build_ext --inplace

set +e

echo ""
echo "-----------------------------------------"
echo " Build complete"
echo "-----------------------------------------"
echo ""
echo "To run the get_blocks libpixyusb SWIG example execute the following commands:"
echo ""
echo " > cd ../build/libpixyusb_swig"
echo " > python get_blocks.py"
echo ""

cd $PIXY_ROOT/scripts