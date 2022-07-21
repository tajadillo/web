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
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]${endColour}"
echo -e "${greenColour}Correcto${endColour}${grayColour} $nombre ${endColour} ${greenColour}Ahora vamos a programar dentro de cuanto tiempo quieres que suene tu alarma.${endColour}"

sleep 2 
tput civis

opc=0

while [ $opc -ne 2 ] ; do

    echo -e "\t\t\t\t\t${redColour}+-------------------+${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}1) Activar alarma${endColour} ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}2) salir${endColour}          ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}+-------------------+${endColour}"

tput cnorm
read -p "seleccione una opcion: " opc
    case $opc in

	1)clear
sleep 2
tput civis
echo -e "${grayColour}=========================================================${endColour}"
echo
echo -e "${purpleColour}Haz una pausa de determinada de TIEMPO. Donde el valor predeterminado puede ser 's' por segundos,
'm' para minutos, 'h' para horas o 'd' para días. El NÚMERO no necesita ser un entero. Incluso con dos o más argumentos,
puedes hacer una pausa por la cantidad de tiempo especificado por la suma de sus valores."
echo
echo -e "- Un minuto son 60 segundo"
echo
echo -e "- Una hora son 60 minutos"
echo
echo -e "Ejemplo 435m para indicar 7 horas con 15 minutos horas.${endColour}"
echo
echo -e "${redColour}[*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*]${endColour}"
echo -e "${redColour}[*][*][*]${endColour}${turquoiseColour} No apagues el computador por favor,                  ${endColour}${redColour}[*][*][*]${endColour}"
echo -e "${redColour}[*][*][*]${endColour}${turquoiseColour} y sube todo el volumen                               ${endColour}${redColour}[*][*][*]${endColour}"
echo -e "${redColour}[*][*][*]${endColour}${turquoiseColour} para que puedas escuchar mejor tu sistema de alarma  ${endColour}${redColour}[*][*][*]${endColour}"
echo -e "${redColour}[*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*][*]${endColour}"
echo
echo -e "${grayColour}=========================================================${endColour}"

sleep 4
		echo	
        echo -e ${greenColour}Indica la cantidad de tiempo que debe pasar para que se ejecute la alarma.${endColour}
        echo

		        echo -e "\t\t\t\t\t${greenColour}+-----------------------------------------------------------+${endColour}"
                echo -e "\t\t\t\t\t${greenColour}|${endColour} ${yellowColour}[*] indica la cantidad de ${greenColour}segundos${endColour} ${yellowColour}seguidos de la letra${endColour} ${greenColour}"s"${endColour} ${greenColour}|${endColour}"
                echo -e "\t\t\t\t\t${greenColour}| ${yellowColour}[*] indica la cantidad de ${greenColour}minutos${endColour} ${yellowColour}seguidos de la letra${endColour} ${greenColour}"m"${endColour} ${endColour} ${greenColour}|${endColour}"
                echo -e "\t\t\t\t\t${greenColour}| ${yellowColour}[*] indica la cantidad de ${greenColour}horas${endColour} ${yellowColour}seguidos de la letra${endColour} ${greenColour}"h"   ${endColour} ${greenColour}|${endColour}"
                echo -e "\t\t\t\t\t${greenColour}| ${yellowColour}[*] indica la cantidad de ${greenColour}dias${endColour} ${yellowColour}seguidos de la letra${endColour} ${greenColour}"d"    ${endColour} ${greenColour}|${endColour}"
                echo -e "\t\t\t\t\t${greenColour}+-----------------------------------------------------------+${endColour}"
tput cnorm
	    read -p "Indica la cantidad de tiempo que debe pasar para que se ejecute la alarma: " alarma 
		if [ "$alarma" = "$alarma" ]; then
            sleep $alarma && audacious /media/tajadillo/Nuevo\ vol/Music/hop-reggae-ton/bad-boys-2-by-jonili.mp3
            echo
            
        fi
	    sleep 2
	;;


	2)clear
        echo -e "\n\t${greenColour}[*]${endColour}${yellowColour}Terminamos${endColour}${greenColour}[*]${endColour}\n"
        echo
        sleep 2
        clear
    ;;
    esac

done
