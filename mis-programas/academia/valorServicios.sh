#!/bin/bash

#Se necesita un algoritmo para una veterinaria que determine el precio de las atenciones dadas a una mascota. tener en cuenta que el usuario deberá ingresar:

# 1 para servicio de baño. valor $3500
# 2 para servicio de peluqueria. valor $6000
# 3 para vacunación. valor 12500
# 4 para servicio de baño y peluqueria
# 5 para los 3 servicios
# 6 para baño y vacunación
# 7 para peluqueria y vacunación

#En base a la opción ingresada se deberá mostrar por pantalla el monto gastado por el propietario.

bano=3500
peluqueria=6000
vacunacion=12500
banoPel=$(( $bano+ $peluqueria ))
banoVac=$(( $bano + $vacunacion ))
pelVac=$(( $peluqueria + $vacunacion ))
todo=$(( $bano + $peluqueria + $vacunacion ))
opc4=$(echo -e "baño y peluqueria")
opc5=$(echo -e "baño, peluqueria y vacunación")
opc6=$(echo -e "baño y vacunación")
opc7=$(echo -e "peluqueria y vacunación")

clear
echo -e "\n \t ****** Bienvenido a la veterinaria TAJADILLO ****** \n"
sleep 1

echo -e " 1. baño."
echo -e " 2. peluqueria."
echo -e " 3. vacunación."
echo -e " 4. baño y peluqueria"
echo -e " 5. los 3 servicios"
echo -e " 6. baño y vacunación"
echo -e " 7. peluqueria y vacunación"
echo

read -p "Por favor seleccione un servicio " servicio

if [ $servicio -eq 1 ]; then
    echo -e "El servicio de baño cuesta: $bano"
elif [ $servicio -eq 2 ]; then
    echo -e "El servicio de peluqueria cuesta: $peluqueria"
elif [ $servicio -eq 3 ]; then
    echo -e "El servicio de vacunacion cuesta: $vacunacion"
elif [ $servicio -eq 4 ]; then
    echo -e "El servicio de $opc4 cuesta: $banoPel"
elif [ $servicio -eq 5 ]; then
    echo -e "Los servicios de $opc5 tienen un total de: $todo"
elif [ $servicio -eq 6 ]; then
    echo -e "Los servicios de $opc6 tienen un total de: $banoVac"
elif [ $servicio -eq 7 ]; then
    echo -e "Los servicios de $opc7 tienen un total de: $pelVac"
else
    echo -e "La opción ingresada no es correcta"
fi

