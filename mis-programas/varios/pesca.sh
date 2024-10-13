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
        cat ~/Escritorio/pesca.log | grep '<p class="txt_descripcion">' | sed 's/<p class="txt_descripcion"> / /g' | sed 's/<p class="txt_descripcion">/ /g' | sed 's/<strong>//g' | tr -d '/' | sed 's/<strong>//g' | sed 's/<span>//g' | sed 's/span//g' | sed 's/small//g' | sed 's/class//g' | sed 's/<p>//g' | sed 's/naranja//g' | sed 's/style//g' | sed 's/font-size//g' | sed 's/azul//g' | sed 's/rojo//g' | sed 's/<div>//g' | sed 's/integrate_link//g' | sed 's/https:tablademareas.com*//g' | sed 's/:er; letter-spacing:-2px//g' | sed 's/<a href="" target="_self" ="">//g' | sed 's/<a>//g' | sed 's/:80%;//g' | sed 's/:50%//g' | sed 's/:84%;//g' | sed 's/<a href="https:tablademareas.comclarica-parinacotaaricaprevisionoleaje">//g' | sed 's/<a href="https:tablademareas.comclarica-parinacotaaricaprevisiontiempo">//g' | sed 's/<a href="https:tablademareas.comclarica-parinacotaaricaprevisionviento">//g' | tr -d '=' | tr -d '<>' | tr "'" " " | sed 's/       //g' | sed 's/    / /g' | sed 's/    / /g' | sed 's/En el gráfico de pleamares y bajamares,//g' | sed 's/En el siguiente gráfico se muestra la progresión del coeficiente de mareas durante el mes de octubre de 2024. //g' | sed 's/Hoy  sábado, 12 de octubre de 2024, amaneció en Arica a las 7:13:32 h y la puesta de sol fue//' | sed 's/.  podemos observar que la primera pleamar fue a las 5:30h y la siguiente pleamar a las 18:42h. La primera bajamar  fue a las 12:50h y la siguiente bajamar  será a las 23:46h.//' | sed 's/Hoy hemos tenido 12 horas y 28 minutos de sol. El tránsito solar se produjo a las 13:27:36 h.//' | sed 's/  Podemos comparar estos niveles con la pleamar máxima registrada en las tablas de mareas de Arica que es de 1,7m y la altura mínima 0,1m. //' | sed 's/Estos valores nos dan una visión aproximada de la amplitud de las mareas previstas en Arica en octubre.//' | sed 's/Grandes coeficientes conllevan grandes pleamares y bajamares; se suelen producir grandes corrientes y movimientos de fondos marinos. Pero recuerda que esta amplitud de las mareas puede verse muy afectada por los efectos meteorológicos y que siempre debes consultar el estado del tiempo en Arica, el pronóstico del viento en Arica y la predicción del oleaje en Arica antes de salir de pesca.//' | sed 's/  / /' | sed 's/*#_mareas//g' | sed 's/href*//' | sed 's/clarica-parinacotaarica#_mareas//' | sed 's/_self//' | sed 's/target//g' | tr -d '"'
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
