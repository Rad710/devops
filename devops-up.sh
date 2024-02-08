#!/bin/bash
set -e

docker network create devops

cd docker/docker-registry
echo "Starting Docker Registry Server at $PWD"
./docker-registry-up.sh
cd ../..

cd sonarqube
echo "Starting Sonarqube Server at $PWD"
echo "Must set SonarQube Server requirements..."
./sonarqube-requirements.sh
./sonarqube-up.sh
cd ..

cd influxdb-grafana
echo "Starting InfluxDB and Grafana Server at $PWD"
./influxdb-grafana-up.sh
cd ..

cd jenkins-sysbox
echo "Starting Syxbox Virtual Host at $PWD"
./sysbox-up.sh
cd ..


echo '****************************************************'
echo $'Docker Registry Server: http://localhost:5000/'
echo $'Docker Registry server UI: http://localhost:81/'
echo '****************************************************'

echo '****************************************************'
echo $'Sysbox Virtual Host: at localhost -p 20'
echo $'Staring credentials: admin:admin'
echo '****************************************************'

echo '****************************************************'
echo $'Sonarqube Server: http://localhost:9000/'
echo $'Starting credentials: admin:admin'
echo '****************************************************'

echo '****************************************************'
echo $'InfluxDB Server: http://localhost:8086/'
echo $'Grafana server UI: http://localhost:3000/'
echo '****************************************************'


echo "To create database jenkins inside InfluxDB Container:"
echo " - docker exec -t influxdb influx -execute 'create database jenkins'"


echo "To create Jenkins Master in Sysbox Virtual Host:"
echo "- docker exec -t -w /usr/bin/jenkins-docker jenkins-box ./jenkins-up.sh"

echo "To SSH into sysbox jenkins-box:"
echo "- ssh admin@localhost -p 20"