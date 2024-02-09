# devops
DevOps Setup for localhost

### Using Docker and Docker-in-Docker for Jenkins (using sysbox):
The Jenkins Master runs inside an isolated Jenkinx-box (sysbox) with a separated Docker Daemon. Then, the Jenkins Master container (inside the sysbox) is simply binded with the unix socket to the docker daemon of the sysbox: /var/run/docker.sock

Now, the Jenkins is completely isolated from the host machine.

The network is set to the host (network_mode: "host"). Because, all other containers only exists in the local network (SonarQube, Docker Registry, InfluxDB), therefore to simplify access I use --network-host. This can be removed.

Docker Engine + Docker Registry + Docker Registry UI
Jenkins Master + Docker Cloud Agents
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