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
        --group_add_id=*) 
            GROUP_ADD_ID="${1#*=}"  # Extract password value
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

IS_VALID=true
# Ensure REGISTRY_URL is set
if [ -z "$REGISTRY_URL" ]; then
    echo "Please provide the REGISTRY_URL argument using --registry_url=localhost:5000"
    IS_VALID=false
fi

# Ensure GROUP_ADD_ID is set
if [ -z "$GROUP_ADD_ID" ]; then
    echo "Please provide the GROUP_ADD_ID argument using --group_add_id=$(stat -c '%g' /var/run/docker.sock)"
    IS_VALID=false
fi

# Check if validation failed
if [ "$IS_VALID" = false ]; then
    exit 1
fi

## Main Entry

echo '****************************************************'
echo 'Jenkins Server stopping...'
echo 'Jenkins Server removing all volumes and networks...'

# Stop and remove containers, networks, and volumes using 'docker compose down'
REGISTRY_URL=$REGISTRY_URL GROUP_ADD_ID=$GROUP_ADD_ID docker compose -f docker-compose.yaml down --volumes --remove-orphans

echo 'Jenkins Server down!'
echo '****************************************************'