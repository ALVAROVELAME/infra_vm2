#!/bin/bash
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "🚀 Iniciando módulos da VM2 (Forçando variáveis .env)..."

# --- MÁGICA AQUI: Carrega o .env da raiz para a memória do script ---
if [ -f "$ROOT_DIR/.env" ]; then
    export $(grep -v '^#' "$ROOT_DIR/.env" | xargs)
    echo "✅ Variáveis de ambiente carregadas do .env raiz."
fi

for dir in "$ROOT_DIR"/*/ ; do
    if [ -f "$dir/docker-compose.yml" ]; then
        MODULE=$(basename "$dir")
        echo "📦 Iniciando módulo: $MODULE"
        
        # Roda o docker-compose usando as variáveis que já estão na memória (exportadas)
        docker-compose -f "$dir/docker-compose.yml" up -d
    fi
done
echo "✅ Todos os módulos iniciados com sucesso!"
