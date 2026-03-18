#!/bin/bash
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "🛑 Parando módulos da VM2..."
for dir in "$ROOT_DIR"/*/ ; do
    if [ -f "$dir/docker-compose.yml" ]; then
        echo "⏸️ Parando: $(basename "$dir")"
        docker-compose -f "$dir/docker-compose.yml" --env-file "$ROOT_DIR/.env" stop
    fi
done
echo "✅ Módulos parados."
