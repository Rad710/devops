#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

## Main Entry

echo '****************************************************'
echo 'Docker InfluxDB and Grafana Servers stopping...'
echo 'Docker InfluxDB and Grafana Servers removing all volumes and networks...'

# Stop and remove containers, networks, and volumes using 'docker compose down'
docker compose -f docker-compose.yaml down --volumes --remove-orphans

echo 'Docker InfluxDB and Grafana Servers down!'
echo '****************************************************'