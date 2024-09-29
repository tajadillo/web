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



#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
trap ctrl_c INT

function ctrl_c(){
    clear
    echo
    echo -e "\n${yellowColour}[*]${endColour}${redColour}Saliendo${endColour}${yellowColour}[*]${endColour}"
    tput cnorm; airmon-ng stop ${networkCard}mon > /dev/null 2>&1
    rm Captura* 2>/dev/null
    exit 0
}

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
echo

echo -e "\n ${blueColour}Correcto ${yellowColour}$usuario${endColour}. \n${blueColour}Vamos a calcular cual es la edad que tienes .${endColour}"
echo -e "\n ${redColour}##############################################################################${endColour}"
sleep 15
clear
echo
echo -e "\n ${blueColour}COMENCEMOS!!!${endColour} ${yellowColour}$usuario${endColour}"
tput cnorm
sleep 2
clear

read -p "Introduce tu año de nacimiento: " ano
read -p "Introduce tu mes de nacimiento: " mes
read -p "Introduce tu día de nacimiento: " dia

edad=$(($(date +%Y) - ano))

if [ $(date +%m) -lt $mes ]; then
    edad=$(($edad-1))
elif [ $(date +%m) -eq $mes -a $(date +%d) -lt $dia ]; then
    edad=$(($edad-1))
fi

echo -e "Tienes $edad anos "


#                             _   _
#           o          |  o  | | | |
# _|_  __,     __,   __|     | | | |  __
#  |  /  |  | /  |  /  |  |  |/  |/  /  \_
#  |_/\_/|_/|/\_/|_/\_/|_/|_/|__/|__/\__/
#          /|
#          \|
