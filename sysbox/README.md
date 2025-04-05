# Sysbox Virtual Host
This runs an isolated instance of Ubuntu Noble with an isolated Docker Daemon. You may create your own docker containers inside, privileged or mounting docker's unix sock. 

To use local docker-registry inside the Containers (sysbox and Docker Registry) must be in the same docker network, and you must create the file **/etc/docker/daemon.json** with content and execut **sudo service docker restart**:

```json
{
  "insecure-registries" : [
    "docker-registry-server:5000"
  ]
}
```


## Images:
- ubuntu:noble

## Scripts:
sysbox_install.sh:
- Installs sysbox according to their [documentation](https://github.com/nestybox/sysbox/blob/master/docs/user-guide/install-package.md). Must provide the arguments:
  - --sysbox_version
  - --sysbox_arch


## Containers:
#### Jenkins-box
This contains a Docker Daemon Host. You can ssh into it using (or configure a different port):
- ssh admin@localhost -p 20
- Initial credentials are "admin:admin"


## Init containers:
```bash
echo '****************************************************'
echo $'Building ubuntu-systemd-docker image...'

export REGISTRY_URL="localhost:5000"
docker build -t ${REGISTRY_URL}/sysbox/ubuntu-systemd-docker:noble .
docker push ${REGISTRY_URL}/sysbox/ubuntu-systemd-docker:noble

echo $'Docker image ubuntu-systemd-docker built!'
echo '****************************************************'

REGISTRY_URL=$REGISTRY_URL docker compose -f docker-compose.yaml up -d

echo '****************************************************'
echo $'You can create containers inside this Virtual Host now!'
echo '****************************************************'
```

## Remove container
```bash
docker compose -f docker-compose.yaml down --volumes --remove-orphans
```