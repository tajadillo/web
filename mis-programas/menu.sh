#!/bin/bash
#Autor: Richard Tajadillo
#Comando para buscar archivos y directorios
# LICENCIA GNU GPL 3.0


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
    sleep 2
    echo -e "\n ${yellowColour}Terminamos...${endColour} \n\n"
    tput cnorm
    exit 1
}

trap ctrl_c SIGINT

##############################


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

echo -e "\n ${redColour}############################################################################### ${endColour}"
echo -e "\n ${yellowColour}Saludos${endColour} ${greenColour} $usuario ${endColour} ${yellowColour}Con este programa sacaremos el costo de tu menu. ${endColour}"
echo -e "\n ${redColour}############################################################################### ${endColour}"
sleep 4
clear
#fin saludo

#======================================================================================================
#Programa para generar el presio de venta al cliente final que se le pondra a cada plato en base a un menu y una lista de presios de los productos necesarios

#ingresar los ingredientes de la receta y guardarlos en un txt

#ingresar los presios de cada uno de los ingredientes y guardarlos en el mismo txt

#dividir el total de la unidad de medicion en los que se compra cada uno de los ingredientes entre el presio de compra al proveedor

#multiplicar el resultado anterior por la cantidad solicitada en la receta (el resultado sera el costo de ingrediente segun la receta)

#sumar todos los costos por receta

#al total de los costos aumentarle su 20%

# dividir el costoTotalReceta entre la cantidad de personas que dicta la receta

# multiplicar el valor anterior por el valor a considerar (facotor 0.5, 2, 3, 4, 5) "presioPlatoVendido"
#======================================================================================================


opc1=0
varFecha=$(date)
#presioPlatoVendido=

echo -e "\n ${yellowColour}Correcto${endColour} ${greenColour}$usuario${endColour} \n
${yellowColour}ahora sigue las instrucciones${endColour} "

sleep 4
clear

#while [ $opc1 -ne 2 ] ; do
#clear
#sleep 2
#echo -e "\n 1) Ingresar los ingredientes"
#echo -e "\n 2) Salir"

#read -p "Selecciona una opción: " opc

#case $opc in
#    1)clear
#        sleep 2
#        #echo -e "\n Esta es la opción 1"
#        if [ ingrediente == 1 ]; then
#            read -p "Igresa el primer ingrediente: " ingrediente1
#        fi
#        ;;
#    2)clear
#        sleep 2
#        #echo -e "\n Esta es la opción 2"
#        clear
#        sleep 2
#        exit
#    *) echo -e "\n $opc no es una opción valida"
#esac
#done


