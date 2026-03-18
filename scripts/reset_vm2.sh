#!/bin/bash
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "🧹 Resetando módulos e volumes VM2..."
for dir in "$ROOT_DIR"/*/ ; do
    if [ -f "$dir/docker-compose.yml" ]; then
        echo "🗑️ Removendo: $(basename "$dir")"
        docker-compose -f "$dir/docker-compose.yml" --env-file "$ROOT_DIR/.env" down -v
    fi
done
echo "✅ Reset modular completo!"
