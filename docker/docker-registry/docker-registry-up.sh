#!/bin/bash
set -e

cat << EOF > .env
REGISTRY=localhost:5000
EOF

docker compose build
docker compose up -d --no-build
docker compose push

echo '****************************************************'
echo $'\Docker Registry Server: http://localhost:5000/'
echo $'\Docker Registry server UI: http://localhost:81/'
echo '****************************************************'