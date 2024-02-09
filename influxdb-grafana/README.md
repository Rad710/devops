# InfluxDBv1.8 & Grafana

## Images:
- influxdb:1.8
- grafana/grafana:10.3.1

## Scripts:
influxdb-grafana-up.sh:
- docker compose build
- docker compose up -d --no-build
- docker compose push


influxdb-grafana-down.sh:
- docker compose down

After this, create the Jenkins Database with:
- docker exec -t influxdb influx -execute 'create database jenkins

## Containers:
#### InfluxDBv1.8 at localhost:8086
To conect to it you need the influxdb plugin in Jenkins, and setup to v1.8
#### Grafana at localhost:3000
To connect Grafana to InfluxDB simply create a connection and select InfluxQL