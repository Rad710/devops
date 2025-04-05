
# Docker Registry and Docker Registry UI

## Images:
- registry:2
- joxit/docker-registry-ui:main


## Init containers:
```bash
export REGISTRY_URL=(ex. http://localhost:5000)
REGISTRY_URL=$REGISTRY_URL docker compose -f docker-compose.yaml up -d

echo '****************************************************'
echo "Docker Registry Server: ${REGISTRY_URL}"
echo "Docker Registry server UI: ${REGISTRY_URL} (use another port. 80)"
echo '****************************************************'
```

## Remove container
```bash
docker compose -f docker-compose.yaml down --volumes --remove-orphans
```