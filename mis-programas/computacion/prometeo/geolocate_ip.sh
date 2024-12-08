#!/bin/bash

#sudo apt-get install jq

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
naranjaColour="\033[38;2;243;134;0m"
#Esto cubre una amplia gama de colores ANSI que puedes usar para formatear texto en la terminal. ¡Espero que te sea útil!



# Comprobar si se proporcionó una dirección IP
if [ -z "$1" ]; then
    echo "Por favor, proporciona una dirección IP."
    exit 1
fi

# Dirección IP a geolocalizar
IP=$1

# Realizar la consulta a la API de ipinfo.io
RESPONSE=$(curl -s "http://ipinfo.io/$IP/json")

# Comprobar si la respuesta contiene datos
if [ -z "$RESPONSE" ]; then
    echo "No se pudo obtener respuesta de la API."
    exit 1
fi

# Mostrar la respuesta completa para depurar (puedes descomentar esto para ver todo)
# echo "Respuesta completa de la API:"
# echo "$RESPONSE"
# echo ""

# Extraer la información de la respuesta JSON
CITY=$(echo $RESPONSE | jq -r '.city // empty')
COUNTRY=$(echo $RESPONSE | jq -r '.country // empty')
CONTINENT=$(echo $RESPONSE | jq -r '.continent // empty')
LOC=$(echo $RESPONSE | jq -r '.loc // empty')

echo
echo
echo -e "${redColour}#####################################${endColour}"

# Verificar si los valores no son vacíos
if [ -n "$CITY" ]; then
    echo -e "${greenColour}Ciudad:${endColour} ${naranjaColour}$CITY${endColour}"
else
    echo -e "${redColour}Ciudad: No disponible${endColour}"
fi

if [ -n "$COUNTRY" ]; then
    echo -e "${greenColour}País:${endColour} ${naranjaColour}$COUNTRY${endColour}"
else
    echo -e "${redColour}País: No disponible${endColour}"
fi

#if [ -n "$CONTINENT" ]; then
 #   echo -e "${greenColour}Continente:${endColour} ${naranjaColour}$CONTINENT${endColour}"
#else
 #   echo -e "${redColour}Continente: No disponible${endColour}"
#fi

# Si las coordenadas están disponibles
if [ -n "$LOC" ]; then
    LATITUDE=$(echo $LOC | cut -d',' -f1)
    LONGITUDE=$(echo $LOC | cut -d',' -f2)
    echo -e "${greenColour}Coordenadas GPS de la IP${endColour} ${naranjaColour}$IP:${endColour}"
    echo -e "${greenColour}Latitud:${endColour} ${naranjaColour}$LATITUDE${endColour}"
    echo -e "${greenColour}Longitud:${endColour} ${naranjaColour}$LONGITUDE${endColour}"
else
    echo -e "${redColour}No se pudo obtener las coordenadas GPS para la IP $IP.${endColour}"
fi

echo -e "${redColour}##########################################${endColour}"
echo
