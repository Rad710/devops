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


sysbox_up.sh:
- Initializes a Sysbox Virtual Host container with a Docker Daemon installed inside it.


sysbox_down.sh:
- Removes the Sysbox Virtual Host container, volume, image, etc. Note that this results in the loss of all data inside the container and the inner containers.

## Containers:
#### Jenkins-box
This contains a Docker Daemon Host. You can ssh into it using (or configure a different port):
- ssh admin@localhost -p 20
- Initial credentials are "admin:admin"