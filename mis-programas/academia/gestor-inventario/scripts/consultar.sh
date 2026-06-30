#!/usr/bin/env bash
source "$(cd "$(dirname "$0")/.." && pwd)/config.sh"

mostrar_tabla() {
  local archivo="$1"
  if [ ! -f "$archivo" ]; then
    echo -e "${redColour}Tabla no encontrada: $archivo${endColour}"
    return
  fi
  local header
  header=$(head -1 "$archivo" | column -t -s"$SEP" -o" │ " 2>/dev/null)
  echo -e "${blueColour}${header}${endColour}"
  tail -n +2 "$archivo" | column -t -s"$SEP" -o" │ " 2>/dev/null
}

buscar() {
  local archivo="$1"
  local termino="$2"
  if [ ! -f "$archivo" ]; then
    echo -e "${redColour}Tabla no encontrada${endColour}"
    return
  fi
  local header
  header=$(head -1 "$archivo" | column -t -s"$SEP" -o" │ " 2>/dev/null)
  echo -e "${blueColour}${header}${endColour}"
  grep -i "$termino" "$archivo" | column -t -s"$SEP" -o" │ " 2>/dev/null
}

contar() {
  local archivo="$1"
  [ ! -f "$archivo" ] && echo "0" && return
  echo $(($(wc -l < "$archivo") - 1))
}

case "$1" in
  articulos|articulo)
    mostrar_tabla "$ARTICULOS"
    echo -e "${yellowColour}Total: $(contar "$ARTICULOS") artículos${endColour}"
    ;;
  categorias|categoria)
    mostrar_tabla "$CATEGORIAS"
    echo -e "${yellowColour}Total: $(contar "$CATEGORIAS") categorías${endColour}"
    ;;
  proveedores|proveedor)
    mostrar_tabla "$PROVEEDORES"
    echo -e "${yellowColour}Total: $(contar "$PROVEEDORES") proveedores${endColour}"
    ;;
  movimientos|movimiento)
    mostrar_tabla "$MOVIMIENTOS"
    echo -e "${yellowColour}Total: $(contar "$MOVIMIENTOS") movimientos${endColour}"
    ;;
  pedidos|pedido)
    mostrar_tabla "$PEDIDOS"
    echo -e "${yellowColour}Total: $(contar "$PEDIDOS") pedidos${endColour}"
    ;;
  buscar)
    shift
    [ -z "$1" ] && echo -e "${redColour}Uso: $0 buscar <tabla> <termino>${endColour}" && exit 1
    local tabla="$1"; shift
    local archivo=""
    case "$tabla" in
      articulos|articulo)    archivo="$ARTICULOS" ;;
      categorias|categoria)  archivo="$CATEGORIAS" ;;
      proveedores|proveedor) archivo="$PROVEEDORES" ;;
      movimientos|movimiento) archivo="$MOVIMIENTOS" ;;
      pedidos|pedido)        archivo="$PEDIDOS" ;;
      *)                     archivo="$DB_DIR/${tabla}.csv" ;;
    esac
    buscar "$archivo" "$1"
    ;;
  stock_bajo)
    echo -e "${redColour}=== ARTÍCULOS CON STOCK BAJO ===${endColour}"
    echo ""
    awk -F"$SEP" 'NR>1 && $9<=$8{printf "%-4s %-30s Stock: %s / Mín: %s\n", $1, $2, $9, $8}' "$ARTICULOS" | column -t
    ;;
  *)
    echo -e "${turquoiseColour}Uso: $0 {articulos|categorias|proveedores|movimientos|pedidos|buscar|stock_bajo}${endColour}"
    echo ""
    echo "Ejemplos:"
    echo "  $0 articulos"
    echo "  $0 buscar articulos Tutú"
    echo "  $0 stock_bajo"
    ;;
esac
