#!/usr/bin/env bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config.sh"

editar_registro() {
  local archivo="$1"
  local id="$2"
  shift 2
  local editables=("$@")

  if [ ! -f "$archivo" ]; then
    echo "Error: la tabla no existe."
    return 1
  fi

  local linea
  linea=$(grep "^${id}${SEP}" "$archivo")
  if [ -z "$linea" ]; then
    echo "Error: no se encontró registro con id=$id."
    return 1
  fi

  IFS="$SEP" read -ra valores <<< "$linea"
  local cabecera
  cabecera=$(head -1 "$archivo")
  IFS="$SEP" read -ra cols <<< "$cabecera"

  echo "=== Editando registro #$id ==="
  echo ""

  local nuevos=("${valores[0]}")
  local idx_col=1
  local edit_idx=0

  while [ $idx_col -lt ${#cols[@]} ]; do
    local nombre_col="${cols[$idx_col]}"
    local actual="${valores[$idx_col]}"
    actual="${actual//${DELIM}/}"

    # Chequear si esta columna es editable
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

  echo "Registro #$id actualizado."
}

case "$1" in
  alumno)
    shift
    id=""
    if [ -z "$1" ]; then
      read -p "ID del alumno: " id
    else
      id="$1"
    fi
    editar_registro "$ALUMNOS" "$id" "nombre" "edad" "telefono" "email" "nivel" "direccion"
    ;;
  profesor)
    shift
    id=""
    if [ -z "$1" ]; then
      read -p "ID del profesor: " id
    else
      id="$1"
    fi
    editar_registro "$PROFESORES" "$id" "nombre" "telefono" "email" "especialidad" "titulo" "horas_semana"
    ;;
  *)
    echo "Uso: $0 {alumno [id]|profesor [id]}"
    ;;
esac
