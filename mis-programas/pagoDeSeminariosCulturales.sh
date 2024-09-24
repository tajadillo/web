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
    saludo="¡Buenas noches $usuario!}"
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

echo -e "\n ${blueColour}Vamos a calcular los cobros por los distintos seminarios que se hagan .${endColour}"
echo -e "\n ${redColour}##############################################################################${endColour}"
sleep 15
clear
echo
echo -e "\n ${blueColour}COMENCEMOS!!!${endColour} ${yellowColour}$usuario${endColour}"
tput cnorm
sleep 2
clear


echo
read -p "¿cual es el pago básico por hora? " basicoPorHora
sleep 1
clear

echo
read -p "¿cual es la cantidad en total de horas al día? " totalHoras
sleep 1
clear

echo
read -p "¿cuantos días en total serán? " dias
sleep 1
clear

echo
read -p "¿el presupuesto para la movilidad diaria será de cuanto? " movilidadDiaria
sleep 1
clear

echo
read -p "¿y el presupuesto de la colacion diaria? " colacion
sleep 1
clear

echo
read -p "¿en total, cuanto costara el hospedaje por cada día presupuestados? " hospedaje
sleep 1
clear

echo
read -p "en caso de viajar a otra ciudad, ¿cuanto es el valor de los pasajes ida y vuelta? " pasajesViaje
clear

######### VARIABLES ############
totalHorasSeminario=$(($totalHoras*$dias))
viaticos=$(((($movilidadDiaria*4))+$((colacion*4))+$(($hospedaje*4))))
sueldoTotal=$(($viaticos*$totalHorasSeminario))
iva=$(($sueldoTotal*10/100))
######### FIN VARIABLES ############

clear
echo
echo -e "\n${redColour}##########################################################################${endColour}"
echo
echo -e "\n${greenColour}Correoto${endColour} ${yellowColor}$usuario.${endColour}\t ${greenColour}Al día de hoy${endColour} ${blueColour}$fecha${endColour} ${greenColour}el total de horas en el seminario sera de${endColour} ${grayColour}$totalHorasSeminario horas,${endColour} ${greenColour}los viaticos dan un total de${endColour} ${yellowColour}$ $viaticos${endColour} ${greenColour}mil pesos chilenos.${endColour}"
echo
echo -e "${greenColour}Por este motivo, el sueldo es de${endColour} ${yellowColour}$ $sueldoTotal${endColour} ${greenColour}pesos chilenos.${yellowColour}"
echo
echo -e "${greenColour}Si el cliente paga los${endColour} ${yellowColour}$ $iva${endColour} ${greenColour}mil pesos del IVA de.${endColour}"
echo
echo -e "\n${greenColour}El total a cobrar sera de${endColour} ${redColour}$(($sueldoTotal-$iva))${endColour} ${greenColour}pesos chilenos${endColour}"
echo
echo -e "\n${redColour}##########################################################################${endColour}"

echo
echo
read -p "pulsa la tecla ENTER para continuar" p
clear
exit
