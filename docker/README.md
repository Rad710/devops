# Docker

## Scripts:
docker_install_ubuntu.sh:
- Install Docker Engine in Ubuntu according to https://docs.docker.com/engine/install/ubuntu/


docker_clean.sh
- Script to remove all dangling containers, images, volumes and networks

docker_registry folder
- Initializes the Docker Registry Server and UI


# Docker Registry and Docker Registry UI

## Images:
- registry:2
- joxit/docker-registry-ui:main

## Scripts:
docker-registry-up.sh:
- Initializes containers


docker_registry_down.sh:
- Remove docker containers and volumes, networks, etc.

## Containers:
#### Docker Registry at localhost:5000 (no credentials configured)
To push images:
- docker tag <image-name> localhost:5000/<image-name>
- docker push localhost:5000/<image-name>

#### Docker Registry UI at localhost:81
Delete images enabled


TODO: use registry with https and configure credentials, etc