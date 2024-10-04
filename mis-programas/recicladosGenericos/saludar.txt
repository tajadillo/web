#!/bin/bash

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

###############################
# llamar a la funcion saludar #
###############################
saludar
#########






