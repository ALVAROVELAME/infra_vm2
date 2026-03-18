#!/bin/bash
# ⏹ Stop VM2 completo (Linux corrigido)
echo 'Parando containers VM2...'

docker-compose -f nginx/docker-compose.yml down
docker-compose -f wordpress/docker-compose.yml down
docker-compose -f mariadb/docker-compose.yml down
docker-compose -f mongodb/docker-compose.yml down

echo '✅ Todos os containers parados!'
