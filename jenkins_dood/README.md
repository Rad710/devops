# Jenkins
The Jenkins Box runs as an isolated Docker Daemon inside the sysbox. Then, the Jenkins Master container is simply connects over TCP to the Docker Daemon (of the sysbox) using the tcp socket: tcp://jenkins-box:2375. Therefore, Docker Cloud agents must be used as Agents.

Now, the Jenkins is completely isolated from the host machine while also running in a container in the host machine itself.

For the Docker Cloud Agents, the network is set to the host (network_mode: "host"). Because, all other containers only exists in the local network (SonarQube, Docker Registry, InfluxDB), therefore to simplify access I use --network-host. This can be removed.


## Images:
- jenkins/jenkins:jdk21
- jenkins/agent:jdk21 (delete after compose up)

## Containers:
#### Jenkins Master at localhost:8080
To start: login using the credentials (docker logs jenkins-master). Download recommended plugins. Then, also download the plugins:
- Blue Ocean
- InfluxDB
- SonarScanner
- Docker Cloud plugin
#### Jenkins SSH Agent at localhost:23


## Init containers:
```bash
export REGISTRY_URL=localhost:5000
export GROUP_ADD_ID=$(stat -c '%g' /var/run/docker.sock)

echo '****************************************************'
echo $'Building jenkins/master image...'

docker build -t ${REGISTRY_URL}/jenkins/master:jdk21 -f master/Dockerfile.master .
docker push ${REGISTRY_URL}/jenkins/master:jdk21

echo $'Docker image jenkins/master built!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo $'Building jenkins/agent-cloud image...'

docker build -t ${REGISTRY_URL}/jenkins/agent-cloud:jdk21 -f agents/Dockerfile.agent.cloud .
docker push ${REGISTRY_URL}/jenkins/agent-cloud:jdk21

echo $'Docker image jenkins/agent-cloud built!'
echo '****************************************************'


echo ''
echo '****************************************************'
echo 'Jenkins Server init...'

REGISTRY_URL=$REGISTRY_URL GROUP_ADD_ID=$GROUP_ADD_ID docker compose -f docker-compose.yaml up -d

echo 'Jenkins Server up and running!'
echo '****************************************************'


echo ''
echo '****************************************************'
echo $'Jenkins Server: http://localhost:8080/'
echo $'For staring credentials: docker logs jenkins-master'
echo '****************************************************'
```

## Remove container
```bash
docker compose -f docker-compose.yaml down --volumes --remove-orphans
```