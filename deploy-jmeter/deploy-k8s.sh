#!/bin/bash

# Use the following section if you want to configure multiple environments

# sed -i'' -e "s/<app_name>/helloworld-test/g" ./yaml/deployment.yml
# sed -i'' -e "s/<namespace>/loadtest/g" ./yaml/deployment.yml
# sed -i'' -e "s/<replica_count>/3/g" ./yaml/deployment.yml
# sed -i'' -e "s|<target_host>|${TARGET_HOST:-localhost}|g" ./yaml/deployment.yml
# sed -i'' -e "s|<test_data_file>|${TEST_DATA_FILE}|g" ./yaml/deployment.yml
# sed -i'' -e "s|<throughput>|100000|g" ./yaml/deployment.yml
# sed -i'' -e "s|<num_threads>|10|g" ./yaml/deployment.yml
# sed -i'' -e "s|<rampup_seconds>|60|g" ./yaml/deployment.yml
# sed -i'' -e "s|<duration_seconds>|900|g" ./yaml/deployment.yml
# sed -i'' -e "s|<ttl_seconds_after_finished>|ttlSecondsAfterFinished: 300|g" ./yaml/deployment.yml

echo "Updated deployment..."
cat ./yaml/deployment.yml

echo "Deploying..."
kubectl apply --overwrite=true -f ./yaml

watch -n 5 'kubectl get pods -o wide'
