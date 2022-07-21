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
sleep 2
tput civis
echo -e ${yellowColour}"Correcto${endColour}${grayColour} $nombre"${endColour},
echo -e ${yellowColour}en este momento estas en la ruta:${endColour}
pwd
sleep 2
echo -e ${yellowColour}asi que "hagamos limpieza${endColour}"

sleep 4
clear
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e "${greenColour,}\nEste programa es para organizar tus archivos."${endColour}
echo -e "${greenColour}\t Sigue las instrucciones a continuacion:\n"${endColour}


sleep 4
echo -e "\t+-----------------------------------------------------------+ "
    echo -e "\t|  ${blueColour}1 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Para mover las fotos a la carpeta Imágenes: ${endColour}       |"
    echo -e "\t|  ${blueColour}2 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Para mover los documetos a la carpeta Documentos: ${endColour} |"
    echo -e "\t|  ${blueColour}3 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Para mover los videos a la carpeta Videos: ${endColour}        |"
    echo -e "\t|  ${blueColour}4 ${endColour}${turquoiseColour}[*]${endColour}${yellowColour} Para copiar la música a la carpeta Música: ${endColour}        |"

echo -e "\t+-----------------------------------------------------------+ "

tput cnorm
read -p  "Por favor introduce el número: " numero

case $numero in

1)
    find . -type f -iname "*.png" -exec mv "{}" Imágenes/ ";"
    find . -type f -iname "*.jpg" -exec mv "{}" Imágenes/ ";"
    find . -type f -iname "*.jpeg" -exec mv "{}" Imágenes/ ";"> /dev/null 2>&1;;

2)    
    find . -type f -iname "*.doc" -exec mv "{}" Documentos/ ";" 
    find . -type f -iname "*.txt" -exec mv "{}" Documentos/ ";"
    find . -type f -iname "*.pdf" -exec mv "{}" Documentos/ ";";
    find . -type f -iname "*.docx" -exec mv "{}" Documentos/ ";"
    find . -type f -iname "*.xls" -exec mv "{}" Documentos/ ";"> /dev/null 2>&1;;

3)
    find . -type f -iname "*.mp4" -exec mv "{}" Vídeos/ ";"> /dev/null 2>&1;;

4)
    find . -type f -iname "*.mp3" -exec cp "{}" Música/ ";"> /dev/null 2>&1;;



esac

echo -e "\n${yellowColour}[*]${endColour}${grayColour}Terminamos${endColour}"



    

