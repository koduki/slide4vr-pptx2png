#!/bin/bash

## Paramaters
PPTX_NAME=$1
PNG_DIR=$2

## mamin

echo "PPTX_NAME: "$PPTX_NAME
echo "PNG_DIR: "$PNG_DIR

gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
gsutil cp gs://slide2vr-pptx/${PPTX_NAME} ./slide.pptx

pptx2png ./slide.pptx

gsutil -m cp -R dist/* gs://slide2vr-slides/${PNG_DIR}/
