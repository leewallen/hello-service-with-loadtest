#!/bin/bash

cd deploy-hello-service

./build-docker.sh
./deploy-k8s.sh

cd ../deploy-jmeter

./build-docker.sh
./deploy-k8s.sh

cd ..

echo "Done - watch the load test by tailing a load test instance's loadtest.log file."
