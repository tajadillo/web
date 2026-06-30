#!/usr/bin/env bash
source "$(cd "$(dirname "$0")/.." && pwd)/config.sh"

reporte_inventario_completo() {
  echo -e "${greenColour}=== INVENTARIO COMPLETO ===${endColour}"
  echo ""
  awk -F"$SEP" 'NR>1{
    printf "%-4s %-30s %-4s u.  Mín:%-4s  \$%-8s  %s\n", $1, $2, $9, $8, $7, $10
  }' "$ARTICULOS" | column -t
}

reporte_stock_bajo() {
  echo -e "${redColour}=== STOCK BAJO (por debajo del mínimo) ===${endColour}"
  echo ""
  awk -F"$SEP" 'NR>1 && $9<=$8{
    printf "%-4s %-30s Actual: %-4s  Mínimo: %s\n", $1, $2, $9, $8
  }' "$ARTICULOS" | column -t
}

reporte_valor_inventario() {
  echo -e "${purpleColour}=== VALOR DEL INVENTARIO ===${endColour}"
  echo ""
  local total_compra total_venta
  total_compra=$(awk -F"$SEP" 'NR>1{sum+=$6*$9}END{print sum}' "$ARTICULOS")
  total_venta=$(awk -F"$SEP" 'NR>1{sum+=$7*$9}END{print sum}' "$ARTICULOS")
  echo -e "${yellowColour}Costo total:${endColour}          \$${total_compra:-0}"
  echo -e "${greenColour}Valor de venta total:${endColour}  \$${total_venta:-0}"
  local ganancia=$((total_venta - total_compra))
  echo -e "${blueColour}Ganancia potencial:${endColour}     \$${ganancia}"
}

reporte_movimientos_por_articulo() {
  local art_id="$1"
  echo -e "${turquoiseColour}=== MOVIMIENTOS DEL ARTÍCULO #$art_id ===${endColour}"
  echo ""
  awk -F"$SEP" -v id="$art_id" 'NR>1 && $2==id{
    printf "%s | %-7s | %-4s | %s | %s\n", $1, $3, $4, $5, $6
  }' "$MOVIMIENTOS" | column -t

  local nombre
  nombre=$(awk -F"$SEP" -v id="$art_id" 'NR>1 && $1==id{print $2}' "$ARTICULOS")
  local stock
  stock=$(awk -F"$SEP" -v id="$art_id" 'NR>1 && $1==id{print $9}' "$ARTICULOS")
  echo ""
  echo -e "${yellowColour}${nombre}: ${stock} unidades en stock${endColour}"
}

estadisticas() {
  echo -e "${magentaColour}=== ESTADÍSTICAS DEL INVENTARIO ===${endColour}"
  echo ""
  local total_arts=$(($(wc -l < "$ARTICULOS") - 1))
  local bajos=$(awk -F"$SEP" '$9<=$8' "$ARTICULOS" | wc -l)
  local valor=$(awk -F"$SEP" 'NR>1{sum+=$7*$9}END{print sum}' "$ARTICULOS")
  local entradas=$(awk -F"$SEP" '$3=="entrada"' "$MOVIMIENTOS" | wc -l)
  local salidas=$(awk -F"$SEP" '$3=="salida"' "$MOVIMIENTOS" | wc -l)

  echo -e "${greenColour}Artículos registrados:${endColour}    $total_arts"
  echo -e "${redColour}Con stock bajo:${endColour}           $bajos"
  echo -e "${greenColour}Valor total inventario:${endColour}  \$${valor:-0}"
  echo -e "${greenColour}Mov. de entrada:${endColour}         $entradas"
  echo -e "${greenColour}Mov. de salida:${endColour}          $salidas"
  echo ""
  echo -e "${yellowColour}Categorías:${endColour} $(($(wc -l < "$CATEGORIAS") - 1))"
  echo -e "${yellowColour}Proveedores:${endColour} $(($(wc -l < "$PROVEEDORES") - 1))"
  echo -e "${yellowColour}Pedidos:${endColour}     $(($(wc -l < "$PEDIDOS") - 1))"
}

case "$1" in
  inventario|completo)
    reporte_inventario_completo
    ;;
  stock_bajo|bajo)
    reporte_stock_bajo
    ;;
  valor)
    reporte_valor_inventario
    ;;
  movimientos|mov)
    reporte_movimientos_por_articulo "$2"
    ;;
  estadisticas|stats)
    estadisticas
    ;;
  todo)
    echo ""
    reporte_inventario_completo
    echo ""
    reporte_stock_bajo
    echo ""
    reporte_valor_inventario
    echo ""
    estadisticas
    ;;
  *)
    echo -e "${turquoiseColour}Uso: $0 {inventario|stock_bajo|valor|movimientos [id]|estadisticas|todo}${endColour}"
    echo ""
    echo "Ejemplos:"
    echo "  $0 inventario"
    echo "  $0 stock_bajo"
    echo "  $0 movimientos 1"
    echo "  $0 todo"
    ;;
esac
