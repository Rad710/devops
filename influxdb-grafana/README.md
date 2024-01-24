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

## Containers:
#### InfluxDBv1.8 at localhost:8086
#### Grafana at localhost:3000