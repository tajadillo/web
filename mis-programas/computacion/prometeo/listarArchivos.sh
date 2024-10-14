#!/bin/bash
#########################################################################################
#tabla de valores para los pagos en seminarios culturales
#Autor: Richard A. Tajadillo Pérez
#Copyright (C) 2024
# LICENCIA GNU GPL 3.0

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
########################################################################################



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

# Solicitar al usuario la ruta del directorio
read -p "Ingresa la ruta del directorio: " ruta

sleep 2
clear

# Verificar si el directorio existe y contiene archivos o carpetas
if [ -d "$ruta" ] && [ "$(ls -A "$ruta")" ]; then
    # Listar primero las carpetas
    echo -e "\n ${redColour}Carpetas:${endColour}"
    for archivo in "$ruta"/*
    do
        if [ -d "$archivo" ]; then
            echo -e "${blueColour}$archivo${endColour}"
        fi
    done

    echo

    # Listar los archivos regulares
    echo -e " ${redColour}Archivos:${endColour}"
    for archivo in "$ruta"/*
    do
        if [ -f "$archivo" ]; then
            echo -e "${yellowColour}$archivo${endColour}"
        fi
    done
else
    echo -e "\n ${redColour}El directorio no existe o está vacío.${endColour}"
fi
