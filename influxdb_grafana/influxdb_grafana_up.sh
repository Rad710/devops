#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

echo '****************************************************'
echo 'Docker InfluxDB and Grafana Servers init...'

# Run docker-compose and pass the REGISTRY_URL as an environment variable
REGISTRY_URL=$REGISTRY_URL docker compose -f docker-compose.yaml up -d

echo 'Docker InfluxDB and Grafana Servers up and running!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo $'InfluxDB Server: http://localhost:8086/'
echo $'Grafana server UI: http://localhost:3000/'
echo '****************************************************'

echo ''
echo '****************************************************'
echo $'Please create database jenkins InfluxDB Container with: '
echo " - docker exec -t influxdb influx -execute 'create database jenkins'"
echo '****************************************************'