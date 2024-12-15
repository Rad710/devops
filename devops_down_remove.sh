#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

cd sonarqube
bash sonarqube_down_remove.sh --sonar_jdbc_password=sonar
cd ..

cd influxdb_grafana
bash influxdb_grafana_down_remove.sh
cd ..

cd jenkins_dood
bash jenkins_down_remove.sh --registry_url=localhost:5000 --group_add_id=$(stat -c '%g' /var/run/docker.sock)
cd ..

cd docker/docker_registry
bash docker_registry_down_remove.sh --registry_url=http://localhost:5000
cd ../..

cd sysbox
bash sysbox_down_remove.sh --registry_url=localhost:5000
cd ..
