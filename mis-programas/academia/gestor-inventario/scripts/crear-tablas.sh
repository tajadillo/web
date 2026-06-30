#!/usr/bin/env bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config.sh"

crear_tabla() {
  local archivo="$1"
  local cabecera="$2"
  if [ ! -f "$archivo" ]; then
    echo "$cabecera" > "$archivo"
    echo -e "${greenColour}  Creada:${endColour} $(basename "$archivo")"
  else
    echo -e "${yellowColour}  Ya existe:${endColour} $(basename "$archivo")"
  fi
}

echo -e "${blueColour}=== Creando tablas ===${endColour}"

crear_tabla "$ARTICULOS"   "id,nombre,categoria_id,descripcion,proveedor_id,precio_compra,precio_venta,stock_minimo,stock_actual,ubicacion"
crear_tabla "$CATEGORIAS"  "id,nombre,descripcion"
crear_tabla "$PROVEEDORES" "id,nombre,contacto,telefono,email"
crear_tabla "$MOVIMIENTOS" "id,articulo_id,tipo,cantidad,fecha,motivo,usuario"
crear_tabla "$PEDIDOS"     "id,proveedor_id,fecha_pedido,fecha_recibido,estado,total"

echo -e "${greenColour}=== Listo ===${endColour}"
ls -1 "$DB_DIR"/*.csv 2>/dev/null
