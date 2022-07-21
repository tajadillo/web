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

# https://weather.com/

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Cancelado${endColour}"
	tput cnorm;
	exit 0
}


#variables
FECHA=$(date '+%A %d de %B')


echo -e ${grayColour}"Hola!"${endColour}
sleep 1
read -p "Como te llamas? " nombre
sleep 2
echo -e ${yellowColour}"Correcto${endColour}${grayColour} $nombre"${endColour} "${yellowColour}veamos como esta el clima.${endColour}"

sleep 2
tput civis
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e "\n${greenColour}Este programa es para saber el estado del clima.${endColour}"
echo "ya sea donde estas ahora mismo, como en cualquier otra parte del mundo."
echo -e "\n${grayColour}También conocerás el estado del tiempo de hoy${endColour} ${blueColour}$FECHA${endColour} ${grayColour},como el de mañana, y pasado mañana.${endColour}"
sleep 3
echo -e "\n\t ${purpleColour}Sigue las instrucciones a continuacion:${purpleColour}\n"

sleep 2
echo -e "\t\t\t\t\t+-------------------------------------------+"
echo -e "\t\t\t\t\t| ${blueColour}a)${endColour}${yellowColour} El clima del sitio donde estas ahora: ${endColour} |"
echo -e "\t\t\t\t\t| ${blueColour}b)${endColour}${yellowColour} El clima de otra ciudad: ${endColour}              |"
echo -e "\t\t\t\t\t+-------------------------------------------+"


tput cnorm
read -p  "Por favor introduce el opcíon: " LETRA
if [ "$LETRA" = "a" ]; then
    curl http://wttr.in
elif [ "$LETRA" = "b" ]; then
    clear


echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e "\n${yellowColour}Si la ciudad de tu consulta tiene más de una palabra, separalas con un guion bajo${endColour} ${turquoiseColour}( _ )${endColour} ${yellowColour}.${endColour}\n"




    read -p "Pon el nombre de la ciudad por favor " CIUDAD
    curl http://wttr.in/$CIUDAD
else
    echo "Respuesta incorrecta"

fi

