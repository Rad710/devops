# SonarQube and Postgress
SonarQube and Postgress must be in the same network for the connection to work. Then using the container name we create the connection to postgress: 
 - jdbc:postgresql://sonarqube-postgres-db:5432/sonar

## Images:
- sonarqube:10.7.0-community
- postgres:15.10

## Note:
- Set [prerequisites](https://docs.sonarsource.com/sonarqube/latest/requirements/prerequisites-and-overview/) needed to run container: 


## Scripts:
sonarqube_up.sh:
- Initialize docker containers (sonarqube and postgres). Parameters
  - sonar_jdbc_password: password for sonar-postgres container


sonarqube_down_remove.sh:
- Removes docker containers, removes created volumes, networks

## Containers:
#### SonarQube Server at localhost:9000
 - Initial credentials: 
   - User: admin 
   - Password: admin
 - Login and create a Project according to the Programing Language used in your Project