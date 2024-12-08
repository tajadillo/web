#!/bin/bash
#########################################################################################
#tabla de valores para los pagos en seminarios culturales
#Autor: Richard A. Tajadillo Pérez
#Copyright (C) 2024
# LICENCIA GNU GPL 3.0

#Este programa es software libre: puedes redistribuirlo y/o modificarlo
#bajo los términos de la Licencia Pública General GNU publicada por
#la Free Software Foundation, ya sea la versión 3 de la Licencia, o
#(a su elección) cualquier versión posterior.

#Este programa se distribuye con la esperanza de que sea útil.
#pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de
#COMERCIABILIDAD o IDONEIDAD PARA UN FIN DETERMINADO.
#Ver Licencia pública general #GNU para más detalles.

#Deberías haber recibido una copia de la Licencia Pública General GNU
#junto con este programa.  En caso contrario, consulte <http://www.gnu.org/licenses/>.
########################################################################################

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Manejador de interrupciones (Ctrl + C)
trap ctrl_c INT

function ctrl_c(){
    clear
    echo
    echo -e "\n${yellowColour}[*]${endColour}${redColour} Saliendo...${endColour}${yellowColour}[*]${endColour}"
    tput cnorm; airmon-ng stop ${networkCard}mon > /dev/null 2>&1
    rm Captura* 2>/dev/null
    exit 0
}

# Función para saludar
function saludar(){
    # Obtener la hora actual
    hora_actual=$(date +'%H')

    # Determinar el saludo basado en la hora
    if [ $hora_actual -ge 5 ] && [ $hora_actual -lt 12 ]; then
        saludo="¡Buenos días $usuario!"
    elif [ $hora_actual -ge 12 ] && [ $hora_actual -lt 20 ]; then
        saludo="¡Buenas tardes $usuario!"
    else
        saludo="¡Buenas noches $usuario!"
    fi

    # Mostrar el saludo
    echo $saludo
}

# Ocultar el cursor
tput civis

clear

echo -e "\n hola"
echo
sleep 2

# Mostrar el cursor para solicitar el nombre
tput cnorm
read -p "¿Cuál es tu nombre? " usuario

clear
sleep 2
tput civis

######### VARIABLES ############
fecha=$(date "+%A %d de %B del %Y a las %T")
######### FIN VARIABLES ############
echo
echo -e "\n ${greenColour}$fecha${endColour}"
echo -e "\n ${redColour}##############################################################################${endColour}\n\n"

# Llamar a la función de saludo
saludar
echo -e "\n\n ${blueColour}Vamos a calcular cuánto se gastó en la lista de compras.${endColour} ${blueColour}Te doy la bienvenida, ${endColour}${yellowColour}$usuario${endColour}."
echo -e "\n ${redColour}##############################################################################${endColour}"
sleep 7
clear
echo
echo -e "\n ${blueColour}¡COMENCEMOS!${endColour} ${yellowColour}$usuario${endColour}"
tput cnorm
sleep 2

##########################
# Inicializamos variables
##########################
declare -A carrito
total=0

# Función para mostrar el menú
function mostrar_menu(){
    echo -e "\n${redColour}1.${endColour} ${purpleColour}Agregar producto${endColour}"
    echo -e "${redColour}2.${endColour} ${purpleColour}Mostrar total${endColour}"
    echo -e "${redColour}3.${endColour} ${purpleColour}Salir${endColour}"
}

# Función para agregar producto
function agregar_producto(){
    echo -e "\n\n${greenColour}Ingrese el nombre del producto: ${endColour}"
    read producto
    echo -e "${greenColour}Ingrese el precio del producto: ${endColour}"
    read precio

    # Validar si el precio es un número válido
    if [[ ! $precio =~ ^[0-9]+$ ]]; then
        echo -e "${redColour}Error: El precio debe ser un número.${endColour}"
        return
    fi

    # Añadimos al carrito y actualizamos el total
    carrito["$producto"]=$precio
    total=$(($total + $precio))
    clear
    echo -e "${yellowColour}$producto${endColour} ${purpleColour}agregado al carrito por${endColour} ${redColour}$precio${endColour}"
}

# Función para mostrar el total
function mostrar_total(){
    sleep 2
    clear

    if [[ ${#carrito[@]} -gt 0 ]]; then
        echo -e "\n${greenColour}Productos en el carrito:${endColour}"
        # Iterar sobre los productos en el carrito
        for producto in "${!carrito[@]}"; do
            echo -e "${blueColour}$producto:${endColour} ${yellowColour}${carrito[$producto]}${endColour}"
        done
        echo -e "\n${greenColour}Total a pagar:${endColour} ${redColour}$total${endColour}"
    else
        echo -e "\n${greenColour}No se ingresaron productos en el carrito.${endColour}"
        echo -e "\n${greenColour}Total a pagar:${endColour} ${redColour}0${endColour}"
    fi
}

# Función principal que controla el flujo del programa
function main(){
    while true; do
        sleep 3
        mostrar_menu
        echo -e "\n\n${blueColour}Seleccione una opción: ${endColour}"
        read opcion

        case $opcion in
            1)
                agregar_producto
                ;;
            2)
                mostrar_total
                ;;
            3)
                echo -e "\n\n\t${yellowColour}¡¡¡${endColour}${greenColour}Gracias por calcular la lista de compras con este programa.${endColour}${yellowColour}!!!${endColour}\n\n"
                break
                ;;
            *)
                echo -e "\n\n\t${yellowColour}¡¡¡${endColour}${redColour}Opción inválida. Por favor, seleccione una opción válida.${endColour}${yellowColour}!!!${endColour}"
                ;;
        esac
    done
}

# Ejecutar la función principal
main

