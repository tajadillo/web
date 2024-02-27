#!/bin/bash
#Autor: Richard Tajadillo
#Comando para fuscar archivos y directorios

# comando find (buscar)
#

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

echo -e "\n ${redColour}################################################################## ${endColour}"
echo -e "\n ${yellowColour}Saludos${endColour} ${greenColour} $usuario ${endColour} ${yellowColour}Este programa esta diseñado para realizar ficheros y directorios \n dentro de una gerarquia. ${endColour}"
echo -e "\n ${redColour}################################################################## ${endColour}"

sleep 3

echo -e "\n ${purpleColour}Ahora nos encontramos en el dirctorio. ${endColour}"
pwd
#fin saludo

#menú 1
sleep 2

#-type
#para buscar fichero "f"
#para buscar un enlace "l"
#para buscar directorio "d"

echo -e "\n ${blueColour}¿que quieres buscar? ${endColour}"
#menu1=0

echo -e "\n ${yellowColour}1)${endColour} ${redColour}un fichero${endColour}"
#echo -e "\n ${yellowColour}2)${endColour} ${redColour}un enlace${endColour}"
echo -e "\n ${yellowColour}2)${endColour} ${redColour}un directorio${endColour}"
#echo -e "\n ${yellowColour}4)${endColour} ${redColour}salir${endColour}"
echo
read -p "Selecciona una opción: " menu1
clear
sleep 1

if
    [ "$menu1" == "1" ]; then
    echo -e "el fichero lo quieres buscar por: "
    echo -e "\n a) Nombre de fichero"
    echo -e "\n b) Tipo de fichero \n"
    read -p "Elije una opción: " menuFichero
    clear
    sleep 1
    if
        [ "$menuFichero" == "a" ]; then
        read -p "¿Donde se buscará el fichero? " dondeFichero
        read -p "¿cual es el nombre del fichero? " nombreFichero
        find $dondeFichero -iname "$nombrenombre*" -type f
        clear
        sleep 1
    elif
        [ "$menuFichero" == "b" ]; then
        read -p "¿Donde se buscará el fichero? " dondeFichero
        read -p "¿cual es la extención de fichero que buscas? " extencionFichero
        find $dondeFichero -iname "*.$extencionFichero" -type f
        sleep 1
    else
        exit 1
    fi
    echo -e "${greenColour}presiona la tecla enter para terminar${endColour}"
    read -p " " p
    clear




else
    read -p "¿Donde se buscará el directorio? " dondeDirectorio
    read -p "¿Cual es el nombre del directorio? " nombreDirectorio
    find $dondeDirectorio -iname $nombreDirectorio -type d
    echo -e "${greenColour}presiona la tecla enter para terminar${endColour}"
    read -p " " p
    clear


#elif
#    [ "menu1" == "4" ] then
#    exit 1
#else
#    #echo -e "Selecciona una opción valida"
#    echo -e "no vale"
fi

tput cnorm

