#!/bin/bash

set -e

VERSION=0.0.2

RELEASE_VERSION=${VERSION}

SDK_BIN_URL=https://github.com/HoseinHaqiqian/webrtc-sdk/releases/download/${RELEASE_VERSION}/libwebrtc.aar

BUILD_DIR=build
mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

echo "Downloading webrtc-sdk ${VERSION} binary for android."
curl -L -O ${SDK_BIN_URL}

mvn install:install-file \
    -Dfile=libwebrtc.aar \
    -Dpackaging=aar \
    -Dversion=${RELEASE_VERSION} \
    -DgroupId=com.github.HoseinHaqiqian \
    -DartifactId=webrtc-sdk
