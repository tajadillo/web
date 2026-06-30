#!/usr/bin/env bash
source "$(cd "$(dirname "$0")/.." && pwd)/config.sh"

fecha=$(date +%F)
archivo="backup-$fecha.tar.gz"

echo "=== Respaldando base de datos ==="
tar -czf "$BACKUP_DIR/$archivo" -C "$DB_DIR" .
echo "Creado: $BACKUP_DIR/$archivo"
echo "Tamaño: $(du -h "$BACKUP_DIR/$archivo" | cut -f1)"

# Limpiar respaldos más viejos de 30 días
find "$BACKUP_DIR" -name "backup-*.tar.gz" -mtime +30 -delete 2>/dev/null
echo "Respaldos antiguos (>30 días) eliminados."
