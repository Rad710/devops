# devops
DevOps Setup for localhost

Using [Sysbox Solution](https://github.com/nestybox/sysbox/blob/master/docs/user-guide/dind.md)

### Using Docker for Jenkins (using sysbox):
The Jenkins Box runs as an isolated Docker Daemon inside the sysbox. Then, the Jenkins Master container is created inside the Sysbox container and the docker unix sock is mounted as a volume to the container. 

Using a DooD approach inside an isolated container the Jenkins is completely isolated from the host machine while also running as a container in the host machine itself.

```
Also, since this setup uses everything in the local machine using http. The docker registry must be configured to be insecure. Read more in the sysbox/README.md file

For the Jenkins Master and Docker Cloud Agents, the network is set to the host (network_mode: "host"). Because, all other containers only exist in the local network (SonarQube, Docker Registry, InfluxDB), therefore to simplify access I use --network-host. This can be removed.
```

Docker Engine + Docker Registry + Docker Registry UI
Jenkins Master + Docker Cloud Agents
SonarQube Server + Postgress
InfluxDB + Grafana

TODO: 
- Give example of Jenkins Pipelines


## Guide:

devops_up.sh:
- Runs all up scripts and starts all docker containers. Or you may start all containers individially by creating the docker networks and running the scripts in the following order 
  - **sysbox -> sonarqube -> influxdb_grafana*. Then ssh into sysbox container and start the jenkins container*
- You can check them as well as well as the respective folders to see how the setup works more in detail.

devops_down.sh:
- Runs all down scripts and removes all docker containers, volumes, networks, etc.