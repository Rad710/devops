#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

## Main Entry
## Default values

echo '****************************************************'
echo 'Sysbox Virtual Host stopping...'
echo 'Sysbox Virtual Host removing all volumes and networks...'

# Stop and remove containers, networks, and volumes using 'docker compose down'
docker compose -f docker-compose.yaml down --volumes --remove-orphans

echo 'Sysbox Virtual Host down!'
echo '****************************************************'