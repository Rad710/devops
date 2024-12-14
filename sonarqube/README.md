# SonarQube and Postgress
SonarQube and Postgress must be in the same network for the connection to work. The using the container name we create the connection to postgress: 
 - jdbc:postgresql://sonarqube-postgres-db:5432/sonar

## Images:
- sonarqube:community
- postgres:15

## Note:
- Set prerequisites needed to run container: https://docs.sonarsource.com/sonarqube/latest/requirements/prerequisites-and-overview/


## Scripts:
sonarqube_up.sh:
- Initialize docker containers (sonarqube and postgres)


sonarqube_down_remove.sh:
- Removes docker containers, removes created volumes, networks

## Containers:
#### SonarQube Server at localhost:9000
 - Initial credentials: 
   - User: admin 
   - Password: admin
 - Login and create a Project according to the Programing Language used in your Project