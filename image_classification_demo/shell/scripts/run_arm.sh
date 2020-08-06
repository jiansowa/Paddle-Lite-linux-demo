#!/bin/bash
DEMO_ROOT=/home/jasonwang/base/projects/paddle_lite/predict/img_arm/PaddleLite-linux-demo/image_classification_demo
MODEL_NAME=${DEMO_ROOT}/assets/models/mobilenet_v1_int8_opt_arm.nb
LABEL_NAME=${DEMO_ROOT}/assets/labels/synset_words.txt
IMAGE_NAME=${DEMO_ROOT}/assets/images/tabby_cat.raw


#export LD_LIBRARY_PATH=${DEMO_ROOT}/../libs/PaddleLite/arm64/lib
./build/image_classification_demo ${MODEL_NAME} ${LABEL_NAME} ${IMAGE_NAME}

