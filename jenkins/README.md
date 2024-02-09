# Jenkins
The Jenkins Box runs as an isolated Docker Daemon inside the sysbox. Then, the Jenkins Master container is simply connects over TCP to the Docker Daemon (of the sysbox) using the tcp socket: tcp://jenkins-box:2375. Therefore, Docker Cloud agents must be used as Agents.

Now, the Jenkins is completely isolated from the host machine while also running in a container in the host machine itself.

For the Docker Cloud Agents, the network is set to the host (network_mode: "host"). Because, all other containers only exists in the local network (SonarQube, Docker Registry, InfluxDB), therefore to simplify access I use --network-host. This can be removed.


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