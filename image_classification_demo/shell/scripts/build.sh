#!/bin/bash
# TARGET_ARCH_ABI=arm64 for RK1808 EVB, and armhf for RK1806 EVB.
TARGET_ARCH_ABI=arm64
USE_FULL_API=ON

if [ "x$1" != "x" ]; then
    TARGET_ARCH_ABI=$1
fi

#IMGNNA_DDK_ROOT=/home/jasonwang/imgtools/imgdnn_arm64/2.6
#IMGDNN_DEPS=/home/jasonwang/roc1_devb/depends/rel/


rm -rf build
mkdir build
cd build

cmake -DPADDLE_LITE_DIR=$(readlink -f ../../../libs/PaddleLite) \
      -DTARGET_ARCH_ABI=${TARGET_ARCH_ABI} \
      -DUSE_FULL_API=ON	\
      -DCMAKE_BUILD_TYPE=Debug ..
make

      #-DIMGNNA_DDK_ROOT=${IMGNNA_DDK_ROOT} \
      #-DIMGDNN_DEPS=${IMGDNN_DEPS} \
