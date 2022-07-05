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




trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Cancelado${endColour}"
	tput cnorm;
	exit 0
}


echo -e ${grayColour}"Hola!"${endColour}
sleep 2
read -p "Como te llamas? " nombre
sleep 2
echo -e ${yellowColour}"Correcto${endColour}${grayColour} $nombre"${endColour} "${yellowColour}hagamos limpieza${endColour}"

sleep 2
tput civis
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e "Este programa es para organizar tus archivos.\n"


sleep 2
 echo -e "\t${turquoiseColour}[*]${endColour}${yellowColour} Para mover todas las fotos a la carpeta Imágenes, escribe ${endColour}${grayColour}1"${endColour}
 echo -e "\t${turquoiseColour}[*]${endColour}${yellowColour} Para mover todas los documetos a la carpeta Documentos, escribe ${endColour}${grayColour}2"${endColour}
 echo -e "\t${turquoiseColour}[*]${endColour}${yellowColour} Para mover todos los videos a la carpeta Videos, escribe ${endColour}${grayColour}3"${endColour}
echo -e "\t${turquoiseColour}[*]${endColour}${yellowColour} Para copiar todas la música a la carpeta Música, escribe ${endColour}${grayColour}4\n"${endColour}

read -p  "Introduce el número: " numero

tput cnorm

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



    

