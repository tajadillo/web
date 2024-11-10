#!/bin/bash
#########################################################################################
#Aplicación para academia de danzas
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
#touch $usuario.txt
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
echo -e "${redColour}******${endColour} ${greenColour}BIENVENIDO A LA ACADEMIA MIEL Y CANELA${endColour} ${redColour}******${endColour}"
echo -e "\n${blueColour}Ingresaras a los nuevos alumnos para poder verlos despues en un documento de texto${endColour}"
echo -e "\n ${greenColour}COMENCEMOS!!!${endColour} ${yellowColour}$usuario${endColour}"
echo -e "\n ${redColour}##############################################################################${endColour}"
sleep 6
clear

tput cnorm

    echo
    read -p "¿Cual es el nombre de quien estudia? " nombreAlumno

function ingresarDatos(){
    echo
    read -p "Ingresa la edad de $nombreAlumno " edadAlumno
    echo
    read -p "Ingresa su correo electronico " mailAlumno
    echo
    read -p "¿Cual es el Whatsapp de $nombreAlumno? " whatsappAlumno
}

function creador(){
    echo -e "\n\t$fecha\n\n\t****** BIENVENIDO A LA ACADEMIA MIEL Y CANELA ****** \n\t\t\t ****** Estos datos fueron agregados por ''$usuario'' ******\n" >> $nombreAlumno.txt
}

creador

ingresarDatos
touch $nombreAlumno.txt
echo -e "\n Nombre: $nombreAlumno \n Edad: $edadAlumno \n Correo Electronico: $mailAlumno \n Whatsapp: $whatsappAlumno" >> $nombreAlumno.txt

echo -e "\n\n\t\t${blueColour}Los datos fueron ingresados en${endColour} ${greenColour}$nombreAlumno${endColour} ${yellowColour}.txt${endColour}\n\n"
