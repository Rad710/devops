# SonarQube and Postgress

## Images:
- sonarqube:community
- postgres:15

## Scripts:
sonarqube-requirements.sh:
- Set prerequisites needed to run container: https://docs.sonarsource.com/sonarqube/latest/requirements/prerequisites-and-overview/

sonarqube-up.sh:
- docker compose build
- docker compose up -d --no-build
- docker compose push


sonarqube-down.sh:
- docker compose down

## Containers:
#### SonarQube Server at localhost:9000