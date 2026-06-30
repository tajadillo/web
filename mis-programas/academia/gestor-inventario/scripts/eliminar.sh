#!/usr/bin/env bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config.sh"

resolver_archivo() {
  local nombre="$1"
  case "$nombre" in
    articulos|articulo)    echo "$ARTICULOS" ;;
    categorias|categoria)  echo "$CATEGORIAS" ;;
    proveedores|proveedor) echo "$PROVEEDORES" ;;
    movimientos|movimiento) echo "$MOVIMIENTOS" ;;
    pedidos|pedido)        echo "$PEDIDOS" ;;
    *)                     echo "$DB_DIR/${nombre}.csv" ;;
  esac
}

eliminar_registro() {
  local archivo="$1"
  local tabla="$2"
  local id="$3"

  if [ ! -f "$archivo" ]; then
    echo -e "${redColour}Error: la tabla $tabla no existe.${endColour}"
    return 1
  fi

  if ! grep -q "^${id}${SEP}" "$archivo"; then
    echo -e "${redColour}Error: no se encontró $tabla con id=$id.${endColour}"
    return 1
  fi

  echo -e "${yellowColour}Registro a eliminar:${endColour}"
  grep "^${id}${SEP}" "$archivo" | column -t -s"$SEP" -o" │ "
  read -p "¿Confirmar eliminación? (s/N): " conf
  if [ "$conf" != "s" ] && [ "$conf" != "S" ]; then
    echo -e "${turquoiseColour}Cancelado.${endColour}"
    return
  fi

  grep -v "^${id}${SEP}" "$archivo" > "$archivo.tmp" && mv "$archivo.tmp" "$archivo"
  echo -e "${greenColour}$tabla #$id eliminado.${endColour}"
}

eliminar_tabla() {
  local archivo="$1"
  local tabla="$2"

  if [ ! -f "$archivo" ]; then
    echo -e "${redColour}Error: la tabla $tabla no existe.${endColour}"
    return 1
  fi

  echo -e "${redColour}¿Eliminar TODA la tabla $tabla (se pierden todos los datos)?${endColour}"
  read -p "(s/N): " conf
  if [ "$conf" != "s" ] && [ "$conf" != "S" ]; then
    echo -e "${turquoiseColour}Cancelado.${endColour}"
    return
  fi

  local cabecera
  cabecera=$(head -1 "$archivo")
  echo "$cabecera" > "$archivo"
  echo -e "${yellowColour}Tabla $tabla vaciada (solo queda la cabecera).${endColour}"
}

case "$1" in
  registro)
    shift
    tabla="$1"
    id="$2"
    [ -z "$tabla" ] && read -p "Tabla: " tabla
    [ -z "$id" ] && read -p "ID del registro: " id
    archivo=$(resolver_archivo "$tabla")
    eliminar_registro "$archivo" "$tabla" "$id"
    ;;
  tabla)
    shift
    tabla="$1"
    [ -z "$tabla" ] && read -p "Tabla: " tabla
    archivo=$(resolver_archivo "$tabla")
    eliminar_tabla "$archivo" "$tabla"
    ;;
  todo)
    echo -e "${redColour}¡ATENCIÓN! Se eliminarán TODAS las tablas.${endColour}"
    read -p "Escribí 'BORRAR' para confirmar: " conf
    if [ "$conf" != "BORRAR" ]; then
      echo -e "${turquoiseColour}Cancelado.${endColour}"
      exit 1
    fi
    rm -f "$ARTICULOS" "$CATEGORIAS" "$PROVEEDORES" "$MOVIMIENTOS" "$PEDIDOS"
    rm -f "$BACKUP_DIR"/*.tar.gz 2>/dev/null
    echo -e "${redColour}Base de datos eliminada por completo.${endColour}"
    ;;
  *)
    echo -e "${yellowColour}Uso: $0 {registro|tabla|todo}${endColour}"
    echo ""
    echo "Ejemplos:"
    echo "  $0 registro articulos 3"
    echo "  $0 tabla movimientos"
    echo "  $0 todo"
    ;;
esac
