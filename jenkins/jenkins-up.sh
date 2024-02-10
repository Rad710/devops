#!/bin/bash
set -e

#Create SSH key for Agent
cat << EOF > .env
REGISTRY=localhost:5000
EOF

docker compose build
docker compose push
docker compose up -d --no-build

echo '****************************************************'
echo $'Jenkins Server: http://localhost:8080/'
echo $'For staring credentials: docker logs jenkins-master'
echo $'You can connect Jenkins to the Sysbox Docker Daemon with: tcp://jenkins-box:2375'
echo '****************************************************'