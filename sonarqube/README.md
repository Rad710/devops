# SonarQube and Postgress
SonarQube and Postgress must be in the same network for the connection to work. The using the container name we create the connection to postgress: jdbc:postgresql://postgres-db:5432/sonar

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
Login and create a Project according to the Programing Language used in your Project
