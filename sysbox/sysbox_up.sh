#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

## Main Entry
## Default values
REGISTRY_URL=""

## Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --registry_url=*) 
            REGISTRY_URL="${1#*=}"  # Extract password value
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

# Ensure REGISTRY_URL is set
if [ -z "$REGISTRY_URL" ]; then
    echo "Please provide the REGISTRY_URL argument using --registry_url=localhost:5000"
    exit 1
fi

echo '****************************************************'
echo $'Building ubuntu-systemd-docker image...'

docker build -t ${REGISTRY_URL}/sysbox/ubuntu-systemd-docker:noble .
docker push ${REGISTRY_URL}/sysbox/ubuntu-systemd-docker:noble

echo $'Docker image ubuntu-systemd-docker built!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo 'Sysbox Virtual Host init...'

REGISTRY_URL=$REGISTRY_URL docker compose -f docker-compose.yaml up -d

echo 'Sysbox Virtual Host up and running!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo $'Sysbox Virtual Host: at localhost -p 20'
echo $'Staring credentials: admin:admin'
echo $'You can create containers inside this Virtual Host now!'
echo '****************************************************'