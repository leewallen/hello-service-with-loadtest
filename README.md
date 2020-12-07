# Deploy Service to K8s and Run Load Test

## Usage

Build and deploy the hello service and its docker container:

1. Go into `deploy-hello-service` 
2. Run `./build-docker.sh`
3. Run `./deploy-k8s.sh`

The hello service will be accessible on any node in the cluster via port 32123 because we used the NodePort service type.

Build and deploy the load test JMeter docker container and instances:

1. Go into `deploy-jmeter`
2. Run `./build-docker.sh`
3. Run `./deploy-k8s.sh`

The default settings for the JMeter docker container is to run 3 JMeter instances, and run a test for 10 minutes with a 60 second rampup time. The throughput is set at 50000 messages / minute (~ 833 messages/second per thread). 

## What's done?

* Builds and deploys the hello service
* Builds and deploys the jmeter load test

## What's left?

* Add a backend listener

## Which backend listener?

Current plan is to try out InfluxDB with Grafana (UI) and Telegraf (agent that sends metrics to InfluxDB).

* [Install Telegraf, InfluxDB, and Grafana on RaspberryPi](https://nwmichl.net/2020/07/14/telegraf-influxdb-grafana-on-raspberrypi-from-scratch)
* [How to Configure JMeter](https://sfakrudeen78.github.io/JMeter-InfluxDB-Writer)

