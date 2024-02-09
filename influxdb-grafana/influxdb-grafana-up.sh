#!/bin/bash
set -e

cat << EOF > .env
REGISTRY=localhost:5000
EOF

docker compose build
docker compose up -d --no-build
docker compose push

echo '****************************************************'
echo $'InfluxDB Server: http://localhost:8086/'
echo $'Grafana server UI: http://localhost:3000/'
echo $'\nTo create database jenkins inside InfluxDB Container:'
echo " - docker exec -t influxdb influx -execute 'create database jenkins'"
echo '****************************************************'