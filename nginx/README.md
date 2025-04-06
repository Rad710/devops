# SonarQube and Postgress
SonarQube and Postgress must be in the same network for the connection to work. Then using the container name we create the connection to postgress: 
 - jdbc:postgresql://sonarqube-postgres-db:5432/sonar

## Images:
- sonarqube:10.7.0-community
- postgres:15.10

## Note:
- Set [prerequisites](https://docs.sonarsource.com/sonarqube/latest/requirements/prerequisites-and-overview/) needed to run container: 


## Containers:
#### SonarQube Server at localhost:9000
 - Initial credentials: 
   - User: admin 
   - Password: admin
 - Login and create a Project according to the Programing Language used in your Project


## Init containers:
```bash
export REGISTRY_URL="localhost:5000"
REGISTRY_URL=$REGISTRY_URL docker compose -f docker-compose.yaml up -d

echo 'Nginx reverse proxy server up and running!'
```

## Remove container
```bash
docker compose -f docker-compose.yaml down --volumes --remove-orphans
```