# devops
DevOps Setup for localhost
Using Docker and Docker-outside-of-Docker (using unix sock):

Docker Engine + Docker Registry + Docker Registry UI
Jenkins Master + SSH Agent + Docker Cloud Agents
SonarQube Server + Postgress
InfluxDB + Grafana

TODO: 
- Give example of Jenkins Pipelines

TO RUN:
First install docker using the script inside docker folder. 
To startup all containers run the script devops-up.sh
To delete all containers run devops-down.sh


## Scripts:

devops-up.sh:
- docker network create devops (used by all docker compose files)
- Creates .env file for each folder
- Runs each ${folder}-up.sh file to start respective docker compose up
- docker exec -t influxdb influx -execute 'create database jenkins'

devops-down.sh:
- docker compose down
- Removes all .env files
- docker network rm devops