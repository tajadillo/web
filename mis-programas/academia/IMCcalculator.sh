#!/bin/bash

# Script para calcular el Índice de Masa Corporal (IMC)

# Solicitar el peso al usuario (en kilogramos)
read -p "Ingresa tu peso en kilogramos: " peso

# Solicitar la estatura al usuario (en centímetros)
read -p "Ingresa tu estatura en centímetros: " estatura_cm

# Convertir la estatura de centímetros a metros
estatura=$(echo "scale=2; $estatura_cm / 100" | bc)

# Calcular el IMC = peso / (estatura^2)
imc=$(echo "scale=2; $peso / ($estatura * $estatura)" | bc)


clear

# Mostrar el resultado del IMC
echo -e "\n\nTu Índice de Masa Corporal (IMC) es: $imc\n\n"


# Clasificación del IMC según la OMS
if (( $(echo "$imc < 18.5" | bc -l) )); then
    echo -e "##########################"
    echo -e "#Clasificación: Bajo peso#"
    echo -e "##########################"
elif (( $(echo "$imc >= 18.5 && $imc < 24.9" | bc -l) )); then
    echo -e "############################"
    echo -e "#Clasificación: Peso normal#"
    echo -e "############################"
elif (( $(echo "$imc >= 25 && $imc < 29.9" | bc -l) )); then
    echo -e "##########################"
    echo -e "#Clasificación: Sobrepeso#"
    echo -e "##########################"
else
    echo "Clasificación: Obesidad"
fi

read -p "presiona la tecla enter para continuar y llamar al script para conocer tu edad" P

source edad.sh
