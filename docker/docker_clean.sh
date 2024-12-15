#!/bin/bash
# Exit the script with error if any of the commands fail
set -o errexit

echo '****************************************************'
echo 'Docker cleaning cache, images, containers, volumes...'

# # Check if there are any running containers before stopping
# running_containers=$(docker ps -q)
# if [ -n "$running_containers" ]; then
#   echo "Stopping running containers..."
#   docker stop $running_containers
# else
#   echo "No running containers to stop."
# fi

docker system prune -f -a --volumes
docker volume prune -f -a
docker network prune -f

echo 'Finished cleaning!'
echo '****************************************************'