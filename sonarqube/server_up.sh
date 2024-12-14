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


#Sonarqube requirements: 
# https://docs.sonarsource.com/sonarqube/latest/requirements/prerequisites-and-overview/
echo '****************************************************'
echo 'Sonarqube Server requirements...'
sudo su <<EOF
    sysctl -w vm.max_map_count=524288
    sysctl -w fs.file-max=131072
    ulimit -n 131072
    ulimit -u 8192
EOF
echo '****************************************************'

echo ''
echo '****************************************************'
echo 'Sonarqube Server init...'

# Run docker-compose and pass the SONAR_JDBC_PASSWORD as an environment variable
SONAR_JDBC_PASSWORD=$SONAR_JDBC_PASSWORD docker compose -f docker-compose.yaml up -d

echo 'Sonarqube Server up and running!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo 'Sonarqube Server: http://localhost:9000/'
echo 'Starting credentials: admin:admin'
echo '****************************************************'