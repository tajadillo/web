#!/bin/bash
#Autor: Richard Tajadillo
#Comando para buscar archivos y directorios
# LICENCIA GNU GPL 3.0

#Aquí tienes un script en Bash que realiza los cálculos que has solicitado. El script permite al usuario agregar ingredientes con su costo al por mayor, calcular el costo según la receta y determinar el precio de venta al público.


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
naranja="\033[38;2;243;134;48mgiant goldfish\033[0m"
#Esto cubre una amplia gama de colores ANSI que puedes usar para formatear texto en la terminal. ¡Espero que te sea útil!

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

echo -e "\n ${redColour}######################################################################### ${endColour}"
echo
echo
saludar
echo -e "\n ${yellowColour}Correcto${endColour} ${greenColour} $usuario ${endColour} ${yellowColour}\n Bienvenido a tu agenda. ${endColour}"
echo -e "\n ${redColour}######################################################################### ${endColour}"
sleep 3
clear
#fin saludo

clear

function varDatos(){
    tput cnorm
    echo -e "\n ${greenColour}Escribe el nombre: ${endColour}"
    read varNombre
    echo -e "\n ${greenColour}Escribe el número de telefono: ${endColour}"
    read varTel
    echo -e "\n ${greenColour}Escribe el e-mail: ${endColour}"
    read varMail
    echo -e "\n ${greenColour}Escribe la dirección: ${endColour}"
    read varDir
    clear
    echo -e "\n\n $varNombre \n\t Teléfono: $varTel \n\t E-mail: $varMail \n\t Dirección: $varDir" >> /media/tajadillo/TAJADILLO/web/mis-programas/recicladosGenericos/agenda/agenda.txt
    cat /media/tajadillo/TAJADILLO/web/mis-programas/recicladosGenericos/agenda/agenda.txt
}

function varBuscar(){
    echo -e "\n ${redColour}Cual es el nombre a buscar: ${endColour}"
    tput cnorm
    read varUsuario
    clear
    cat /media/tajadillo/TAJADILLO/web/mis-programas/recicladosGenericos/agenda/agenda.txt|grep -i $varUsuario -A 4
}

clear

echo -e "\n ${redColour}1)${endColour} ${yellowColour}Para ingresar datos${endColour}"
echo -e " ${redColour}2)${endColour} ${yellowColour}Para buscar usuario${endColour}\n"

read opc

if [ $opc -eq 1 ]; then
    clear
    varDatos
elif [ $opc -eq 2 ]; then
    clear
    varBuscar
else
    echo -e "\n ${redColour}La opción ingresada no es correcta${endColour}"
fi
    tput cnorm
