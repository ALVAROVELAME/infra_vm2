# 🔄 Reset VM2 completo
Write-Output 'Resetando containers e volumes VM2...'

docker-compose -f nginx\docker-compose.yml down -v
docker-compose -f wordpress\docker-compose.yml down -v
docker-compose -f mariadb\docker-compose.yml down -v
docker-compose -f mongodb\docker-compose.yml down -v

Write-Output '✅ Reset completo!'