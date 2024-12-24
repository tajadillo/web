#!/bin/bash

#Colours
rosa="\e[0;41m\101[1m"
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
naranjaColour="\033[38;2;243;134;0m"
#Esto cubre una amplia gama de colores ANSI que puedes usar para formatear texto en la terminal. ¡Espero que te sea útil!





# Configuración para las zonas horarias
TZ_PERU="America/Lima"
TZ_CHILE="America/Santiago"
TZ_BOLIVIA="America/La_Paz"

# Tamaño predeterminado del texto
FONT_SIZE=1

# Función para mostrar las horas con un tamaño específico
display_clocks() {
    clear
    TIME_PERU=$(TZ=$TZ_PERU date '+%H:%M:%S')
    TIME_CHILE=$(TZ=$TZ_CHILE date '+%H:%M:%S')
    TIME_BOLIVIA=$(TZ=$TZ_BOLIVIA date '+%H:%M:%S')

    case $FONT_SIZE in
        1) # Tamaño normal
            echo -e "\033[1;32mPerú:   $TIME_PERU\033[0m"
            echo -e "\033[1;34mChile:  $TIME_CHILE\033[0m"
            echo -e "\033[1;33mBolivia:  $TIME_BOLIVIA\033[0m"
            ;;
        2) # Tamaño grande
            echo -e "\033[1;32mPerú:\n$(figlet -f big $TIME_PERU)\033[0m"
            echo -e "\033[1;34mChile:\n$(figlet -f big $TIME_CHILE)\033[0m"
            echo -e "\033[1;33mBolivia:\n$(figlet -f big $TIME_BOLIVIA)\033[0m"
            ;;
        3) # Tamaño muy grande
            echo -e "\033[1;32mPerú:\n$(figlet -f slant $TIME_PERU)\033[0m"
            echo -e "\033[1;34mChile:\n$(figlet -f slant $TIME_CHILE)\033[0m"
            echo -e "\033[1;33mBolivia:\n$(figlet -f slant $TIME_BOLIVIA)\033[0m"
            ;;
        *) # Por defecto, tamaño normal
            echo -e "\033[1;32mPerú:   $TIME_PERU\033[0m"
            echo -e "\033[1;34mChile:  $TIME_CHILE\033[0m"
            echo -e "\033[1;33mBolivia:  $TIME_BOLIVIA\033[0m"
            ;;
    esac
}

# Mostrar menú de opciones
show_menu() {
    clear
    echo -e "Selecciona el tamaño de la fuente para mostrar las horas:"
    echo -e "  1 - Tamaño normal"
    echo -e "  2 - Tamaño grande"
    echo -e "  3 - Tamaño muy grande"
    echo -e "  q - Salir"
    echo -n "Opción: "
}

# Variable para controlar si el menú debe mostrarse
menu_shown=false

# Bucle infinito para mostrar la hora y capturar la entrada del usuario
while true; do
    if ! $menu_shown; then
        show_menu
        menu_shown=true
        read -n 1 key
        case $key in
            1) FONT_SIZE=1 ;;
            2) FONT_SIZE=2 ;;
            3) FONT_SIZE=3 ;;
            q) clear; exit 0 ;; # Salir
            *) menu_shown=false ;; # Si la entrada no es válida, volver a mostrar el menú
        esac
    fi

    # Mostrar las horas dinámicamente
    display_clocks
    sleep 1
done





######################### VARIABLES DEL CODIGO #########################################
########################################################################################
# Configuración para la zona horaria de Perú
#export TZ=America/Lima

# Bucle infinito para mostrar la hora actual
#while true; do
#    clear # Limpia la pantalla
#    echo -e "\033[1;32m$(date '+%H:%M:%S')\033[0m" # Muestra la hora en color verde
#    sleep 1 # Espera 1 segundo antes de actualizar
#done




# Configuración para la zona horaria de Perú
#export TZ=America/Lima

# Tamaño predeterminado del texto
#FONT_SIZE=1

# Función para mostrar la hora con un tamaño específico
#display_clock() {
#    clear
#    TIME=$(date '+%H:%M:%S')

#    case $FONT_SIZE in
#        1) echo -e "\033[1;32m$TIME\033[0m" ;;              # Tamaño normal
#        2) echo -e "\033[1;32m$(figlet -f big $TIME)\033[0m" ;; # Tamaño grande
#        3) echo -e "\033[1;32m$(figlet -f slant $TIME)\033[0m" ;; # Tamaño muy grande
#        *) echo -e "\033[1;32m$TIME\033[0m" ;;              # Por defecto
#    esac
#}

# Instrucciones para cambiar el tamaño
#show_instructions() {
#    echo -e "\nPresiona:"
#    echo -e "  1 - Tamaño normal"
#    echo -e "  2 - Tamaño grande"
#    echo -e "  3 - Tamaño muy grande"
#    echo -e "  q - Salir"
#}

#Bucle infinito para mostrar la hora y capturar la entrada
#while true; do
#    display_clock
#    show_instructions

    # Detectar entrada del usuario
#    read -t 1 -n 1 key
#    case $key in
#        1) FONT_SIZE=1 ;;
#        2) FONT_SIZE=2 ;;
#        3) FONT_SIZE=3 ;;
#        q) clear; exit 0 ;; # Salir
#    esac
#done
########################################################################################


######## listar tipo de fuente disponible en figlet ####################################
#    ls /usr/share/figlet/*.flf
