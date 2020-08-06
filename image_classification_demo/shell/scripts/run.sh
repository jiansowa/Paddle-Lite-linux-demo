#!/bin/bash
MODEL_NAME=mobilenet_v1_int8_224_for_rknpu.nb
LABEL_NAME=synset_words.txt
IMAGE_NAME=tabby_cat.raw
WORK_SPACE=/userdata/bin

# TARGET_ARCH_ABI=arm64 for RK1808 EVB, and armhf for RK1806 EVB.
TARGET_ARCH_ABI=arm64
if [ "x$1" != "x" ]; then
    TARGET_ARCH_ABI=$1
fi

# Please install adb, and DON'T run this in the docker.
adb shell "echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
adb shell "echo 1608000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed"
adb shell "echo userspace > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor"
adb shell "echo 1608000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed"
adb push ../../libs/PaddleLite/${TARGET_ARCH_ABI}/lib/. ${WORK_SPACE}
adb push ../assets/models/${MODEL_NAME} ${WORK_SPACE}
adb push ../assets/labels/${LABEL_NAME} ${WORK_SPACE}
adb push ../assets/images/${IMAGE_NAME} ${WORK_SPACE}
adb push build/image_classification_demo ${WORK_SPACE}
adb shell "cd ${WORK_SPACE}; export GLOG_v=5; ulimit -c unlimited; LD_LIBRARY_PATH=$LD_LIBRARY_PATH:. ./image_classification_demo ./${MODEL_NAME} ./${LABEL_NAME} ./${IMAGE_NAME}"
