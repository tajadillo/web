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

####################################################################################################
#Se necesita un algoritmo para una veterinaria que determine el precio de las atenciones dadas a una mascota. tener en cuenta que el usuario deberá ingresar:

# 1 para servicio de baño. valor $3500
# 2 para servicio de peluqueria. valor $6000
# 3 para vacunación. valor 12500
# 4 para servicio de baño y peluqueria
# 5 para los 3 servicios
# 6 para baño y vacunación
# 7 para peluqueria y vacunación

#En base a la opción ingresada se deberá mostrar por pantalla el monto gastado por el propietario.
####################################################################################################

bano=3500
peluqueria=6000
vacunacion=12500
banoPel=$(( $bano+ $peluqueria ))
banoVac=$(( $bano + $vacunacion ))
pelVac=$(( $peluqueria + $vacunacion ))
todo=$(( $bano + $peluqueria + $vacunacion ))
opc4=$(echo -e "baño y peluqueria")
opc5=$(echo -e "baño, peluqueria y vacunación")
opc6=$(echo -e "baño y vacunación")
opc7=$(echo -e "peluqueria y vacunación")

clear
echo -e "\n \t ${yellowColour}******${endColour} ${greenColour}Bienvenido a la veterinaria TAJADILLO${endColour} ${yellowColour}******${endColour} \n"
sleep 1

echo -e "Por favor seleccione un servicio "
echo

echo -e "${redColour}1.${endColour}${blueColour}baño.${endColour}"
echo -e "${redColour}2.${endColour}${blueColour}peluqueria.${endColour}"
echo -e "${redColour}3.${endColour}${blueColour}vacunación.${endColour}"
echo -e "${redColour}4.${endColour}${blueColour}baño y peluqueria${endColour}"
echo -e "${redColour}5.${endColour}${blueColour}los 3 servicios${endColour}"
echo -e "${redColour}6.${endColour}${blueColour}baño y vacunación${endColour}"
echo -e "${redColour}7.${endColour}${blueColour}peluqueria y vacunación${endColour}"
echo
read servicio
if [ $servicio -eq 1 ]; then
    echo -e "${greenColour}El servicio de baño cuesta:${endColour} ${redColour}$ $bano${endColour}"
elif [ $servicio -eq 2 ]; then
    echo -e "${greenColour}El servicio de peluqueria cuesta:${endColour} ${redColour}$ $peluqueria${endColour}"
elif [ $servicio -eq 3 ]; then
    echo -e "${greenColour}El servicio de vacunacion cuesta:${endColour} ${redColour}$ $vacunacion${endColour}"
elif [ $servicio -eq 4 ]; then
    echo -e "${greenColour}El servicio de $opc4 cuesta:${endColour} ${redColour}$ $banoPel${endColour}"
elif [ $servicio -eq 5 ]; then
    echo -e "${greenColour}Los servicios de $opc5 tienen un total de:${endColour} ${redColour}$ $todo${endColour}"
elif [ $servicio -eq 6 ]; then
    echo -e "${greenColour}Los servicios de $opc6 tienen un total de:${endColour} ${redColour}$ $banoVac${endColour}"
elif [ $servicio -eq 7 ]; then
    echo -e "${greenColour}Los servicios de $opc7 tienen un total de:${endColour} ${redColour}$ $pelVac${endColour}"
else
    echo -e "\n ${redColour}La opción ingresada no es correcta${endColour}"
fi

