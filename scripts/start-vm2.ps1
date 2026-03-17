# 🚀 Start VM2 completo
Write-Output 'Iniciando containers VM2...'

docker-compose -f mariadb\docker-compose.yml up -d
docker-compose -f mongodb\docker-compose.yml up -d
docker-compose -f wordpress\docker-compose.yml up -d
docker-compose -f nginx\docker-compose.yml up -d

Write-Output '✅ Todos os containers ativos!'