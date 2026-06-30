#!/usr/bin/env bash
source "$(cd "$(dirname "$0")/.." && pwd)/config.sh"

fecha=$(date +%F)
archivo="backup-$fecha.tar.gz"

echo -e "${blueColour}=== Respaldando inventario ===${endColour}"
tar -czf "$BACKUP_DIR/$archivo" -C "$DB_DIR" .
echo -e "${greenColour}Creado:${endColour} $BACKUP_DIR/$archivo"
echo -e "${greenColour}Tamaño:${endColour} $(du -h "$BACKUP_DIR/$archivo" | cut -f1)"

find "$BACKUP_DIR" -name "backup-*.tar.gz" -mtime +30 -delete 2>/dev/null
echo -e "${grayColour}Respaldos antiguos (>30 días) eliminados.${endColour}"
