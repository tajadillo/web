#!/bin/bash

# Declaración de variables
edad=0

# Mensaje de bienvenida
echo "****** BIENVENIDO A LA ACADEMIA MIEL Y CANELA ******"
read -p "Ingrese la edad del alumno: " edad

# Verificación de la edad y horarios
if [ $edad -ge 6 ] && [ $edad -le 10 ]; then
    echo "La categoria es 'Menores A'"
elif [ $edad -ge 11 ] && [ $edad -le 17 ]; then
    echo "La categoria es 'Menores B'"
elif [ $edad -ge 18 ] && [ $edad -le 30 ]; then
    echo "La categoria es 'Juveniles'"
elif [ $edad -ge 31 ] && [ $edad -le 50 ]; then
    echo "La categoria es 'Adultos'"
elif [ $edad -ge 51 ]; then
    echo "La categoria es 'Mayores'"
else
    echo "Ingresó una edad que no corresponde"
fi
