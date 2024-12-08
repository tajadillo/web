#!/bin/bash
################################################
#Autor: Richard A. Tajadillo Pérez
#Copyright (C) 2024
# LICENCIA GNU GPL 3.0


#tabla de valores para los pagos en seminarios culturales

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
######################################################################



#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function ctrl_c(){
    echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
    tput cnorm; airmon-ng stop ${networkCard}mon > /dev/null 2>&1
    rm Captura* 2>/dev/null
    exit 0
}

clear

ip=$1

ping -c 1 $ip > ping.log

for i in $(seq 60 70); do
    if test $(grep ttl=$i ping.log -c) = 1; then
        echo -e "\n \t ${redColour}Es un sisteme operativo de Linux${endColour} \n"
    fi
done

for i in $(seq 100 200); do
    if test $(grep ttl=$i ping.log -c) = 1; then
        echo -e "\n \t ${redColour}Tiene un sisteme operativo Windows${endColour} \n"
    fi
done

rm ping.log

nmap -p- -sCV --open -sS --min-rate 5000 -n -Pn $ip -oN escaneo

tput cnorm






#                             _   _
#           o          |  o  | | | |
# _|_  __,     __,   __|     | | | |  __
#  |  /  |  | /  |  /  |  |  |/  |/  /  \_
#  |_/\_/|_/|/\_/|_/\_/|_/|_/|__/|__/\__/
#          /|
#          \|
