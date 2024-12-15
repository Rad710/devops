#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

echo '****************************************************'
echo 'Sysbox Virtual Host init...'

docker compose -f docker-compose.yaml up -d

echo 'Sysbox Virtual Host up and running!'
echo '****************************************************'

echo '****************************************************'
echo $'Sysbox Virtual Host: at localhost -p 20'
echo $'Staring credentials: admin:admin'
echo $'To connect Jenkins Docker Cloud over TCP use: tcp://jenkins-box:2375'
echo '****************************************************'