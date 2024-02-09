# SonarQube and Postgress
This runs an isolated instance of Ubuntu Jammy with an isolated Docker Daemon and a Jenkins Master container inside. The Jenkins Master container (inside the sysbox) is simply binded with the unix socket to the docker daemon of the sysbox: /var/run/docker.sock

## Images:
- ubuntu:22.04

## Scripts:
sysbox-up.sh:
- docker compose build
- docker compose up -d --no-build
- docker compose push


sysbox-down.sh:
- docker compose down

## Containers:
#### Jenkins-box
This contains a Docker Daemon Host. You can ssh into it using:
- ssh admin@localhost -p 20
- Initial credentials are "admin:admin"