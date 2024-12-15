# InfluxDBv1.8 & Grafana

## Images:
- influxdb:1.8
- grafana/grafana:10.3.1

## Scripts:
influxdb_grafana_up.sh:
- Initializes docker containers for InfluxDB, Grafana


influxdb_grafana_down.sh:
- Remove all containers and volumes

After this, create the Jenkins Database with:
- docker exec -t influxdb influx -execute 'create database jenkins

## Containers:
#### InfluxDBv1.8 at localhost:8086
- To conect to it you need the influxdb plugin in Jenkins, and setup to v1.8
#### Grafana at localhost:3000
- To connect Grafana to InfluxDB simply create a connection and select InfluxQL
- Create a dashboard in Grafana, may use this as [reference](https://www.enmilocalfunciona.io/mostrando-resultados-de-jenkins-en-grafana-mediante-influxdb/)