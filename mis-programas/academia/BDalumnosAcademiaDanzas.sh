#!/bin/bash

# ====================================================
#  BASE DE DATOS - ACADEMIA DE DANZAS
#  Versión: 1.0
# ====================================================

ARCHIVO_DB="alumnos.txt"
SEPARADOR="|"

# ID autoincremental
ULTIMO_ID=0

# ====================================================
#  INICIALIZACIÓN: crea el archivo si no existe
# ====================================================
inicializar() {
    if [[ ! -f "$ARCHIVO_DB" ]]; then
        touch "$ARCHIVO_DB"
        echo "ID|NOMBRE|EDAD|TELEFONO|EMAIL|ESTILO|NIVEL|DIAS_CLASE|FECHA_REG|PAGO" > "$ARCHIVO_DB"
        ULTIMO_ID=0
    else
        if [[ -s "$ARCHIVO_DB" ]]; then
            ULTIMO_ID=$(tail -n 1 "$ARCHIVO_DB" | cut -d"$SEPARADOR" -f1)
        else
            ULTIMO_ID=0
        fi
    fi
}

# ====================================================
#  CABECERA del menú
# ====================================================
cabecera() {
    clear
    echo "========================================"
    echo "   ACADEMIA DE DANZAS - SISTEMA DE"
    echo "           GESTION DE ALUMNOS"
    echo "========================================"
    echo ""
}

# ====================================================
#  MENÚ PRINCIPAL
# ====================================================
menu_principal() {
    while true; do
        cabecera
        echo "   MENU PRINCIPAL"
        echo ""
        echo "  1) CREAR   - Registrar nuevo alumno"
        echo "  2) LISTAR  - Ver todos los alumnos"
        echo "  3) BUSCAR  - Buscar un alumno"
        echo "  4) EDITAR  - Modificar datos de un alumno"
        echo "  5) ELIMINAR- Dar de baja a un alumno"
        echo "  6) ESTADISTICAS - Ver resumen de la academia"
        echo "  0) SALIR"
        echo ""
        read -p "  Seleccione una opcion: " opcion

        case $opcion in
            1) menu_crear ;;
            2) menu_listar ;;
            3) menu_buscar ;;
            4) menu_editar ;;
            5) menu_eliminar ;;
            6) menu_estadisticas ;;
            0) salir ;;
            *) 
                echo "  Opcion no valida"
                sleep 1
                ;;
        esac
    done
}

# ====================================================
#  VALIDACIONES
# ====================================================
validar_vacio() {
    local valor=$1
    local nombre=$2
    if [[ -z "$valor" ]]; then
        echo "ERROR: $nombre no puede estar vacio"
        return 1
    fi
    return 0
}

validar_edad() {
    local edad=$1
    if [[ ! "$edad" =~ ^[0-9]+$ ]] || [[ "$edad" -lt 1 ]] || [[ "$edad" -gt 120 ]]; then
        echo "ERROR: Edad debe ser un numero entre 1 y 120"
        return 1
    fi
    return 0
}

validar_telefono() {
    local tel=$1
    if [[ ! "$tel" =~ ^[0-9+\ -]{7,20}$ ]]; then
        echo "ERROR: Telefono invalido (debe tener 7-20 digitos)"
        return 1
    fi
    return 0
}

