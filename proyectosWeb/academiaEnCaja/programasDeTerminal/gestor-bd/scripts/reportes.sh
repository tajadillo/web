#!/usr/bin/env bash
source "$(cd "$(dirname "$0")/.." && pwd)/config.sh"

reporte_alumnos_activos() {
  echo -e "${greenColour}=== ALUMNOS ACTIVOS ===${endColour}"
  echo ""
  echo -e "${blueColour}$(awk -F"$SEP" 'NR>1 && $9=="si"{
    printf "%-4s %-25s %-3s %-15s %-15s\n", $1, $2, $3, $6, $5
  }' "$ALUMNOS" | column -t)${endColour}"
  echo ""
  echo -e "${yellowColour}Total activos: $(awk -F"$SEP" '$9=="si"' "$ALUMNOS" | wc -l)${endColour}"
}

reporte_morosos() {
  echo -e "${redColour}=== PAGOS VENCIDOS ===${endColour}"
  echo ""
  awk -F"$SEP" 'NR>1 && $8!="pagado" && $4<"'$(date +%F)'"{
    printf "Alumno #%-4s | Curso #%-4s | \$%-8s | Vence: %s\n", $2, $3, $4, $5
  }' "$PAGOS"
}

reporte_ingresos_mensual() {
  local mes="${1:-$(date +%Y-%m)}"
  echo -e "${greenColour}=== INGRESOS: $mes ===${endColour}"
  local total
  total=$(awk -F"$SEP" -v m="$mes" 'NR>1 && $8=="pagado" && $6~m{sum+=$4}END{print sum}' "$PAGOS")
  echo -e "${yellowColour}Total cobrado: \$${total:-0}${endColour}"
  echo ""
  awk -F"$SEP" -v m="$mes" 'NR>1 && $8=="pagado" && $6~m{
    printf "  Pago #%-4s | Alumno #%-4s | \$%-8s | %s\n", $1, $2, $4, $6
  }' "$PAGOS"
}

reporte_carga_horaria_profesores() {
  echo -e "${purpleColour}=== CARGA HORARIA POR PROFESOR ===${endColour}"
  echo ""
  echo -e "${blueColour}$(awk -F"$SEP" 'NR>1{
    gsub(/"/,"",$2); gsub(/"/,"",$5)
    printf "%-4s %-25s %s\n", $1, $2, $5
  }' "$PROFESORES" | column -t)${endColour}"
  echo ""
  echo -e "${turquoiseColour}--- Clases asignadas ---${endColour}"
  awk -F"$SEP" 'NR>1{print $7}' "$CLASES" | sort | uniq -c | sort -rn | while read count id; do
    nombre=$(awk -F"$SEP" -v id="$id" 'NR>1 && $1==id{gsub(/"/,"",$2); print $2}' "$PROFESORES")
    printf "  %-25s %d clases\n" "${nombre:-Profesor #$id}" "$count"
  done
}

estadisticas() {
  echo -e "${magentaColour}=== ESTADÍSTICAS GENERALES ===${endColour}"
  echo ""
  echo -e "${greenColour}Alumnos activos:${endColour}    $(awk -F"$SEP" '$9=="si"' "$ALUMNOS" | wc -l)"
  echo -e "${greenColour}Alumnos totales:${endColour}    $(($(wc -l < "$ALUMNOS") - 1))"
  echo -e "${greenColour}Profesores activos:${endColour} $(awk -F"$SEP" '$8=="si"' "$PROFESORES" | wc -l)"
  echo -e "${greenColour}Cursos activos:${endColour}     $(($(wc -l < "$CURSOS") - 1))"
  echo -e "${greenColour}Clases registradas:${endColour} $(($(wc -l < "$CLASES") - 1))"
  echo -e "${greenColour}Pagos registrados:${endColour}  $(($(wc -l < "$PAGOS") - 1))"
  echo ""
  local ingreso_total
  ingreso_total=$(awk -F"$SEP" 'NR>1 && $8=="pagado"{sum+=$4}END{print sum}' "$PAGOS")
  echo -e "${yellowColour}Ingreso total histórico: \$${ingreso_total:-0}${endColour}"
}

case "$1" in
  activos|alumnos)
    reporte_alumnos_activos
    ;;
  morosos|vencidos)
    reporte_morosos
    ;;
  ingresos)
    reporte_ingresos_mensual "$2"
    ;;
  profesores)
    reporte_carga_horaria_profesores
    ;;
  estadisticas|stats)
    estadisticas
    ;;
  todo)
    echo ""
    reporte_alumnos_activos
    echo ""
    reporte_carga_horaria_profesores
    echo ""
    reporte_ingresos_mensual
    echo ""
    reporte_morosos
    ;;
  *)
    echo -e "${turquoiseColour}Uso: $0 {activos|morosos|ingresos [mes]|profesores|estadisticas|todo}${endColour}"
    echo ""
    echo "Ejemplos:"
    echo "  $0 activos"
    echo "  $0 ingresos 2025-04"
    echo "  $0 todo"
    ;;
esac
