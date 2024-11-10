#!/bin/bash
#########################################################################################
# tabla de valores para los pagos en seminarios culturales
# Autor: Richard A. Tajadillo Pérez
# Copyright (C) 2024
# LICENCIA GNU GPL 3.0
########################################################################################

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"

# Manejador de interrupciones (Ctrl + C)
trap ctrl_c INT

function ctrl_c(){
    clear
    echo -e "\n${yellowColour}[*]${endColour}${redColour} Saliendo...${endColour}${yellowColour}[*]${endColour}"
    exit 0
}

# Función para saludar
function saludar(){
    hora_actual=$(date +'%H')

    if [ $hora_actual -ge 5 ] && [ $hora_actual -lt 12 ]; then
        saludo="¡Buenos días $usuario!"
    elif [ $hora_actual -ge 12 ] && [ $hora_actual -lt 20 ]; then
        saludo="¡Buenas tardes $usuario!"
    else
        saludo="¡Buenas noches $usuario!"
    fi

    echo $saludo
}

# Inicialización del script

# Ocultar el cursor
tput civis

clear

echo -e "\n hola"
echo
sleep 2

clear
tput civis
read -p "¿Cuál es tu nombre? " usuario
clear
tput cnorm

# Variables
fecha=$(date "+%A %d de %B del %Y a las %T")

# Mostrar la fecha y saludo
echo -e "\n ${greenColour}$fecha${endColour}"
echo -e "\n ${redColour}##############################################################################${endColour}\n\n"
saludar

echo -e "\n\n ${blueColour}Ingresaremos una nueva receta para la colección.${endColour} ${blueColour}Te doy la bienvenida, ${endColour}${yellowColour}$usuario${endColour}."
echo -e "\n ${redColour}##############################################################################${endColour}"

# Inicializar variables
declare -A ingredientes
total_costo=0

# Ruta de la carpeta donde se guardarán las recetas
carpeta_recetas="recetas"

# Verificar si la carpeta existe, si no, crearla
if [ ! -d "$carpeta_recetas" ]; then
    mkdir "$carpeta_recetas"
    echo -e "\n${greenColour}Carpeta 'recetas' creada.${endColour}"
fi

# Solicitar nombre del platillo
echo
read -p "Ingresa el nombre del platillo reemplazando espacios por guiones bajos: " nombre_platillo
archivo="${carpeta_recetas}/${nombre_platillo// /_}.txt"

# Crear archivo vacío y agregar encabezado
touch "$archivo"
if [ $? -ne 0 ]; then
    echo -e "\n${redColour}Error al crear el archivo $archivo${endColour}"
    exit 1
fi

# Agregar encabezado al archivo
{
    echo "Receta para: $nombre_platillo"
    echo "--------------------------------------"
} > "$archivo"

# Función para mostrar el menú de opciones
function mostrar_menu() {
    echo -e "\n${blueColour}Seleccione una opción:${endColour}"
    echo -e "${yellowColour}1) Agregar ingrediente${endColour}"
    echo -e "${yellowColour}2) Calcular costo de la receta${endColour}"
    echo -e "${yellowColour}3) Ayuda${endColour}"
    echo -e "${yellowColour}4) Salir${endColour}"
}

# Panel de ayuda
function help_panel(){
    echo -e "\n ${yellowColour}Agrega los ingredientes indicando si la cantidad está en gramos o kilos.${endColour}"
}

# Ciclo principal
while true; do
    mostrar_menu
    read -p "Opción: " opcion

    case $opcion in
        1)
            read -p "Nombre del ingrediente: " nombre
            read -p "Costo por kilo: " costo
            read -p "Cantidad en la receta: " cantidad
            read -p "¿La cantidad está en gramos o kilos? (ingresa 'g' o 'kg' según corresponda): " unidad

            # Convertir gramos a kilos si es necesario
            if [ "$unidad" == "g" ]; then
                cantidad=$(echo "scale=2; $cantidad / 1000" | bc)
            fi

            # Guardar ingrediente y costo
            ingredientes["$nombre"]="$costo:$cantidad"
            echo -e "\n\t ${greenColour}Ingrediente ${endColour}${redColour}$nombre${endColour}${greenColour} agregado.${endColour}"

            # Guardar en archivo con la unidad indicada
            echo "Ingrediente: $nombre, Costo por kilo: $costo, Cantidad: $cantidad kg" >> "$archivo"
            ;;

        2)
            total_costo=0
            echo -e "\n${blueColour}Calculando costo de la receta...${endColour}"
            echo "Ingredientes y costos:" >> "$archivo"

            # Calcular el costo total
            for ingrediente in "${!ingredientes[@]}"; do
                costo_info=(${ingredientes["$ingrediente"]//:/ })
                costo=${costo_info[0]}
                cantidad=${costo_info[1]}
                costo_total=$(echo "scale=2; $costo * $cantidad" | bc)
                total_costo=$(echo "scale=2; $total_costo + $costo_total" | bc)
                echo "$ingrediente: Costo total = $costo_total" >> "$archivo"
                echo "$ingrediente: Costo total = $costo_total"
            done

            echo -e "######################################################\n"
            read -p "Ingrese el factor de multiplicación (0.5, 2, 3, 4, 5): " factor
            echo -e "######################################################\n"
            read -p "Número de personas: " num_personas

            precio_venta=$(echo "scale=2; $total_costo * $factor / $num_personas" | bc)
            echo -e "\n ${yellowColour}Correcto${endColour}"
            echo -e "\n\t\t${blueColour}El precio de venta al público por plato:${endColour} ${greenColour}$precio_venta'00'${endColour}"

            # Guardar precio final en archivo
            echo "Precio de venta al público por plato: $precio_venta" >> "$archivo"
            echo "--------------------------------------" >> "$archivo"
            ;;

        3)
            clear
            help_panel
            ;;

        4)
            echo "Saliendo..."
            exit 0
            ;;

        *)
            echo -e "\n\t\t${redColour}Opción no válida. Intente de nuevo.${endColour}\n"
            ;;
    esac
done
