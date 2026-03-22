#!/bin/bash
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "🧹 Resetando módulos e volumes VM2 (Versão Docker Compose V2)..."

# Percorre as pastas dos módulos
for dir in "$ROOT_DIR"/*/ ; do
    if [ -f "$dir/docker-compose.yml" ]; then
        MODULE=$(basename "$dir")
        echo "🗑️ Removendo: $MODULE"
        
        # MUDANÇA: 'docker compose' e usamos o --env-file para garantir que ele saiba o que apagar
        if [ -f "$ROOT_DIR/.env" ]; then
            docker compose -f "$dir/docker-compose.yml" --env-file "$ROOT_DIR/.env" down -v
        else
            docker compose -f "$dir/docker-compose.yml" down -v
        fi
    fi
done

echo "✅ Reset modular completo! Sistema limpo."