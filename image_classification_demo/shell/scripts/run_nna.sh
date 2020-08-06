#!/bin/bash
DEMO_ROOT=/home/jasonwang/base/projects/paddle_lite/predict/img_arm/PaddleLite-linux-demo/image_classification_demo
LABEL_NAME=${DEMO_ROOT}/assets/labels/synset_words.txt
IMAGE_NAME=${DEMO_ROOT}/assets/images/tabby_cat.raw
IMGDNN_LIBS=/home/jasonwang/imgtools/imgdnn_arm64/2.6/lib

# MobileConfig (.nb file without sufix)
#MODEL_NAME=${DEMO_ROOT}/assets/models/mobilenet_v1_int8_opt_nna
# CxxConfig
MODEL_NAME=/home/jasonwang/models/paddle/MobileNetV1_quant_dl

export LD_LIBRARY_PATH=${DEMO_ROOT}/../libs/PaddleLite/arm64/lib

sudo ./build/image_classification_demo ${MODEL_NAME} ${LABEL_NAME} ${IMAGE_NAME}

