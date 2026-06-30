#!/usr/bin/env bash
source "$(cd "$(dirname "$0")/.." && pwd)/config.sh"

crear_tabla() {
  local archivo="$1"
  local cabecera="$2"
  if [ ! -f "$archivo" ]; then
    echo "$cabecera" > "$archivo"
    echo "  Creada: $(basename "$archivo")"
  else
    echo "  Ya existe: $(basename "$archivo")"
  fi
}

echo "=== Creando tablas ==="

crear_tabla "$ALUMNOS"    "id,nombre,edad,telefono,email,nivel,direccion,fecha_ingreso,activo"
crear_tabla "$PROFESORES" "id,nombre,telefono,email,especialidad,titulo,horas_semana,activo"
crear_tabla "$CURSOS"     "id,nombre,nivel,profesor_id,cupo_maximo,duracion_meses,arancel_mensual"
crear_tabla "$CLASES"     "id,curso_id,fecha,hora_inicio,hora_fin,aula,profesor_id"
crear_tabla "$PAGOS"      "id,alumno_id,curso_id,monto,fecha_vencimiento,fecha_pago,concepto,estado"
crear_tabla "$HORARIOS"   "id,curso_id,dia,hora_inicio,hora_fin,aula"

echo "=== Listo ==="
ls -1 "$DB_DIR"/*.csv 2>/dev/null
