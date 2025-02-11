#/bin/bash

#Colours
rosaColour="\e[0;41m\101[1m"
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

# Al crear un documento automáticamente se le adicionará la fecha

clear

echo -e "\t\t${naranjaColour}¿cual será el nombre del documento?${endColour}"
read nombre

clear

    echo -e "${redColour}##################################################${endColour}"
    echo -e "${redColour}#${endColour} ${greenColour}Indica en que formato se guardara el documento${endColour} ${redColour}#${endColour}"
    echo -e "${redColour}##################################################${endColour}"

    echo -e "${yellowColour}1.${endColour} ${greenColour}documento de texto .txt${endColour}"
    echo -e "${yellowColour}2.${endColour} ${greenColour}documento de word .doc${endColour}"
    echo -e "${yellowColour}3.${endColour} ${greenColour}documento de exel .xls${endColour}"
    echo -e "${yellowColour}4.${endColour} ${greenColour}documento de pdf .pdf${endColour}"


# Preguntar por el tipo de archivo
echo
echo
echo -e "\n ${naranjaColour}Ingrese un número (1-4) para seleccionar el tipo de archivo: ${endColour}"
read type

# Asignar la extensión correspondiente
case $type in
    1) extension=".txt" ;;
    2) extension=".doc" ;;
    3) extension=".xls" ;;
    4) extension=".pdf" ;;
    *)
        echo -e "${redColour}¡¡¡La opción seleccionada no es válida!!!${endColour}"
        exit 1 # Salir del script si la opción no es válida
    ;;
esac

# Crear el archivo con la extensión correcta
documento="${nombre}--$(date '+%Y-%m-%d__%H-%M')$extension"
touch "$documento"

# Mensaje de confirmación
clear
echo -e "\n\t ${greenColour}En esta dirección${endColour} \n\t\t${redColour}$(pwd)${endColour}\n \t${greenColour}se creó el documento:${endColour}\n \t\t\t${yellowColour}$documento${endColour} "

