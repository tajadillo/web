#!/usr/bin/env bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config.sh"

next_id() {
  local archivo="$1"
  local ultimo
  ultimo=$(tail -1 "$archivo" 2>/dev/null | cut -d"$SEP" -f1)
  if [ -z "$ultimo" ] || [ "$ultimo" = "id" ]; then
    echo 1
  else
    echo $((ultimo + 1))
  fi
}

render_csv() {
  local texto="$1"
  echo "${DELIM}${texto//${DELIM}/\\${DELIM}}${DELIM}"
}

articulo() {
  local id
  id=$(next_id "$ARTICULOS")
  echo "${id},$(render_csv "$1"),$2,$(render_csv "$3"),$4,$5,$6,$7,$8,$(render_csv "$9")" >> "$ARTICULOS"
  echo -e "${greenColour}Artículo #$id creado.${endColour}"
}

categoria() {
  local id
  id=$(next_id "$CATEGORIAS")
  echo "${id},$(render_csv "$1"),$(render_csv "$2")" >> "$CATEGORIAS"
  echo -e "${greenColour}Categoría #$id creada.${endColour}"
}

proveedor() {
  local id
  id=$(next_id "$PROVEEDORES")
  echo "${id},$(render_csv "$1"),$(render_csv "$2"),$(render_csv "$3"),$(render_csv "$4")" >> "$PROVEEDORES"
  echo -e "${greenColour}Proveedor #$id creado.${endColour}"
}

movimiento() {
  local id
  id=$(next_id "$MOVIMIENTOS")
  echo "${id},$1,$2,$3,$4,$(render_csv "$5"),$(render_csv "$6")" >> "$MOVIMIENTOS"

  # Actualizar stock
  local archivo="$ARTICULOS"
  local art_id="$1"
  local cant="$3"
  if [ "$2" = "entrada" ]; then
    awk -F"$SEP" -v id="$art_id" -v cant="$cant" -v sep="$SEP" 'BEGIN{OFS=sep} $1==id{$9=$9+cant} 1' "$archivo" > "$archivo.tmp" && mv "$archivo.tmp" "$archivo"
  elif [ "$2" = "salida" ]; then
    awk -F"$SEP" -v id="$art_id" -v cant="$cant" -v sep="$SEP" 'BEGIN{OFS=sep} $1==id{$9=$9-cant; if($9<0)$9=0} 1' "$archivo" > "$archivo.tmp" && mv "$archivo.tmp" "$archivo"
  fi
  echo -e "${greenColour}Movimiento #$id registrado.${endColour}"
}

pedido() {
  local id
  id=$(next_id "$PEDIDOS")
  echo "${id},$1,$2,$3,$4,$5" >> "$PEDIDOS"
  echo -e "${greenColour}Pedido #$id creado.${endColour}"
}

case "$1" in
  articulo)
    shift
    articulo "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
    ;;
  categoria)
    shift
    categoria "$1" "$2"
    ;;
  proveedor)
    shift
    proveedor "$1" "$2" "$3" "$4"
    ;;
  movimiento|mov)
    shift
    movimiento "$1" "$2" "$3" "$4" "$5" "$6"
    ;;
  pedido)
    shift
    pedido "$1" "$2" "$3" "$4" "$5"
    ;;
  *)
    echo -e "${yellowColour}Uso: $0 {articulo|categoria|proveedor|movimiento|pedido} [datos...]${endColour}"
    echo ""
    echo "Ejemplos:"
    echo "  $0 articulo 'Tutú infantil' 1 'Tutú de tul talla 2' 1 5000 15000 5 12 'Estante A-3'"
    echo "  $0 categoria 'Vestuario' 'Ropa y accesorios de danza'"
    echo "  $0 proveedor 'Dancewear SRL' 'Carlos' '11-5555-6666' 'carlos@dancewear.com'"
    echo "  $0 movimiento 1 entrada 20 2025-04-10 'Reposición' 'Admin'"
    echo "  $0 pedido 1 2025-04-01 2025-04-10 recibido 150000"
    ;;
esac
