#!/usr/bin/env bash
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/config.sh"

eliminar_registro() {
  local archivo="$1"
  local tabla="$2"
  local id="$3"

  if [ ! -f "$archivo" ]; then
    echo "Error: la tabla $tabla no existe."
    return 1
  fi

  if ! grep -q "^${id}${SEP}" "$archivo"; then
    echo "Error: no se encontró $tabla con id=$id."
    return 1
  fi

  echo "Registro a eliminar:"
  grep "^${id}${SEP}" "$archivo" | column -t -s"$SEP" -o" │ "
  read -p "¿Confirmar eliminación? (s/N): " conf
  if [ "$conf" != "s" ] && [ "$conf" != "S" ]; then
    echo "Cancelado."
    return
  fi

  grep -v "^${id}${SEP}" "$archivo" > "$archivo.tmp" && mv "$archivo.tmp" "$archivo"
  echo "$tabla #$id eliminado."
}

eliminar_tabla() {
  local archivo="$1"
  local tabla="$2"

  if [ ! -f "$archivo" ]; then
    echo "Error: la tabla $tabla no existe."
    return 1
  fi

  read -p "¿Eliminar TODA la tabla $tabla (se pierden todos los datos)? (s/N): " conf
  if [ "$conf" != "s" ] && [ "$conf" != "S" ]; then
    echo "Cancelado."
    return
  fi

  local cabecera
  cabecera=$(head -1 "$archivo")
  echo "$cabecera" > "$archivo" || {
    echo "Error: no se pudo limpiar la tabla."
    return 1
  }
  echo "Tabla $tabla vaciada (solo queda la cabecera)."
}

resolver_archivo() {
  local nombre="$1"
  case "$nombre" in
    alumnos|alumno)    echo "$ALUMNOS" ;;
    profesores|profesor) echo "$PROFESORES" ;;
    cursos|curso)      echo "$CURSOS" ;;
    clases|clase)      echo "$CLASES" ;;
    pagos|pago)        echo "$PAGOS" ;;
    horarios|horario)  echo "$HORARIOS" ;;
    *)                 echo "$DB_DIR/${nombre}.csv" ;;
  esac
}

case "$1" in
  registro)
    shift
    tabla="$1"
    id="$2"
    [ -z "$tabla" ] && read -p "Tabla (alumnos/profesores/cursos/clases/pagos/horarios): " tabla
    [ -z "$id" ] && read -p "ID del registro a eliminar: " id
    archivo=$(resolver_archivo "$tabla")
    eliminar_registro "$archivo" "$tabla" "$id"
    ;;
  tabla)
    shift
    tabla="$1"
    [ -z "$tabla" ] && read -p "Tabla (alumnos/profesores/cursos/clases/pagos/horarios): " tabla
    archivo=$(resolver_archivo "$tabla")
    eliminar_tabla "$archivo" "$tabla"
    ;;
  todo)
    echo "¡ATENCIÓN! Se eliminarán TODAS las tablas."
    read -p "Escribí 'BORRAR' para confirmar: " conf
    if [ "$conf" != "BORRAR" ]; then
      echo "Cancelado."
      exit 1
    fi
    rm -f "$ALUMNOS" "$PROFESORES" "$CURSOS" "$CLASES" "$PAGOS" "$HORARIOS"
    rm -f "$BACKUP_DIR"/*.tar.gz 2>/dev/null
    echo "Base de datos eliminada por completo."
    ;;
  *)
    echo "Uso: $0 {registro|tabla|todo}"
    echo ""
    echo "Ejemplos:"
    echo "  $0 registro alumnos 3         # Elimina el alumno #3"
    echo "  $0 tabla pagos                # Vacía la tabla de pagos"
    echo "  $0 todo                       # Elimina toda la base de datos"
    ;;
esac
