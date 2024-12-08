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


trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
	tput cnorm; airmon-ng stop ${networkCard}mon > /dev/null 2>&1
	rm Captura* 2>/dev/null
	exit 0
}

function helpPanel(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Uso: ${endColour}"
	echo -e "\n\t${purpleColour}h)${endColour}${yellowColour} Horas${endColour}"
	echo -e "\t${purpleColour}m)${endColour}${yellowColour} Minutos${endColour}"
	echo -e "\t${purpleColour}s)${endColour}${yellowColour} Segundos${endColour}\n"
	exit 0
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
echo -e "     _    _             _____ __  __    _     "
echo -e "    / \  | |      / \  |  _ \|  \/  |  / \    "
echo -e "   / _ \ | |     / _ \ | |_) | |\/| | / _ \   "
echo -e "  / ___ \| |___ / ___ \|  _ <| |  | |/ ___ \  "
echo -e " /_/   \_\_____/_/   \_\_| \_\_|  |_/_/   \_\ "

}

function saludo(){

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
