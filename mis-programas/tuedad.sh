#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

negro="\033[1;30m"
rojo="\033[1;31m"
verde="\033[1;32m"
amarillo="\033[1;33m"
azul="\033[1;34m"
morado="\033[1;35m"
cian="\033[1;36m"
blanco="\033[1;37m"




clear



trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Cancelado${endColour}"
	tput cnorm;
	exit 0
}


#variables
FECHA=$(date '+%A %d de %B')


echo -e ${grayColour}"Hola!"${endColour}
sleep 2
read -p "Como te llamas? " nombre
sleep 2
echo -e ${yellowColour}"Correcto${endColour} ${blueColour}$nombre"${endColour} "${yellowColour}Veamos cual es tu edad${endColour}"

sleep 2
tput civis
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e "\n${yellowColour}Este programa es para calcular la edad que tienes hasta el día de hoy${endColour} ${blueColour}$FECHA${endColour}."
echo -e "\n\t ${greenColour}Sigue las instrucciones a continuación:\n${endColour}"

tput cnorm

read -p "Introduce por favor el año de tu nacimiento: " YEAR
read -p "Introduce por favor el mes de tu nacimiento: " MES
read -p "Introduce por favor el día de tu nacimiento: " DIA

EDAD=$(($(date +%Y)-$YEAR))
if [ $(date +%m) -lt $MES ]; then
    EDAD=$(($EDAD-1))
elif [ $(date +%m) -eq $MES -a $(date +%d) -lt $DIA ]; then
    EDAD=$(($EDAD-1))
fi
echo
echo
echo -e "\t\t\t+------------------------+"
echo -e "\t\t\t| ${turquoiseColour}[*]${endColour} ${turquoiseColour}Tienes${endColour} ${yellowColour}$EDAD${endColour} ${turquoiseColour}años${endColour} ${turquoiseColour}[*]${endColour} |"
echo -e "\t\t\t+------------------------+"
echo
echo
echo

