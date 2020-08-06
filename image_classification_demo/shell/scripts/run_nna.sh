#!/bin/bash
DEMO_ROOT=/home/jasonwang/base/projects/paddle_lite/predict/img_arm/PaddleLite-linux-demo/image_classification_demo
#MODEL_NAME=${DEMO_ROOT}/assets/models/mobilenet_v1_int8_224_for_cpu.nb
MODEL_NAME=${DEMO_ROOT}/assets/models/mobilenet_v1_int8_opt_nna.nb
LABEL_NAME=${DEMO_ROOT}/assets/labels/synset_words.txt
IMAGE_NAME=${DEMO_ROOT}/assets/images/tabby_cat.raw
#WORK_SPACE=/userdata/bin
IMGDNN_LIBS=/home/jasonwang/imgtools/imgdnn_arm64/2.6/lib
#IMGDNN_DEPS=/home/jasonwang/roc1_devb/depends/rel/lib

export LD_LIBRARY_PATH=${DEMO_ROOT}/../libs/PaddleLite/arm64/lib
#:${IMGDNN_LIBS}:${IMGDNN_DEPS}
sudo ./build/image_classification_demo ${MODEL_NAME} ${LABEL_NAME} ${IMAGE_NAME}

