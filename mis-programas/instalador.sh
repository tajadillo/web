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
echo -e ${yellowColour}"Correcto${endColour}${grayColour} $nombre"${endColour} "${yellowColour}comencemos a instalar algunas cosas.${endColour}"

sleep 2
tput civis
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e "\n${greenColour}Este programa es para instalar algunas de las cosas que te gustan tener de forma básica para tu interfase de linux basado en ubuntu y deribadas.${endColour}"

sleep 3
echo -e "\n\t ${purpleColour}Sigue las instrucciones a continuacion:${purpleColour}\n"

sleep 2
echo -e "\t\t\t\t\t${blueColour}a)${endColour}${yellowColour} Reloj en la terminal: ${endColour}"
echo -e "\t\t\t\t\t${blueColour}b)${endColour}${yellowColour} Reproductor de música desde la terminal: ${endColour}\n"
echo -e "\t\t\t\t\t${blueColour}c)${endColour}${yellowColour} Escuchar radio online desde la terminal: ${endColour}"
echo -e "\t\t\t\t\t${blueColour}d)${endColour}${yellowColour} Revisar agenda: ${endColour}"
echo -e "\t\t\t\t\t${blueColour}e)${endColour}${yellowColour} Cliente de correo electronico: ${endColour}"



tput cnorm
read -p "Por favor introduce una opcíon: " LETRA
if [ "LETRA" = "a" ]; then
    sudo apt-get install tty-clock

    elif [ "LETRA" = "b" ]; then
	sudo apt-get install moc

    elif [ "LETRA" = "c" ]; then
    mkdir radio
	touch radio/radio
	echo #!/bin/bash
		curl https://www.tdtchannels.com/lists/radio.m3u > radio.m3u
		cvlc --extraintf ncurses radio.m3u >> radio/radio
		chmod +x radio

    elif [ "LETRA" = "d" ]; then
	sudo apt-get install calcurse

    elif [ "LETRA" = "e" ]; then
	sudo apt-get install mutt

#   elif [ "LETRA" = "b" ]; then
#	sudo apt-get install moc
#
#   elif [ "LETRA" = "b" ]; then
	sudo apt-get install moc
#
#   elif [ "LETRA" = "b" ]; then
#	sudo apt-get install moc
#
#   elif [ "LETRA" = "b" ]; then
#	sudo apt-get install moc
#
#   elif [ "LETRA" = "b" ]; then
#	sudo apt-get install moc
#
#   elif [ "LETRA" = "b" ]; then
#	sudo apt-get install moc
#
#   elif [ "LETRA" = "b" ]; then
#	sudo apt-get install moc
#
#   elif [ "LETRA" = "b" ]; then
#	sudo apt-get install moc

    else
	echo "Respuesta incorrecta"

fi
