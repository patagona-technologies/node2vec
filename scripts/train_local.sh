#!/bin/bash
source .env

docker build -f Dockerfile -t $IMAGE_URI ./

INPUT_URI="gs://cp-0308b/datasets/node2vec-test/karate.edgelist"

docker run ${IMAGE_URI} --input=$INPUT_URI
