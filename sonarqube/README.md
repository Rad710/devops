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
echo '****************************************************'
echo 'Sonarqube Server requirements...'
sudo su <<EOF
    sysctl -w vm.max_map_count=524288
    sysctl -w fs.file-max=131072
    ulimit -n 131072
    ulimit -u 8192
EOF
echo '****************************************************'

export SONAR_JDBC_PASSWORD="your_password"
# Run docker-compose and pass the SONAR_JDBC_PASSWORD as an environment variable
SONAR_JDBC_PASSWORD=$SONAR_JDBC_PASSWORD docker compose -f docker-compose.yaml up -d

echo 'Sonarqube Server up and running!'
echo '****************************************************'

echo ''
echo '****************************************************'
echo 'Sonarqube Server: http://localhost:9000/'
echo 'Starting credentials: admin:admin'
echo '****************************************************'
```

## Remove container
```bash
docker compose -f docker-compose.yaml down --volumes --remove-orphans
```