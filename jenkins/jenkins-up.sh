#!/bin/bash
set -e

cat << EOF > .env
DOCKER_GROUP_ID=$(stat -c '%g' /var/run/docker.sock)
REGISTRY=localhost:5000
JENKINS_AGENT_SSH_PUBKEY=$(cat ~/.ssh/jenkins_agent_key.pub)
EOF

docker compose build
docker compose push
docker compose up -d --no-build

echo '****************************************************'
echo $'\nJenkins Server: http://localhost:8080/'
echo $'\For staring credentials: docker logs jenkins-master'
echo '****************************************************'