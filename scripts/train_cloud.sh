#!/bin/bash

source .env

JOB_NAME=job_$(date +%Y%m%d_%H%M%S)

docker build -f Dockerfile -t $IMAGE_URI ./
docker push $IMAGE_URI

INPUT_URI="gs://cp-0308b/datasets/node2vec-test/karate.edgelist"

gcloud ai-platform jobs submit training $JOB_NAME \
       --master-image-uri $IMAGE_URI \
       -- \
       --input=$INPUT_URI


gcloud ai-platform jobs stream-logs ${JOB_NAME}
