# InfluxDBv1.8 & Grafana

## Images:
- influxdb:1.8
- grafana/grafana:11.4.0

## Containers:
#### InfluxDBv1.8 at localhost:8086
- To conect to it you need the influxdb plugin in Jenkins, and setup to v1.8
#### Grafana at localhost:3000
- To connect Grafana to InfluxDB simply create a connection and select InfluxQL
- Create a dashboard in Grafana, may use this as [reference](https://www.enmilocalfunciona.io/mostrando-resultados-de-jenkins-en-grafana-mediante-influxdb/)


## Init containers:
```bash
docker compose -f docker-compose.yaml up -d

echo '****************************************************'
echo $'InfluxDB Server: http://localhost:8086/'
echo $'Grafana server UI: http://localhost:3000/'
echo '****************************************************'

echo ''
echo '****************************************************'
echo $'Please create database jenkins InfluxDB Container with: '
echo " - docker exec -t influxdb influx -execute 'create database jenkins'"
echo '****************************************************'
```

## Remove container
```bash
docker compose -f docker-compose.yaml down --volumes --remove-orphans
```