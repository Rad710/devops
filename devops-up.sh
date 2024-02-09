#!/bin/bash
set -e

docker network create devops

cd docker/docker-registry
echo "Starting Docker Registry Server at $PWD"
./docker-registry-up.sh
cd ../..

cd jenkins
echo "Starting Jenkins Server at $PWD"
./jenkins-up.sh
cd ..

cd sonarqube
echo "Starting Sonarqube Server at $PWD"
./sonarqube-requirements.sh
./sonarqube-up.sh
cd ..

cd influxdb-grafana
echo "Starting InfluxDB and Grafana Server at $PWD"
./influxdb-grafana-up.sh
docker exec -t influxdb influx -execute 'create database jenkins'
cd ..


echo '****************************************************'
echo $'Docker Registry Server: http://localhost:5000/'
echo $'Docker Registry server UI: http://localhost:81/'
echo '****************************************************'

echo '****************************************************'
echo $'Jenkins Server: http://localhost:8080/'
echo $'For staring credentials: docker logs jenkins-master'
echo $'You can bind the socket to other containers inside Jenkins with: /var/run/docker.sock"'
echo '****************************************************'

echo '****************************************************'
echo $'Sonarqube Server: http://localhost:9000/'
echo $'Starting credentials: admin:admin'
echo '****************************************************'

echo '****************************************************'
echo $'InfluxDB Server: http://localhost:8086/'
echo $'Grafana server UI: http://localhost:3000/'
echo $'\nTo create database jenkins inside InfluxDB Container:'
echo " - docker exec -t influxdb influx -execute 'create database jenkins'"
echo '****************************************************'