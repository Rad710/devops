# devops
DevOps Setup for localhost

### Using Docker for Jenkins (using sysbox):
The Jenkins Box runs as an isolated Docker Daemon inside the sysbox. Then, the Jenkins Master container simply connects over TCP to the Docker Daemon (of the sysbox) using the tcp socket: tcp://jenkins-box:2375. Therefore, Docker Cloud agents must be used as Agents.

Now, the Jenkins is completely isolated from the host machine while also running as a container in the host machine itself.

For the Docker Cloud Agents, the network is set to the host (network_mode: "host"). Because, all other containers only exist in the local network (SonarQube, Docker Registry, InfluxDB), therefore to simplify access I use --network-host. This can be removed.

Docker Engine + Docker Registry + Docker Registry UI
Jenkins Master + Docker Cloud Agents
SonarQube Server + Postgress
InfluxDB + Grafana

TODO: 
- Give example of Jenkins Pipelines
- Using TCP with Certs

TO RUN:
First install docker using the script inside docker folder. 
To startup all containers run the script devops-up.sh
To delete all containers run devops-down.sh


## Scripts:

devops-up.sh:
- docker network create devops (used by all docker compose files)
- docker network create jenkins
- Creates .env file for each folder
- Runs each ${folder}-up.sh file to start respective docker compose up
- docker exec -t influxdb influx -execute 'create database jenkins'

devops-down.sh:
- docker compose down
- Removes all .env files
- docker network rm devops
- docker network rm jenkins