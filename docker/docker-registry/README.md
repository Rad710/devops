# Docker Registry and Docker Registry UI

## Images:
- registry:2
- joxit/docker-registry-ui:main

## Scripts:
docker-registry-up.sh:
- docker compose build
- docker compose up -d --no-build
- docker compose push


docker-registry-down.sh:
- docker compose down

## Containers:
#### Docker Registry at localhost:5000 (no credentials configured)
To push images:
- docker tag <image-name> localhost:5000/<image-name>
- docker push localhost:5000/<image-name>

#### Docker Registry UI at localhost:81
Delete images enables