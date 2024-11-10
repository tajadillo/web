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
touch $usuario.txt
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
echo "****** BIENVENIDO A LA ACADEMIA MIEL Y CANELA ******" > $usuario.txt
echo -e "\n ${blueColour}COMENCEMOS!!!${endColour} ${yellowColour}$usuario${endColour}"
echo -e "\n ${redColour}##############################################################################${endColour}"
sleep 6
clear

################## cual es tu edad ##########################
    clear
echo
echo -e "\n ${blueColour}Correcto ${yellowColour}$usuario${endColour}. \n${blueColour}Vamos a calcular cual es la edad que tienes .${endColour}"
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

############ fin cual es tu edad #####################

clear
echo
echo -e "\n\tTienes $edad años $usuario" >> $usuario.txt

############ categoriaPorEdad ######################
echo
# Declaración de variables
#edad=0

# Verificación de la edad y horarios
if [ $edad -ge 6 ] && [ $edad -le 10 ]; then
    echo "Perteneces a categoria 'Menores A'" >> $usuario.txt
elif [ $edad -ge 11 ] && [ $edad -le 17 ]; then
    echo "Perteneces a categoria 'Menores Juveniles'" >> $usuario.txt
elif [ $edad -ge 18 ] && [ $edad -le 30 ]; then
    echo "Perteneces a categoria 'Mayores Juveniles'" >> $usuario.txt
elif [ $edad -ge 30 ] && [ $edad -le 50 ]; then
    echo "Perteneces a categoria 'Adultos'" >> $usuario.txt
elif [ $edad -ge 51 ]; then
    echo "Perteneces a categoria 'Master'" >> $usuario.txt
else
    echo "Ingresaste una edad que no corresponde"
    exit 1
fi
########## fin categoria por edad #######################

echo

############ Horarios#############
if [ $edad -ge 6 ] && [ $edad -le 10 ]; then
    echo "El horario es Lunes y Miércoles de 16:00 a 17:00" >> $usuario.txt
elif [ $edad -ge 11 ] && [ $edad -le 13 ]; then
    echo "El horario es Martes y Jueves de 16:30 a 17:30" >> $usuario.txt
elif [ $edad -ge 14 ] && [ $edad -le 17 ]; then
    echo "El horario es Miercoles y Viernes de 17:00 a 19:00" >> $usuario.txt
elif [ $edad -ge 18 ] && [ $edad -le 29 ]; then
    echo "El horario es Martes y Jueves de 17:30 a 19:00" >> $usuario.txt
elif [ $edad -ge 30 ] && [ $edad -le 50 ]; then
    echo "El horario es Lunes y Miércoles de 17:00 a 18:30" >> $usuario.txt
else
    echo -e "El horario es Martes y Sabado de 17:00 a 19:00" >> $usuario.txt
fi
########### fin horarios ##########################

