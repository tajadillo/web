#!/bin/bash
#Autor: Richard Tajadillo
#Comando para buscar archivos y directorios
# LICENCIA GNU GPL 3.0

#Aquí tienes un script en Bash que realiza los cálculos que has solicitado. El script permite al usuario agregar ingredientes con su costo al por mayor, calcular el costo según la receta y determinar el precio de venta al público.


#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
blackColour="\e[0;30m\033[1m"
whiteColour="\e[0;97m\033[1m"
darkGrayColour="\e[0;90m\033[1m"
#Esto cubre una amplia gama de colores ANSI que puedes usar para formatear texto en la terminal. ¡Espero que te sea útil!

#################################################################################################
#La mejor manera (y la más logica) para describirle una receta al cliente seria.                #
#1. Describir cual es la proteina o el ingrediente principal                                    #
#2. Cual es el metodo de cocción de dicho ingrediente                                           #
#3. Describir cual es la salsa o acompañante                                                    #
#4. Cual es el metodo de preparación de dicho acompañante                                       #
#       (de no conocer cual es el metodo de preparacion se puede saltar este paso)              #
#5. Describir cuales son las guarniciones para el ingrediente principal                         #
#################################################################################################



#############################
function ctrl_c(){
    clear
    sleep 1
    echo -e "\n ${yellowColour}Terminamos...${endColour} \n\n"
    tput cnorm
    exit 1
}

trap ctrl_c SIGINT

##############################


#saludo

function saludar(){
# Obtener la hora actual
hora_actual=$(date +'%H')

# Determinar el saludo basado en la hora
if [ $hora_actual -ge 5 ] && [ $hora_actual -lt 12 ]; then
    saludo="¡Buenos días!"
elif [ $hora_actual -ge 12 ] && [ $hora_actual -lt 20 ]; then
    saludo="¡Buenas tardes!"
else
    saludo="¡Buenas noches!"
fi

# Mostrar el saludo
echo $saludo
}

tput civis

clear
sleep 1

echo -e "\n hola"
echo
sleep 2

tput cnorm
read -p "cual es tu nombre? " usuario

sleep 2
clear
sleep 2
tput civis

echo -e "\n ${redColour}############################################################################### ${endColour}"
echo
echo
saludar
echo
echo
echo -e "\n ${yellowColour}Correcto${endColour} ${greenColour} $usuario ${endColour} ${yellowColour}Con este programa sacaremos el costo de tu menu. ${endColour}"
echo -e "\n ${redColour}############################################################################### ${endColour}"
sleep 4
clear
#fin saludo

# Función para mostrar el menú de opciones
function mostrar_menu() {
    echo -e "${blueColour}Seleccione una opción:${endColour}"
    echo -e "${yellowColour}1) Agregar ingrediente${endColour}"
    echo -e "${yellowColour}2) Calcular costo de la receta${endColour}"
    echo -e "${yellowColour}3) Ayuda${endColour}"
    echo -e "${yellowColour}4) Salir${endColour}"
}
#Fin menú

# Panel de ayuda
function help_panel(){
    #Uso del script:
    echo -e "\n ${blackColour}Agrega los ingredientes por su nombre, según la receta.${endColour}"
    echo -e "\n ${blackColour}Luego ingresarás cuanto te costó comprar cada producto al por mayor con tu proveedor.${endColour}"
    echo -e "\n ${blackColour}Seguidamente la cantidad que te pide la receta.${endColour}"
    echo -e "\n ${blackColour}Es de suma importancia consultar la tabla de equivalencias para tener las medidas en claridad${endColour}"
    echo -e "\n ${blackColour}¡Espero que te sea útil! Si tienes alguna pregunta o necesitas más modificaciones, no dudes en decírmelo.${endColour}\n"
}
#Fin ayuda


# Inicializar variables
declare -A ingredientes
total_costo=0

    echo -e "\n\t ${greenColour}consultar tabla de equivalencias para tener las medidas en claridad${endColour} \n\n"

# Ciclo principal
while true; do
    mostrar_menu
    echo
    read -p "Opción: " opcion

    case $opcion in
        1)
            read -p "Nombre del ingrediente: " nombre
            read -p "Costo por kilo (o unidad): " costo
            read -p "Cantidad en la receta (kilos o unidades): " cantidad
            ingredientes["$nombre"]="$costo:$cantidad"
            echo -e "\n \t ${greenColour}Ingrediente${endColour} ${redColour}$nombre${endColour} ${greenColour}agregado.${endColour}\n"
            ;;

        2)
            total_costo=0
            echo "Ingredientes y costos:"
            for ingrediente in "${!ingredientes[@]}"; do
                costo_info=(${ingredientes["$ingrediente"]//:/ })
                costo=${costo_info[0]}
                cantidad=${costo_info[1]}
                costo_total=$(echo "$costo / $cantidad" | bc)
                total_costo=$(echo "$total_costo + $costo_total" | bc)
                echo "$ingrediente: Costo total = $costo_total"
            done

            read -p "Ingrese el factor de multiplicación (0.5, 2, 3, 4, 5): " factor
            read -p "Número de personas: " num_personas

            precio_venta=$(echo "$total_costo * $factor / $num_personas" | bc)
            echo "Precio de venta al público por plato: $precio_venta'00'"
            ;;

        3)
            sleep 1
            clear
            help_panel
            ;;
        4)
            echo "Saliendo..."
            exit 0
            ;;

        *)
            echo "Opción no válida. Intente de nuevo."
            ;;
    esac
done
