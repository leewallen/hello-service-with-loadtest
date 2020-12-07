#!/bin/bash

docker login

docker buildx build --platform linux/arm/v7 -t leewallen/jmeter \
   --build-arg TARGET_HOST=${TARGET_HOST:-10.0.0.200} \
   --build-arg TARGET_PORT=${TARGET_PORT:-32123} \
   --build-arg DURATION_SECONDS=${DURATION_SECONDS:-600} \
   --build-arg RAMPUP_SECONDS=${RAMPUP_SECONDS:-60} \
   --build-arg NUM_THREADS=${NUM_THREADS:-10} \
   --build-arg THROUGHPUT=${THROUGHPUT:-50000} \
   --build-arg TEST_DATA_FILE=${TEST_DATA_FILE:-./test-data.txt} \
   --build-arg TEST_FILE=${TEST_FILE:-./test-file.jmx} \
   . \
   --push


