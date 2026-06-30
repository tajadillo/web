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
  alumnos|alumno)
    mostrar_tabla "$ALUMNOS"
    echo -e "${yellowColour}Total: $(contar "$ALUMNOS") alumnos${endColour}"
    ;;
  profesores|profesor)
    mostrar_tabla "$PROFESORES"
    echo -e "${yellowColour}Total: $(contar "$PROFESORES") profesores${endColour}"
    ;;
  cursos|curso)
    mostrar_tabla "$CURSOS"
    echo -e "${yellowColour}Total: $(contar "$CURSOS") cursos${endColour}"
    ;;
  clases|clase)
    mostrar_tabla "$CLASES"
    echo -e "${yellowColour}Total: $(contar "$CLASES") clases${endColour}"
    ;;
  pagos|pago)
    mostrar_tabla "$PAGOS"
    echo -e "${yellowColour}Total: $(contar "$PAGOS") pagos${endColour}"
    ;;
  horarios|horario)
    mostrar_tabla "$HORARIOS"
    echo -e "${yellowColour}Total: $(contar "$HORARIOS") horarios${endColour}"
    ;;
  buscar)
    shift
    [ -z "$1" ] && echo -e "${redColour}Uso: $0 buscar <tabla> <termino>${endColour}" && exit 1
    local tabla="$1"; shift
    local archivo_var="${tabla^^}"
    local archivo="${!archivo_var}"
    [ -z "$archivo" ] && archivo="$DB_DIR/${tabla}.csv"
    buscar "$archivo" "$1"
    ;;
  contar)
    shift
    [ -z "$1" ] && echo -e "${redColour}Uso: $0 contar <tabla>${endColour}" && exit 1
    local tabla="$1"
    local archivo_var="${tabla^^}"
    local archivo="${!archivo_var}"
    [ -z "$archivo" ] && archivo="$DB_DIR/${tabla}.csv"
    echo -e "${yellowColour}$(contar "$archivo") registros en $tabla${endColour}"
    ;;
  *)
    echo -e "${turquoiseColour}Uso: $0 {alumnos|profesores|cursos|clases|pagos|horarios|buscar|contar}${endColour}"
    echo -e "${grayColour}Ejemplos:${endColour}"
    echo "  $0 alumnos"
    echo "  $0 buscar alumnos García"
    echo "  $0 contar pagos"
    ;;
esac
