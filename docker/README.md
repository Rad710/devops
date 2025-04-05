# Docker

## Scripts:
docker_install_ubuntu.sh:
- Install Docker Engine in Ubuntu according to https://docs.docker.com/engine/install/ubuntu/


## Docker Remove containers and clean
```bash
docker system prune -f -a --volumes
docker volume prune -f -a
docker network prune -f
```