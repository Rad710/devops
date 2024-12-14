#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

## Main Entry
## Default values
SONAR_JDBC_PASSWORD=""

## Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --sonar_jdbc_password=*) 
            SONAR_JDBC_PASSWORD="${1#*=}"  # Extract password value
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

# Ensure SONAR_JDBC_PASSWORD is set
if [ -z "$SONAR_JDBC_PASSWORD" ]; then
    echo "Please provide the SONAR_JDBC_PASSWORD argument using --sonar_jdbc_password=your_password"
    exit 1
fi


echo '****************************************************'
echo 'Sonarqube Server stopping...'

# Stop and remove containers, networks, and volumes using 'docker compose down'
SONAR_JDBC_PASSWORD=$SONAR_JDBC_PASSWORD docker compose -f docker-compose.yaml down --volumes --remove-orphans

echo 'Sonarqube Server down!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo 'Sonarqube Server removing all volumes and networks...'

# Remove the custom network if it exists (assuming 'sonarqube' is the network name)
docker network rm sonarqube 2>/dev/null || echo 'Network sonarqube not found.'

echo '****************************************************'