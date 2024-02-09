# Jenkins
Using Docker-outside-of-Docker. The Jenkins Master container is simply binded with the unix socket to the docker daemon of the host machine: /var/run/docker.sock"

The Jenkins SSH Agent uses the public key located at: ~/.ssh/jenkins_agent_key.pub

## Images:
- jenkins/jenkins:jdk17
- jenkins/ssh-agent:jdk11
- jenkins/agent:jdk17 (delete after compose up)
- jenkins/inbound-agent:jdk17

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