#!/bin/bash

export PROJECT_ID=$(gcloud config list project --format "value(core.project)")
export IMAGE_REPO_NAME=node2vec-base-image
export IMAGE_TAG=py3.6
export IMAGE_URI=gcr.io/$PROJECT_ID/$IMAGE_REPO_NAME:$IMAGE_TAG

docker build -f Dockerfile-baseimage -t $IMAGE_URI ./