validar_email() {
    local email=$1
    if [[ ! "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "ERROR: Email invalido (ej: nombre@dominio.com)"
        return 1
    fi
    return 0
}

# ====================================================
#  CREAR ALUMNO
# ====================================================
menu_crear() {
    cabecera
    echo "   REGISTRAR NUEVO ALUMNO"
    echo "   (Deje el campo vacio y presione ENTER para cancelar)"
    echo "----------------------------------------------------"
    echo ""

    local nombre edad telefono email estilo nivel dias fecha pago

    read -p "  Nombre completo: " nombre
    validar_vacio "$nombre" "Nombre" || { read -p "  Presione ENTER para continuar"; return; }

    read -p "  Edad: " edad
    validar_vacio "$edad" "Edad" || { read -p "  Presione ENTER para continuar"; return; }
    validar_edad "$edad" || { read -p "  Presione ENTER para continuar"; return; }

    read -p "  Telefono: " telefono
    validar_vacio "$telefono" "Telefono" || { read -p "  Presione ENTER para continuar"; return; }
    validar_telefono "$telefono" || { read -p "  Presione ENTER para continuar"; return; }

    read -p "  Email: " email
    validar_vacio "$email" "Email" || { read -p "  Presione ENTER para continuar"; return; }
    validar_email "$email" || { read -p "  Presione ENTER para continuar"; return; }

    echo "  Estilo de danza:"
    echo "    1) Ballet"
    echo "    2) Salsa"
    echo "    3) Bachata"
    echo "    4) Tango"
    echo "    5) Danza Contemporanea"
    echo "    6) Hip Hop"
    echo "    7) Flamenco"
    echo "    8) Reggaeton"
    echo "    9) Danza Clasica"
    echo "    10) Danzas Folcloricas"
    echo "    11) Jazz"
    echo "    12) Otro"
    read -p "  Seleccione (1-12): " opc_estilo
    case $opc_estilo in
        1) estilo="Ballet" ;;
        2) estilo="Salsa" ;;
        3) estilo="Bachata" ;;
        4) estilo="Tango" ;;
        5) estilo="Danza Contemporanea" ;;
        6) estilo="Hip Hop" ;;
        7) estilo="Flamenco" ;;
        8) estilo="Reggaeton" ;;
        9) estilo="Danza Clasica" ;;
        10) estilo="Danzas Folcloricas" ;;
        11) estilo="Jazz" ;;
        12) read -p "  Escriba el estilo: " estilo ;;
        *) estilo="No especificado" ;;
    esac

    echo "  Nivel:"
    echo "    1) Principiante"
    echo "    2) Intermedio"
    echo "    3) Avanzado"
    read -p "  Seleccione (1-3): " opc_nivel
    case $opc_nivel in
        1) nivel="Principiante" ;;
        2) nivel="Intermedio" ;;
        3) nivel="Avanzado" ;;
        *) nivel="No especificado" ;;
    esac

    read -p "  Dias de clase (ej: Lunes,Miercoles,Viernes): " dias

    fecha=$(date +%d/%m/%Y)

    echo "  Estado de pago:"
    echo "    1) Al dia"
    echo "    2) Pendiente"
    echo "    3) Vencido"
    read -p "  Seleccione (1-3): " opc_pago
    case $opc_pago in
        1) pago="Al dia" ;;
        2) pago="Pendiente" ;;
        3) pago="Vencido" ;;
        *) pago="Pendiente" ;;
    esac

    ULTIMO_ID=$((ULTIMO_ID + 1))

    echo "${ULTIMO_ID}${SEPARADOR}${nombre}${SEPARADOR}${edad}${SEPARADOR}${telefono}${SEPARADOR}${email}${SEPARADOR}${estilo}${SEPARADOR}${nivel}${SEPARADOR}${dias}${SEPARADOR}${fecha}${SEPARADOR}${pago}" >> "$ARCHIVO_DB"

    echo ""
    echo "  Alumno registrado con exito!"
    echo "  ID asignado: $ULTIMO_ID"
    read -p "  Presione ENTER para continuar"
}

# ====================================================
#  LISTAR ALUMNOS
# ====================================================
menu_listar() {
    cabecera
    echo "   LISTA DE ALUMNOS"
    echo "----------------------------------------------------"
    echo ""

    local total=$(tail -n +2 "$ARCHIVO_DB" | wc -l)

    if [[ "$total" -eq 0 ]]; then
        echo "  No hay alumnos registrados."
    else
        printf "  %-4s %-25s %-4s %-12s %-6s %-10s\n" "ID" "NOMBRE" "EDAD" "ESTILO" "NIVEL" "PAGO"
        echo "  -------------------------------------------------------------------"

        while IFS="$SEPARADOR" read -r id nombre edad telefono email estilo nivel dias fecha pago; do
            if [[ "$id" != "ID" ]]; then
                printf "  %-4s %-25s %-4s %-12s %-6s %-10s\n" "$id" "${nombre:0:25}" "$edad" "${estilo:0:12}" "$nivel" "$pago"
            fi
        done < "$ARCHIVO_DB"

        echo ""
        echo "  Total de alumnos: $total"
    fi

    echo ""
    read -p "  Presione ENTER para continuar"
}

# ====================================================
#  BUSCAR ALUMNO
# ====================================================
menu_buscar() {
    cabecera
    echo "   BUSCAR ALUMNO"
    echo "----------------------------------------------------"
    echo ""

    read -p "  Ingrese nombre, ID o telefono a buscar: " busqueda

    if [[ -z "$busqueda" ]]; then
        echo "  Busqueda cancelada."
        read -p "  Presione ENTER para continuar"
        return
    fi

    local resultado=$(grep -i "$busqueda" "$ARCHIVO_DB" | grep -v "^ID")

    if [[ -z "$resultado" ]]; then
        echo "  No se encontraron resultados para: $busqueda"
    else
        echo ""
        echo "  Resultados encontrados:"
        echo ""

        while IFS="$SEPARADOR" read -r id nombre edad telefono email estilo nivel dias fecha pago; do
            if [[ "$id" != "ID" ]]; then
                echo "  ========================================"
                echo "  ID:          $id"
                echo "  Nombre:      $nombre"
                echo "  Edad:        $edad"
                echo "  Telefono:    $telefono"
                echo "  Email:       $email"
                echo "  Estilo:      $estilo"
                echo "  Nivel:       $nivel"
                echo "  Dias:        $dias"
                echo "  Registro:    $fecha"
                echo "  Pago:        $pago"
                echo "  ========================================"
                echo ""
            fi
        done <<< "$resultado"
    fi

    read -p "  Presione ENTER para continuar"
}

