#!/bin/bash
set -e

cat << EOF > .env
REGISTRY=localhost:5000
EOF

docker compose build
docker compose push
docker compose up -d --no-build

echo '****************************************************'
echo $'Sonarqube Server: http://localhost:9000/'
echo $'Starting credentials: admin:admin'
echo '****************************************************'