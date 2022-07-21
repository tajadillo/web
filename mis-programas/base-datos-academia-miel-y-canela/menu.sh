#!/bin/bash


#base de datos academia Miel y Canela
#autor: Richard Alexander Tajadillo Pérez

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


# https://weather.com/

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Cancelado${endColour}"
	tput cnorm;
	exit 0
}





#variables
OPCION=0
FECHA=$(date '+%A %d de %B')
NUEVO=""

echo -e ${grayColour}"Hola!"${endColour}
sleep 1
read -p "Como te llamas? " nombre
sleep 2
tput civis
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e ${yellowColour}"Correcto${endColour}${grayColour} $nombre"${endColour} "${yellowColour}ahora buscaremos a los bailarines de Miel y Canela.${endColour}"

sleep 2
tput civis

opc=0

while [ $opc -ne 3 ] ; do

    echo -e "\t\t\t\t\t${redColour}+--------------------------+${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}1) buscar a un alumno${endColour}    ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}2) ingresar nuevo alumno${endColour} ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}3) salir${endColour}                 ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}+--------------------------+${endColour}"

read -p "seleccione una opcion: " opc
tput cnorm
    case $opc in

	1)clear
	    read -p "Cual es el nombre del alumno?: " ALUMNO
		echo	
		if [ "$ALUMNO" = "$ALUMNO" ]; then
		  grep -iwe $ALUMNO base-datos.txt
		fi
        echo
	    sleep 2
	;;
	2)clear
        read -p "Escriba los nuevos datos: " NUEVO
        if [ "$NUEVO" = "$NUEVO" ]; then
	        echo $NUEVO >> base-datos.txt 
        fi
        sleep 2
	;;
	*) clear
        echo -e "\n\t${yellowColour}[*]${endColour}${redColour}Terminamos${endColour}${yellowColour}[*]${endColour}\n"
        sleep 2
        clear
    ;;
    esac

done
