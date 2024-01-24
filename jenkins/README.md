# Jenkins

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
#### Jenkins SSH Agent at localhost:23