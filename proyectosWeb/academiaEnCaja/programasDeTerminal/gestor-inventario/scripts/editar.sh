#!/usr/bin/env bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config.sh"

editar_registro() {
  local archivo="$1"
  local id="$2"
  shift 2
  local editables=("$@")

  if [ ! -f "$archivo" ]; then
    echo -e "${redColour}Error: la tabla no existe.${endColour}"
    return 1
  fi

  local linea
  linea=$(grep "^${id}${SEP}" "$archivo")
  if [ -z "$linea" ]; then
    echo -e "${redColour}Error: no se encontró registro con id=$id.${endColour}"
    return 1
  fi

  IFS="$SEP" read -ra valores <<< "$linea"
  local cabecera
  cabecera=$(head -1 "$archivo")
  IFS="$SEP" read -ra cols <<< "$cabecera"

  echo -e "${blueColour}=== Editando registro #$id ===${endColour}"
  echo ""

  local nuevos=("${valores[0]}")
  local idx_col=1
  while [ $idx_col -lt ${#cols[@]} ]; do
    local nombre_col="${cols[$idx_col]}"
    local actual="${valores[$idx_col]}"
    actual="${actual//${DELIM}/}"

    local editable=0
    for e in "${editables[@]}"; do
      if [ "$e" = "$nombre_col" ]; then
        editable=1
        break
      fi
    done

    if [ $editable -eq 1 ]; then
      printf "  %s [%s]: " "$nombre_col" "$actual"
      read -r entrada
      if [ -z "$entrada" ]; then
        nuevos+=("${valores[$idx_col]}")
      else
        nuevos+=("${DELIM}${entrada}${DELIM}")
      fi
    else
      nuevos+=("${valores[$idx_col]}")
    fi
    idx_col=$((idx_col + 1))
  done

  local nueva_linea=""
  for v in "${nuevos[@]}"; do
    if [ -z "$nueva_linea" ]; then
      nueva_linea="$v"
    else
      nueva_linea="${nueva_linea}${SEP}${v}"
    fi
  done

  awk -v id="$id" -v sep="$SEP" -v new="$nueva_linea" \
    'BEGIN{FS=sep;OFS=sep} $1==id{print new; next} 1' "$archivo" > "$archivo.tmp" && mv "$archivo.tmp" "$archivo"

  echo -e "${greenColour}Registro #$id actualizado.${endColour}"
}

case "$1" in
  articulo)
    shift
    id="$1"
    [ -z "$id" ] && read -p "ID del artículo: " id
    editar_registro "$ARTICULOS" "$id" "nombre" "categoria_id" "descripcion" "proveedor_id" "precio_compra" "precio_venta" "stock_minimo" "stock_actual" "ubicacion"
    ;;
  categoria)
    shift
    id="$1"
    [ -z "$id" ] && read -p "ID de la categoría: " id
    editar_registro "$CATEGORIAS" "$id" "nombre" "descripcion"
    ;;
  proveedor)
    shift
    id="$1"
    [ -z "$id" ] && read -p "ID del proveedor: " id
    editar_registro "$PROVEEDORES" "$id" "nombre" "contacto" "telefono" "email"
    ;;
  *)
    echo -e "${yellowColour}Uso: $0 {articulo [id]|categoria [id]|proveedor [id]}${endColour}"
    ;;
esac
