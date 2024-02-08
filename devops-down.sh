#!/bin/bash
# set -e

cd docker/docker-registry
echo "Killing Docker Registry Server at $PWD"
./docker-registry-down.sh
rm .env
cd ../..

cd jenkins-sysbox
echo "Killing Sysbox Virtual Host at $PWD"
./sysbox-down.sh
rm .env
cd ..

cd sonarqube
echo "Killing Sonarqube Server at $PWD"
./sonarqube-down.sh
rm .env
cd ..

cd influxdb-grafana
echo "Killing InfluxDB and Grafana Server at $PWD"
./influxdb-grafana-down.sh
rm .env
cd ..


docker network rm devops

echo $'Remove all unused networks with: docker network prune'
echo $'Remove all unused images with: docker image prune -a'
echo $'Remove all unused volumes with: docker volume prune -a'

echo $'Remove all with: docker system prune --all --force --volumes'