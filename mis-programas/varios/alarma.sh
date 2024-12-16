#!/bin/bash

#Colours
rosaColour="\e[0;41m\101[1m"
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


function docActualizado(){
    actualizado=$( date -r ./alarma.sh  )
    echo
    echo -e "${redColour}este archivo se actualizo por ultima vez el${endColour} ${naranjaColour}$actualizado${endColour}"
    echo
}

trap ctrl_c INT

function ctrl_c(){
    echo
    echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
    tput cnorm;
    exit 0
}

function helpPanel(){
    echo
    echo -e "${redColour}#####################${endColour}"
    echo -e "${redColour}#                   #${endColour}"
    echo -e "${redColour}#  ${yellowColour}[*]${endColour}${grayColour} Uso:    ${endColour}     ${redColour}#${endColour}"
    echo -e "${redColour}#\t${purpleColour}h)${endColour}${yellowColour} Horas${endColour}    ${redColour}#${endColour}"
    echo -e "${redColour}#\t${purpleColour}m)${endColour}${yellowColour} Minutos${endColour}  ${redColour}#${endColour}"
    echo -e "${redColour}#\t${purpleColour}s)${endColour}${yellowColour} Segundos${endColour} ${redColour}#${endColour}"
    echo -e "${redColour}#                   #${endColour}"
    echo -e "${redColour}#####################${endColour}"


    echo
}

function dependencies(){
    tput civis
    clear;
    dependencies=(audacious)

    echo -e "${yellowColour}[*]${endColour}${grayColour} Comprobando programas necesarios...${endColour}"
    sleep 2

    for program in "${dependencies[@]}"; do
        echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Herramienta${endColour}${purpleColour} $program${endColour}${blueColour}...${endColour}"

        test -f /usr/bin/$program

        if [ "$(echo $?)" == "0" ]; then
            echo -e " ${greenColour}(V)${endColour}"
        else
            echo -e " ${redColour}(X)${endColour}\n"
            echo -e "${yellowColour}[*]${endColour}${grayColour} Instalando herramienta ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
            apt-get install $program -y > /dev/null 2>&1
            fi; sleep 1
        done
    }

    function banner(){
        echo -e "${redColour}     _    _             _____ __  __    _     ${endcolour}"
        echo -e "${greenColour}    / \  | |      / \  |  _ \|  \/  |  / \    ${endColour}"
        echo -e "${redColour}   / _ \ | |     / _ \ | |_) | |\/| | / _ \   ${endColour}"
        echo -e "${blueColour}  / ___ \| |___ / ___ \|  _ <| |  | |/ ___ \  ${endColour}"
        echo -e "${yellowColour} /_/   \_\_____/_/   \_\_| \_\_|  |_/_/   \_\ ${endColour}"

    }

    function saludo(){

        function saludar(){
            # Obtener la hora actual
            hora_actual=$(date +'%H')
            hora_segundos=$(date +'%R')

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
#saludo
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

tput civis
clear
sleep 2


######### VARIABLES ############
fecha=$(date "+%A %d de %B del %Y a las %T")
######### FIN VARIABLES ############
echo
echo -e "\n ${greenColour}$fecha${endColour}"

echo
echo
echo -e "\n ${redColour}##############################################################################${endColour}\n\n"

###############################
# llamar a la funcion saludar #
###############################
saludar
#########

echo -e "\n ${blueColour}Correcto ${yellowColour}$usuario${endColour}. \n${blueColour}Vamos a programar una alarma para avisarte a la hora que determines.${endColour}"
echo -e "\n ${redColour}##############################################################################${endColour}"
sleep 6
clear
echo -e "\n ${blueColour}COMENCEMOS!!!${endColour} ${yellowColour}$usuario${endColour}"
tput cnorm
sleep 2
clear


}

saludo
banner
echo
read -p "Escribe la cantidad de tiempo para que suene la alarma " cantidad
sleep 2
echo
helpPanel
echo
read -p "Escribe si seran horas, minutos o segundos " tipo
sleep 2
clear
banner
echo
if [ $tipo = "h" ]; then
    echo -e "${greenColour}Son las${endColour} ${naranjaColour}$hora_segundos${endColour} ${blackColour}$usuario${endColour} ${greenColour}Comenzamos en${endColour} ${blueColour}$cantidad horas${endColour}  ${redColour}presiona ctrl + c para detener${endColour}"

elif [ $tipo = "m" ]; then

    echo -e "${greenColour}Son las${endColour} ${naranjaColour}$hora_segundos${endColour} ${blackColour}$usuario${endColour} ${greenColour}Comenzamos en${endColour} ${blueColour}$cantidad minutos${endColour}  ${redColour}presiona ctrl + c para detener${endColour}"

elif [ $tipo = "s" ]; then
    echo -e "${greenColour}Son las${endColour} ${naranjaColour}$hora_segundos${endColour} ${blackColour}$usuario${endColour} ${greenColour}Comenzamos en${endColour} ${blueColour}$cantidad segundos${endColour}  ${redColour}presiona ctrl + c para detener${endColour}"
else
    echo -e "${redColour}¡¡¡Comando incorrcto!!!${endColour}"
fi

docActualizado

sleep $cantidad$tipo && audacious /media/tajadillo/RICHARD/Music/salsa/salsitas-forever/willy\ chirino/los-campeones-de-la-salsa.mp3
exit 0
