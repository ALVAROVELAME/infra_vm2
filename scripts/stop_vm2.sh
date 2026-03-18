#!/bin/bash
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "🛑 Parando módulos da VM2 de forma organizada..."

# Percorre as pastas de trás para frente (opcional, mas bom para dependências)
for dir in "$ROOT_DIR"/*/ ; do
    if [ -f "$dir/docker-compose.yml" ]; then
        MODULE=$(basename "$dir")
        echo "⏳ Parando: $MODULE"
        docker-compose -f "$dir/docker-compose.yml" stop
    fi
done

echo "✅ Todos os módulos foram pausados com sucesso!"
