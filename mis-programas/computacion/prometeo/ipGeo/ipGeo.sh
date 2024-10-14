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

### Banner
function banner(){
    clear
    echo
    echo
    sleep 0.15 && echo -e "\t${redColour}                             _   _        ${endColour}"
    sleep 0.15 && echo -e "\t${redColour}           o          |  o  | | | |       ${endColour}"
    sleep 0.15 && echo -e "\t${redColour} _|_  __,     __,   __|     | | | |  __   ${endColour}"
    sleep 0.15 && echo -e "\t${redColour}  |  /  |  | /  |  /  |  |  |/  |/  /  \_ ${endColour}"
    sleep 0.15 && echo -e "\t${redColour}  |_/\_/|_/|/\_/|_/\_/|_/|_/|__/|__/\__/  ${endColour}"
    sleep 0.15 && echo -e "\t${redColour}          /|                              ${endColour}"
    sleep 0.15 && echo -e "\t${redColour}          \|                              ${endColour}"
    echo
    echo
    tput civis
}

function tracker(){
    tput cnorm
    read -p "escribe la ip: " ip
    curl -s https://ipinfo.io/$ip > /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log 2>/dev/null

    IP=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i ip)
    HOSTNAME=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i hostname)
    CITY=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i city)
    REGION=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i region)
    PAIS=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i country)
    COORDENADAS=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i loc)
    HORARIO=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i timezone)
    POSTAL=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i postal)
    NOMBRE=$(cat /media/tajadillo/TAJADILLO/web/mis-programas/computacion/prometeo/ipGeo/ipGeo.log | grep -i org)

    sleep 2
    clear

    echo -e "\n ${purpleColour}Los datos de la IP${endColour} ${turquoiseColour}'$ip${endColour}' ${purpleColour}son:"
    echo -e "\n ${yellowColour}$HOSTNAME${endColour}"
    echo -e "\n ${greenColour}$CITY${endColour}"
    echo -e "\n ${blueColour}$REGION${endColour}"
    echo -e "\n ${yellowColour}$PAIS${endColour}"
    echo -e "\n ${redColour}$COORDENADAS${endColour}"
    echo -e "\n ${blueColour}$HORARIO${endColour}"
    echo -e "\n ${yellowColour}$POSTAL${endColour}"
    echo -e "\n ${greenColour}$NOMBRE${endColour}"
    rm -rf iptracker.log; tput cnorm
    echo -e "\n ${turquoiseColour}Terminamos...${endColour} \n\n"
    exit 0
}

banner

echo
echo

tracker
tput cnorm
