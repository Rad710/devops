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
    echo "Please provide the REGISTRY_URL for the UI argument using --registry_url=http://localhost:5000"
    exit 1
fi


echo '****************************************************'
echo 'Docker Registry Server stopping...'
echo 'Docker Registry Server removing all volumes and networks...'

# Stop and remove containers, networks, and volumes using 'docker compose down'
REGISTRY_URL=$REGISTRY_URL docker compose -f docker-compose.yaml down --volumes --remove-orphans

echo 'Docker Registry Server down!'
echo '****************************************************'