#!/bin/bash
#Autor: Richard Tajadillo
#Comando para buscar archivos y directorios
# LICENCIA GNU GPL 3.0

#Aquí tienes un script en Bash que realiza los cálculos que has solicitado. El script permite al usuario agregar ingredientes con su costo al por mayor, calcular el costo según la receta y determinar el precio de venta al público.


#Colours
rosa="\e[0;41m\101[1m"
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
blackColour="\e[0;30m\033[1m"
whiteColour="\e[0;97m\033[1m"
darkGrayColour="\e[0;90m\033[1m"
naranja="\033[38;2;243;134;48mgiant goldfish\033[0m"
#Esto cubre una amplia gama de colores ANSI que puedes usar para formatear texto en la terminal. ¡Espero que te sea útil!

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


#saludo

function saludar(){
    # Obtener la hora actual
    hora_actual=$(date +'%H')

# Determinar el saludo basado en la hora
if [ $hora_actual -ge 5 ] && [ $hora_actual -lt 12 ]; then
    saludo="¡Buenos días!"
elif [ $hora_actual -ge 12 ] && [ $hora_actual -lt 20 ]; then
    saludo="¡Buenas tardes!"
else
    saludo="¡Buenas noches!"
fi

# Mostrar el saludo
echo $saludo
}

tput civis

clear
sleep 1

echo -e "\n hola"
echo
sleep 2

tput cnorm
read -p "cual es tu nombre? " usuario

clear
tput civis

curl https://tablademareas.com/cl/arica-parinacota/arica#_mareas > ~/Escritorio/pesca.log 2>/dev/null

cat ~/Escritorio/pesca.log | grep '<p class="txt_descripcion">' >/dev/null

if [ "$(echo $?)" -eq "0" ]; then

    echo -e "\n ${yellowColour}######################################################################### ${endColour}"
    echo -e " ${purpleColour}$(saludar)${endColour} ${greenColour} $usuario ${endColour} ${purpleColour} Bienvenido a${endColour} ${redColour}la tabla de mareas de Arica.${endColour}"
    echo -e " ${yellowColour}######################################################################### ${endColour}"
    #clear
    #fin saludo

    hora_actual=$(date +'%d-%m-%y')

    function tablaMareas(){
        cat ~/Escritorio/pesca.log | grep '<p class="txt_descripcion">' | sed 's/<p class="txt_descripcion"> //g' | tr -d "/" | sed 's/<p>//g' | sed 's/         <p class="txt_descripcion">//g' | sed 's/strong//g' | sed 's/span class//g' | sed 's/naranja//g' | sed 's/small//g' | sed 's/span//g' | sed 's/a href=//g' | sed 's/class=//g' | sed 's/azul//g' | sed 's/ target="_self" "integrate_link"//g' | sed 's/ style=//g' | sed 's/font-size:er; letter-spacing:-2px//g' | sed 's/font-size:80%;//g' | sed 's/rojo//g' | sed 's/font-size:50%//g' | sed 's/font-size:84%;//g' | sed 's/<div>//g' | tr -d '/' | sed 's/  //g' | tr "'" " " | tr -d '=' | tr -d '<>' | sed 's/     //g' | sed 's/h.p/h/g' | sed 's/ pp "txt_descripcion"//g' | sed 's/"txt_descripcion"//g' | sed 's/"/" /g' | sed 's/" txt_descricion"//g'
    }

    function nivelAgua(){
        cat ~/Escritorio/pesca.log | grep 'brujula_mareas_texto_pc grafico_estado_actual_texto2' | sed 's/<div class="brujula_mareas_texto_pc grafico_estado_actual_texto2"> //' | sed 's/span class//g' | sed 's/strong//g' | sed 's/div//g' | sed 's/azul//g' | tr "'" " " | tr -d '=' | tr -d '<>' | sed 's/span//g' | tr -d '/' | sed 's/  //g'
    }

    echo -e "${turquoiseColour}$(tablaMareas)${endColour}"
    echo -e "\n ${redColour}$(nivelAgua)${endColour}"
    echo -e "\n ${turquoiseColour}Correcto${endColor} ${yellowColour}$usuario${endColour} ${turquoiseColour}que pases una buena jornada de pesca${endColour}"
    echo -e "\n ${yellowColour}######################################################################### ${endColour}"

else
    echo -e "${redColour}¡¡¡ ${endColour}${greenColour}No hay conectividad a internet${endColour} ${yellowColour}$usuario${endColour}${redColour} !!!${endColour}"
fi

rm ~/Escritorio/pesca.log

tput cnorm
