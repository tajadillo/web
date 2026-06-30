#!/usr/bin/env bash
source "$(cd "$(dirname "$0")/.." && pwd)/config.sh"

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

alumno() {
  local id
  id=$(next_id "$ALUMNOS")
  echo "${id},$(render_csv "$1"),$2,$(render_csv "$3"),$(render_csv "$4"),$(render_csv "$5"),$(render_csv "$6"),$7,si" >> "$ALUMNOS"
  echo "Alumno #$id creado."
}

profesor() {
  local id
  id=$(next_id "$PROFESORES")
  echo "${id},$(render_csv "$1"),$(render_csv "$2"),$(render_csv "$3"),$(render_csv "$4"),$(render_csv "$5"),$6,si" >> "$PROFESORES"
  echo "Profesor #$id creado."
}

curso() {
  local id
  id=$(next_id "$CURSOS")
  echo "${id},$(render_csv "$1"),$(render_csv "$2"),$3,$4,$5,$6" >> "$CURSOS"
  echo "Curso #$id creado."
}

clase() {
  local id
  id=$(next_id "$CLASES")
  echo "${id},$1,$2,$3,$4,$5,$6" >> "$CLASES"
  echo "Clase #$id registrada."
}

pago() {
  local id
  id=$(next_id "$PAGOS")
  echo "${id},$1,$2,$3,$4,$5,$6,$7" >> "$PAGOS"
  echo "Pago #$id registrado."
}

horario() {
  local id
  id=$(next_id "$HORARIOS")
  echo "${id},$1,$2,$3,$4,$5" >> "$HORARIOS"
  echo "Horario #$id creado."
}

case "$1" in
  alumno)    shift; alumno "$@" ;;
  profesor)  shift; profesor "$@" ;;
  curso)     shift; curso "$@" ;;
  clase)     shift; clase "$@" ;;
  pago)      shift; pago "$@" ;;
  horario)   shift; horario "$@" ;;
  *)
    echo "Uso: $0 {alumno|profesor|curso|clase|pago|horario} [datos...]"
    echo ""
    echo "Ejemplos:"
    echo "  $0 alumno 'María García' 28 '11-2233-4455' 'maria@mail.com' 'Intermedio' 'Av. Siempre Viva 123' 2025-03-01"
    echo "  $0 profesor 'Carlos López' '15-6789-0123' 'carlos@mail.com' 'Percusión' 'Lic. Música' 20"
    echo "  $0 curso 'Cajón Avanzado' 'Avanzado' 1 15 6 25000"
    echo "  $0 clase 1 2025-04-10 '10:00' '11:30' 'Aula 3' 1"
    echo "  $0 pago 1 1 25000 2025-04-01 2025-04-01 'Abril 2025' pagado"
    echo "  $0 horario 1 'Lunes' '10:00' '11:30' 'Aula 3'"
    ;;
esac
