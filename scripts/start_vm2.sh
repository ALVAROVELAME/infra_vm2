#!/bin/bash
echo '🚀 Iniciando infra VM2 (Modo Moderno)...'

# A versão sem hífen é mais estável e lê o .env automaticamente se estiver na raiz
docker compose --env-file .env -f mariadb/docker-compose.yml up -d
docker compose --env-file .env -f mongodb/docker-compose.yml up -d
docker compose --env-file .env -f wordpress/docker-compose.yml up -d
docker compose --env-file .env -f nginx/docker-compose.yml up -d

echo '✅ Tudo online e configurado!'

