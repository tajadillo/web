#!/bin/bash

# Declaración de variables
edad=0

# Mensaje de bienvenida
echo "****** BIENVENIDO A LA ACADEMIA MIEL Y CANELA ******"
read -p "Ingrese la edad del alumno: " edad

# Verificación de la edad y horarios
if [ $edad -ge 4 ] && [ $edad -le 6 ]; then
    echo "El horario del grupo KINDER, es Lunes y Miércoles de 16:00 a 17:00"
elif [ $edad -ge 7 ] && [ $edad -le 8 ]; then
    echo "El horario del grupo 1st year, es Martes y Jueves de 16:30 a 17:30"
elif [ $edad -ge 9 ] && [ $edad -le 10 ]; then
    echo "El horario del grupo 2nd year, es Martes y Jueves de 17:30 a 19:00"
elif [ $edad -ge 11 ] && [ $edad -le 13 ]; then
    echo "El horario del grupo 3rd year, es Lunes y Miércoles de 17:00 a 18:30"
else
    echo "Ingresó una edad que no corresponde"
fi