# ====================================================
#  EDITAR ALUMNO
# ====================================================
menu_editar() {
    cabecera
    echo "   EDITAR ALUMNO"
    echo "----------------------------------------------------"
    echo ""

    read -p "  Ingrese el ID del alumno a editar: " id_editar

    if [[ -z "$id_editar" ]] || [[ ! "$id_editar" =~ ^[0-9]+$ ]]; then
        echo "  Operacion cancelada."
        read -p "  Presione ENTER para continuar"
        return
    fi

    local linea=$(grep "^${id_editar}${SEPARADOR}" "$ARCHIVO_DB")

    if [[ -z "$linea" ]]; then
        echo "  No existe un alumno con ID $id_editar"
        read -p "  Presione ENTER para continuar"
        return
    fi

    IFS="$SEPARADOR" read -r id nombre edad telefono email estilo nivel dias fecha pago <<< "$linea"

    echo ""
    echo "  Editando a: $nombre (ID: $id)"
    echo "  (Deje el campo vacio para mantener el valor actual)"
    echo "----------------------------------------------------"
    echo ""

    echo "  Datos actuales - Nombre: $nombre"
    read -p "  Nuevo nombre: " nuevo_nombre
    nuevo_nombre="${nuevo_nombre:-$nombre}"

    echo "  Datos actuales - Edad: $edad"
    read -p "  Nueva edad: " nueva_edad
    nueva_edad="${nueva_edad:-$edad}"

    echo "  Datos actuales - Telefono: $telefono"
    read -p "  Nuevo telefono: " nuevo_telefono
    nuevo_telefono="${nuevo_telefono:-$telefono}"

    echo "  Datos actuales - Email: $email"
    read -p "  Nuevo email: " nuevo_email
    nuevo_email="${nuevo_email:-$email}"

    echo "  Datos actuales - Estilo: $estilo"
    echo "    1) Ballet"
    echo "    2) Salsa"
    echo "    3) Bachata"
    echo "    4) Tango"
    echo "    5) Danza Contemporanea"
    echo "    6) Hip Hop"
    echo "    7) Flamenco"
    echo "    8) Reggaeton"
    echo "    9) Danza Clasica"
    echo "    10) Danzas Folcloricas"
    echo "    11) Jazz"
    echo "    12) Otro"
    echo "    0) Mantener actual: $estilo"
    read -p "  Seleccione: " opc_estilo
    case $opc_estilo in
        1) nuevo_estilo="Ballet" ;;
        2) nuevo_estilo="Salsa" ;;
        3) nuevo_estilo="Bachata" ;;
        4) nuevo_estilo="Tango" ;;
        5) nuevo_estilo="Danza Contemporanea" ;;
        6) nuevo_estilo="Hip Hop" ;;
        7) nuevo_estilo="Flamenco" ;;
        8) nuevo_estilo="Reggaeton" ;;
        9) nuevo_estilo="Danza Clasica" ;;
        10) nuevo_estilo="Danzas Folcloricas" ;;
        11) nuevo_estilo="Jazz" ;;
        12) read -p "  Escriba el nuevo estilo: " nuevo_estilo ;;
        *) nuevo_estilo="$estilo" ;;
    esac

    echo "  Datos actuales - Nivel: $nivel"
    echo "    1) Principiante"
    echo "    2) Intermedio"
    echo "    3) Avanzado"
    echo "    0) Mantener actual: $nivel"
    read -p "  Seleccione: " opc_nivel
    case $opc_nivel in
        1) nuevo_nivel="Principiante" ;;
        2) nuevo_nivel="Intermedio" ;;
        3) nuevo_nivel="Avanzado" ;;
        *) nuevo_nivel="$nivel" ;;
    esac

    echo "  Datos actuales - Dias de clase: $dias"
    read -p "  Nuevos dias: " nuevo_dias
    nuevo_dias="${nuevo_dias:-$dias}"

    echo "  Datos actuales - Pago: $pago"
    echo "    1) Al dia"
    echo "    2) Pendiente"
    echo "    3) Vencido"
    echo "    0) Mantener actual: $pago"
    read -p "  Seleccione: " opc_pago
    case $opc_pago in
        1) nuevo_pago="Al dia" ;;
        2) nuevo_pago="Pendiente" ;;
        3) nuevo_pago="Vencido" ;;
        *) nuevo_pago="$pago" ;;
    esac

    local nueva_linea="${id}${SEPARADOR}${nuevo_nombre}${SEPARADOR}${nueva_edad}${SEPARADOR}${nuevo_telefono}${SEPARADOR}${nuevo_email}${SEPARADOR}${nuevo_estilo}${SEPARADOR}${nuevo_nivel}${SEPARADOR}${nuevo_dias}${SEPARADOR}${fecha}${SEPARADOR}${nuevo_pago}"

    sed -i "s/^${id_editar}${SEPARADOR}.*$/${nueva_linea}/" "$ARCHIVO_DB"

    echo ""
    echo "  Alumno actualizado con exito!"
    read -p "  Presione ENTER para continuar"
}

