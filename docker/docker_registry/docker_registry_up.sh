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
    echo "Please provide the REGISTRY_URL argument using --registry_url=your_url (ex. http://localhost:5000)"
    exit 1
fi


echo '****************************************************'
echo 'Docker Registry Server init...'

# Run docker-compose and pass the REGISTRY_URL as an environment variable
REGISTRY_URL=$REGISTRY_URL docker compose -f docker-compose.yaml up -d

echo 'Docker Registry Server up and running!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo "Docker Registry Server: ${REGISTRY_URL}"
echo $'Docker Registry server UI: http://localhost:81/'
echo '****************************************************'