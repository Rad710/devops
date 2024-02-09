#!/bin/bash
set -e

cat << EOF > .env
REGISTRY=localhost:5000
EOF

docker compose build
docker compose push
docker compose up -d --no-build

echo '****************************************************'
echo $'Sysbox Virtual Host: at localhost -p 20'
echo $'Staring credentials: admin:admin'
echo $'To connect Jenkins Docker Cloud over TCP use: tcp://jenkins-box:2375'
echo '****************************************************'