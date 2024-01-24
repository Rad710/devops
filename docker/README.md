# Docker

## Scripts:
docker-install.sh:
- Install Docker Engine in Ubuntu according to https://docs.docker.com/engine/install/ubuntu/


docker-clean.sh (delete all containers and data from docker daemon):
- docker stop $(docker ps -a -q)
- docker system prune -f -a
- docker volume prune -f -a
- docker network prune -f