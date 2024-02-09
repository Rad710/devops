# SonarQube and Postgress
This runs an isolated instance of Ubuntu Jammy with an isolated Docker Daemon. To connect to the Docker Daemon you can use SSH or TCP.
To connect Jenkins Docker Cloud over TCP use: tcp://jenkins-box:2375

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