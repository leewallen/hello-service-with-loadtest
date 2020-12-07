#!/bin/bash

ls -la ./src/

docker login
docker buildx build --platform linux/arm/v7 -t leewallen/hellothere ./src/ --push
