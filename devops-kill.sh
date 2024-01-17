#!/bin/bash
set -e

cd docker/docker-registry
echo "Killing Docker Registry Server at $PWD"
./docker-registry-kill.sh
rm .env
cd ../..

cd jenkins
echo "Killing Jenkins Server at $PWD"
./jenkins-kill.sh
rm .env
cd ..

cd sonarqube
echo "Killing Sonarqube Server at $PWD"
./sonarqube-kill.sh
rm .env
cd ..

docker network rm devops

echo $'\Remove all unused networks with: docker network prune'
echo $'\Remove all unused images with: docker image prune -a'
echo $'\Remove all unused volumes with: docker volume prune -a'

echo $'\Remove all with: docker system prune --all --force --volumes'