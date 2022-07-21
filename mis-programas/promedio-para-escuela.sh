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

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Cancelado${endColour}"
	tput cnorm;
	exit 0
}



echo -e ${grayColour}"Hola!"${endColour}
sleep 1
read -p "Como te llamas? " nombre
tput civis

sleep 2 
clear
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]${endColour}"
echo -e "${greenColour}"Correcto${endColour}${yellowColour} $nombre"${endColour}"
echo -e "${greenColour}\nEn este programa calcularemos juntos el promedio de tus calificaciones.${endColour}"
echo -e "${greenColour}\t Sigue las instrucciones a continuacion:\n"${endColour}


sleep 4

opcion=0


while [ $opcion -ne 6 ]; do

echo -e "CALIFICACIONES EN LA ESCUALA \n\nASIGNATURAS:"
echo -e "\t\t\t\t${redColour}+-----------------------------------+${endColour} "
echo -e "\t\t\t\t${redColour}|${endColour}  ${blueColour}1 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Matemáticas                ${redColour}|${endColour}${endColour}\n"
echo -e "\t\t\t\t${redColour}|${endColour}  ${blueColour}2 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Física${endColour}                     ${redColour}|${endColour}\n"
echo -e "\t\t\t\t${redColour}|${endColour}  ${blueColour}3 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Química${endColour}                    ${redColour}|${endColour}\n"
echo -e "\t\t\t\t${redColour}|${endColour}  ${blueColour}4 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Ciencias de la Computación${endColour} ${redColour}|${endColour}\n"
echo -e "\t\t\t\t${redColour}|${endColour}  ${blueColour}5 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Biologia${endColour}                   ${redColour}|${endColour}\n"
echo -e "\t\t\t\t${redColour}|${endColour}  ${blueColour}6 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Salir${endColour}                      ${redColour}|${endColour}"
echo -e "\t\t\t\t${redColour}+-----------------------------------+${endColour} "


echo
echo
tput cnorm

read -p "Elige una opción "$nombre": " s1


if [ $s1 == 1 ]; then
        signature="Matemáticas"
        echo
        echo -e "\t${greenColour}Tu elegiste${endColour} ${blueColour} $signature ${endColour}"
        echo
elif [ $s1 == 2 ]; then
        signature="Física"
        echo
        echo -e "\t${greenColour}Tu elegiste${endColour} ${blueColour} $signature ${endColour}"
        echo
elif [ $s1 == 3 ]; then
        signature="Química"
        echo
        echo -e "\t${greenColour}Tu elegiste${endColour} ${blueColour} $signature ${endColour}"
        echo
elif [ $s1 == 4 ]; then
        signature="Ciencias de la Computación"
        echo
        echo -e "\t${greenColour}Tu elegiste${endColour} ${blueColour} $signature ${endColour}"   
        echo
elif [ $s1 == 5 ]; then
        signature="Biología"
        echo
        echo -e "\t${greenColour}Tu elegiste${endColour} ${blueColour} $signature ${endColour}"   
        echo

elif [ $s1 == 6 ]; then
        clear
        echo -e "\n\t${yellowColour}[*]${endColour}${redColour}Terminamos${endColour}${yellowColour}[*]${endColour}\n"
        sleep 2
        clear
        exit


else
        echo
        echo -e "\t${greenColour}Saldremos del programa, ya que tu elegiste una opción inválida${endColour}"        
        echo
        sleep 5
        clear
        exit

fi

read -p "$signature primer block: " f4
read -p "$signature segundo block: " s4
read -p "$signature tercer block: " t4
read -p "$signature adelante block: " f4

#sumar las 2 cifras de cada parcial y dividirlas entre 2 para luego sumar el resultado de cada parcial lo que dara como resultado el promedio total
echo -e "\nGRADOS"
p1=$(( f4 + s4 ))
let p1/=2
echo "primer partial: $p1"
p2=$(( t4 + f4 ))
let p2/=2
echo "Segundo partial: $p2"
average=$(( p1 +p2 ))
let average/=2
echo "Promedio del semestre en $signature: $average"
echo
echo

sleep 6 

clear

done
