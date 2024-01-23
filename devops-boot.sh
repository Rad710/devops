#!/bin/bash
set -e

docker network create devops

cd docker/docker-registry
echo "Starting Docker Registry Server at $PWD"
./docker-registry-boot.sh
cd ../..

cd jenkins
echo "Starting Jenkins Server at $PWD"
./jenkins-boot.sh
cd ..

cd sonarqube
echo "Starting Sonarqube Server at $PWD"
./sonarqube-requirements.sh
./sonarqube-boot.sh
cd ..


echo '****************************************************'
echo $'\Docker Registry Server: http://localhost:5000/'
echo $'\Docker Registry server UI: http://localhost:80/'
echo '****************************************************'

echo '****************************************************'
echo $'\nJenkins Server: http://localhost:8080/'
echo $'\For staring credentials: docker logs jenkins-master'
echo '****************************************************'

echo '****************************************************'
echo $'\Sonarqube Server: http://localhost:9000/'
echo $'\Starting credentials: admin:admin'
echo '****************************************************'