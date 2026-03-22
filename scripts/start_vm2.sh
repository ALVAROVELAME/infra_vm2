#!/bin/bash
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "🚀 Iniciando módulos da VM2 (Versão Docker Compose V2)..."

# --- MÁGICA: Carrega o .env da raiz para a memória ---
if [ -f "$ROOT_DIR/.env" ]; then
    export $(grep -v '^#' "$ROOT_DIR/.env" | xargs)
    echo "✅ Variáveis de ambiente carregadas do .env raiz."
else
    echo "⚠️ Aviso: Arquivo .env não encontrado em $ROOT_DIR"
fi

# Percorre as pastas dos módulos
for dir in "$ROOT_DIR"/*/ ; do
    if [ -f "$dir/docker-compose.yml" ]; then
        MODULE=$(basename "$dir")
        echo "📦 Iniciando módulo: $MODULE"
        
        # MUDANÇA AQUI: Agora usamos 'docker compose' (sem o hífen)
        docker compose -f "$dir/docker-compose.yml" up -d
    fi
done

echo "✅ Todos os módulos processados!"