#!/bin/bash   
#Sonarqube requirements: 
# https://docs.sonarsource.com/sonarqube/latest/requirements/prerequisites-and-overview/

sudo su <<EOF
sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
EOF