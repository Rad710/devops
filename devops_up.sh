#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit


echo ''
# Check if the devops network already exists
if ! docker network inspect devops &>/dev/null; then
    # If it does not exist, create it
    docker network create devops
    echo "Created the devops network."
else
    echo "The devops network already exists, skipping creation."
fi
echo ''

echo ''
# Check if the jenkins network already exists
if ! docker network inspect jenkins &>/dev/null; then
    # If it does not exist, create it
    docker network create jenkins
    echo "Created the jenkins network."
else
    echo "The jenkins network already exists, skipping creation."
fi
echo ''

# Create Docker Registry Server where images will be uploaded
cd docker/docker_registry
bash docker_registry_up.sh --registry_url=http://localhost:5000
cd ../..

# Initialize sysbox
cd sysbox
bash sysbox_up.sh --registry_url=localhost:5000
cd ..


cd sonarqube
bash sonarqube_up.sh --sonar_jdbc_password=sonar
cd ..

cd influxdb_grafana
bash influxdb_grafana_up.sh
cd ..

echo ''
echo '****************************************************'
echo $'SSH into Virtual Host....'
sleep 5
sshpass -p 'admin' scp -r -P 20 jenkins_dood/ admin@localhost:/tmp/jenkins_dood
sshpass -p 'admin' ssh admin@localhost -p 20 "cd /tmp/jenkins_dood && bash jenkins_up.sh --registry_url=localhost:5000 --group_add_id=$(stat -c '%g' /var/run/docker.sock)"
echo '****************************************************'



# # Jenkins DooD is inside sysbox
# cd jenkins_dood
# bash jenkins_up.sh --registry_url=localhost:5000 --group_add_id=$(stat -c '%g' /var/run/docker.sock)
# cd ..