# ====================================================
#  ELIMINAR ALUMNO
# ====================================================
menu_eliminar() {
    cabecera
    echo "   ELIMINAR ALUMNO"
    echo "----------------------------------------------------"
    echo ""

    read -p "  Ingrese el ID del alumno a eliminar: " id_eliminar

    if [[ -z "$id_eliminar" ]] || [[ ! "$id_eliminar" =~ ^[0-9]+$ ]]; then
        echo "  Operacion cancelada."
        read -p "  Presione ENTER para continuar"
        return
    fi

    local linea=$(grep "^${id_eliminar}${SEPARADOR}" "$ARCHIVO_DB")

    if [[ -z "$linea" ]]; then
        echo "  No existe un alumno con ID $id_eliminar"
        read -p "  Presione ENTER para continuar"
        return
    fi

    IFS="$SEPARADOR" read -r id nombre edad telefono email estilo nivel dias fecha pago <<< "$linea"

    echo ""
    echo "  Alumno encontrado:"
    echo "  ID: $id - Nombre: $nombre - Estilo: $estilo - Nivel: $nivel"
    echo ""
    read -p "  Esta seguro de eliminar a $nombre? (s/N): " confirmacion

    if [[ "$confirmacion" =~ ^[sS]$ ]]; then
        sed -i "/^${id_eliminar}${SEPARADOR}.*$/d" "$ARCHIVO_DB"
        echo "  Alumno eliminado con exito!"
    else
        echo "  Eliminacion cancelada."
    fi

    read -p "  Presione ENTER para continuar"
}

# ====================================================
#  ESTADISTICAS
# ====================================================
menu_estadisticas() {
    cabecera
    echo "   ESTADISTICAS DE LA ACADEMIA"
    echo "----------------------------------------------------"
    echo ""

    local total=$(tail -n +2 "$ARCHIVO_DB" | wc -l)

    if [[ "$total" -eq 0 ]]; then
        echo "  No hay alumnos registrados."
        read -p "  Presione ENTER para continuar"
        return
    fi

    echo "  Total de alumnos: $total"
    echo ""

    echo "  --- Alumnos por nivel ---"
    local pri=$(grep -c "Principiante" "$ARCHIVO_DB" 2>/dev/null || echo 0)
    local inter=$(grep -c "Intermedio" "$ARCHIVO_DB" 2>/dev/null || echo 0)
    local ava=$(grep -c "Avanzado" "$ARCHIVO_DB" 2>/dev/null || echo 0)
    echo "  Principiantes: $pri"
    echo "  Intermedios:   $inter"
    echo "  Avanzados:     $ava"
    echo ""

    echo "  --- Estado de pagos ---"
    local aldia=$(grep -c "Al dia" "$ARCHIVO_DB" 2>/dev/null || echo 0)
    local pend=$(grep -c "Pendiente" "$ARCHIVO_DB" 2>/dev/null || echo 0)
    local ven=$(grep -c "Vencido" "$ARCHIVO_DB" 2>/dev/null || echo 0)
    echo "  Al dia:      $aldia"
    echo "  Pendiente:   $pend"
    echo "  Vencido:     $ven"
    echo ""

    echo "  --- Alumnos por estilo ---"
    local estilos=$(tail -n +2 "$ARCHIVO_DB" | cut -d"$SEPARADOR" -f6 | sort | uniq -c | sort -rn)
    if [[ -n "$estilos" ]]; then
        echo "$estilos" | while read -r cantidad estilo; do
            echo "  $estilo: $cantidad"
        done
    fi

    echo ""
    read -p "  Presione ENTER para continuar"
}

# ====================================================
#  SALIR
# ====================================================
salir() {
    cabecera
    echo "  Gracias por usar el sistema de gestion."
    echo "  Hasta pronto!"
    echo ""
    exit 0
}

# ====================================================
#  INICIO DEL PROGRAMA
# ====================================================
inicializar
menu_principal
