#!/usr/bin/env bash

DIR="$(cd "$(dirname "$0")" && pwd)"

menu_crear_editar() {
  while true; do
    clear
    echo "╔══════════════════════════════════════╗"
    echo "║         CREAR Y EDITAR               ║"
    echo "╠══════════════════════════════════════╣"
    echo "║  1)  Crear tablas                    ║"
    echo "║  2)  Insertar alumno                 ║"
    echo "║  3)  Editar alumno                   ║"
    echo "║  4)  Insertar profesor               ║"
    echo "║  5)  Editar profesor                 ║"
    echo "║  6)  Insertar curso                  ║"
    echo "║  7)  Registrar pago                  ║"
    echo "║  8)  Eliminar registro               ║"
    echo "║  9)  Vaciar tabla                    ║"
    echo "║ 10)  Eliminar toda la BD             ║"
    echo "║                                      ║"
    echo "║  0)  Volver al menú principal        ║"
    echo "╚══════════════════════════════════════╝"
    echo ""
    read -p "  Opción: " opcion
    echo ""

    case $opcion in
      1) bash "$DIR/scripts/crear-tablas.sh" ;;
      2)
        read -p "Nombre: " nombre
        read -p "Edad: " edad
        read -p "Teléfono: " telefono
        read -p "Email: " email
        read -p "Nivel: " nivel
        read -p "Dirección: " direccion
        fecha=$(date +%F)
        bash "$DIR/scripts/insertar.sh" alumno "$nombre" "$edad" "$telefono" "$email" "$nivel" "$direccion" "$fecha"
        ;;
      3)
        bash "$DIR/scripts/consultar.sh" alumnos
        read -p "ID del alumno a editar: " id
        bash "$DIR/scripts/editar.sh" alumno "$id"
        ;;
      4)
        read -p "Nombre: " nombre
        read -p "Teléfono: " telefono
        read -p "Email: " email
        read -p "Especialidad: " especialidad
        read -p "Título: " titulo
        read -p "Horas/semana: " horas
        bash "$DIR/scripts/insertar.sh" profesor "$nombre" "$telefono" "$email" "$especialidad" "$titulo" "$horas"
        ;;
      5)
        bash "$DIR/scripts/consultar.sh" profesores
        read -p "ID del profesor a editar: " id
        bash "$DIR/scripts/editar.sh" profesor "$id"
        ;;
      6)
        read -p "Nombre del curso: " nombre
        read -p "Nivel (Básico/Intermedio/Avanzado): " nivel
        read -p "ID del profesor: " prof_id
        read -p "Cupo máximo: " cupo
        read -p "Duración (meses): " duracion
        read -p "Arancel mensual: " arancel
        bash "$DIR/scripts/insertar.sh" curso "$nombre" "$nivel" "$prof_id" "$cupo" "$duracion" "$arancel"
        ;;
      7)
        read -p "ID del alumno: " alumno_id
        read -p "ID del curso: " curso_id
        read -p "Monto: " monto
        fecha=$(date +%F)
        read -p "Concepto (ej: Abril 2025): " concepto
        bash "$DIR/scripts/insertar.sh" pago "$alumno_id" "$curso_id" "$monto" "$fecha" "$fecha" "$concepto" "pagado"
        ;;
      8)
        bash "$DIR/scripts/consultar.sh" alumnos
        echo ""
        bash "$DIR/scripts/consultar.sh" profesores
        echo ""
        read -p "Tabla (alumnos/profesores/cursos/clases/pagos/horarios): " tabla
        read -p "ID del registro a eliminar: " id
        bash "$DIR/scripts/eliminar.sh" registro "$tabla" "$id"
        ;;
      9)
        read -p "Tabla a vaciar (alumnos/profesores/cursos/clases/pagos/horarios): " tabla
        bash "$DIR/scripts/eliminar.sh" tabla "$tabla"
        ;;
      10)
        bash "$DIR/scripts/eliminar.sh" todo
        ;;
      0) break ;;
      *) echo "Opción inválida." ;;
    esac

    echo ""
    read -p "Presiona Enter para continuar..."
  done
}

menu_ver_buscar() {
  while true; do
    clear
    echo "╔══════════════════════════════════════╗"
    echo "║         VER Y BUSCAR                 ║"
    echo "╠══════════════════════════════════════╣"
    echo "║ 1)  Ver alumnos                     ║"
    echo "║ 2)  Ver pagos                       ║"
    echo "║ 3)  Reporte alumnos activos         ║"
    echo "║ 4)  Reporte ingresos mensual        ║"
    echo "║ 5)  Estadísticas generales          ║"
    echo "║ 6)  Buscar en tabla                 ║"
    echo "║ 7)  Respaldar base de datos         ║"
    echo "║                                      ║"
    echo "║  0)  Volver al menú principal        ║"
    echo "╚══════════════════════════════════════╝"
    echo ""
    read -p "  Opción: " opcion
    echo ""

    case $opcion in
      1) bash "$DIR/scripts/consultar.sh" alumnos ;;
      2) bash "$DIR/scripts/consultar.sh" pagos ;;
      3) bash "$DIR/scripts/reportes.sh" activos ;;
      4)
       read -p "Mes (YYYY-MM) [Enter = actual]: " mes
       bash "$DIR/scripts/reportes.sh" ingresos "${mes:-$(date +%Y-%m)}"
       ;;
      5) bash "$DIR/scripts/reportes.sh" estadisticas ;;
      6)
       read -p "Tabla (alumnos/profesores/cursos/pagos): " tabla
       read -p "Término de búsqueda: " termino
       bash "$DIR/scripts/consultar.sh" buscar "$tabla" "$termino" | head -30
       ;;
      7) bash "$DIR/scripts/backup.sh" ;;
      0) break ;;
      *) echo "Opción inválida." ;;
    esac

    echo ""
    read -p "Presiona Enter para continuar..."
  done
}

while true; do
  clear
  echo "╔══════════════════════════════════════╗"
  echo "║   GESTOR BD — ACADEMIA EN CAJA       ║"
  echo "╠══════════════════════════════════════╣"
  echo "║                                      ║"
  echo "║  1)  CREAR Y EDITAR                  ║"
  echo "║      (altas, bajas, modificaciones)  ║"
  echo "║                                      ║"
  echo "║  2)  VER Y BUSCAR                    ║"
  echo "║      (consultas, reportes, backups)  ║"
  echo "║                                      ║"
  echo "║  0)  Salir                           ║"
  echo "╚══════════════════════════════════════╝"
  echo ""
  read -p "  Opción: " opcion

  case $opcion in
    1) menu_crear_editar ;;
    2) menu_ver_buscar ;;
    0)
      sleep 2
      clear
      sleep 2
      echo "Hasta luego."
      exit 0
      ;;
    *)
      echo ""
      echo "Opción inválida."
      echo ""
      read -p "Presiona Enter para continuar..."
      ;;
  esac
done
