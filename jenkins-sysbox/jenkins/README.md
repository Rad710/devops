# Jenkins
The Jenkins Master runs inside an isolated Jenkinx-box (sysbox) with a separated Docker Daemon. Then, the Jenkins Master container (inside the sysbox) is simply binded with the unix socket to the docker daemon of the sysbox: /var/run/docker.sock

Now, the Jenkins is completely isolated from the host machine.

The network is set to the host (network_mode: "host"). Because, all other containers only exists in the local network (SonarQube, Docker Registry, InfluxDB), therefore to simplify access I use --network-host. This can be removed.

## Images:
- jenkins/jenkins:jdk17
- jenkins/agent:jdk17 (delete after compose up)

## Scripts:
jenkins-up.sh:
- docker compose build
- docker compose up -d --no-build
- docker compose push


jenkins-down.sh:
- docker compose down

## Containers:
#### Jenkins Master at localhost:8080
To start: login using the credentials (docker logs jenkins-master). Download recommended plugins. Then, also download the plugins:
- Blue Ocean
- InfluxDB
- SonarScanner
- Docker Cloud plugin
#### Jenkins SSH Agent at localhost:23