#!/bin/bash
set -e

# docker system prune -f

# docker builder prune
# docker container prune
# docker image prune -a -f
# docker volume prune

docker stop $(docker ps -a -q)
docker system prune -f -a
docker volume prune -f -a
docker network prune -f