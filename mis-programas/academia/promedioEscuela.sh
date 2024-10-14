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

sleep 2
clear
sleep 2
tput civis



echo -e "\n ${redColour}############################################################################### ${endColour}"
echo
echo
saludar
echo -e "\n ${yellowColour}Correcto${endColour} ${greenColour} $usuario ${endColour} ${yellowColour}Elige que materia quieres calificar, y después pon tus 4 calificaciones del semestre.\n Con base en esas calificaciones obtendrás tu promedio. ${endColour}"
echo -e "\n ${redColour}############################################################################### ${endColour}"
sleep 15
clear
#fin saludo

# Función para mostrar el menú de opciones
function mostrar_menu() {
    echo -e "${blueColour}Seleccione una opción:${endColour}"
    echo -e "${yellowColour}1) Agregar ingrediente${endColour}"
    echo -e "${yellowColour}2) Calcular costo de la receta${endColour}"
    echo -e "${yellowColour}3) Ayuda${endColour}"
    echo -e "${yellowColour}4) Salir${endColour}"
}
#Fin menú

# Panel de ayuda
function help_panel(){
    #Uso del script:
    echo -e "\n ${blackColour}.${endColour}"
    echo -e "\n ${blackColour}.${endColour}"
    echo -e "\n ${blackColour}.${endColour}"
    echo -e "\n ${blackColour}.${endColour}"
    echo -e "\n ${blackColour}.${endColour}\n"
}
#Fin ayuda


#calculadora de promedio
echo -e "${redColour}CALIFICACIONES DE LA ACADEMIA${endColour} \n\n${blueColour}ASIGNATURAS:${endColour}"
echo -e "${greenColour}1) Coreografía \n2) Expresión Corporal \n3) Condición Física \n4) Compañerismo \n5) Disciplina${endColour}\n\n"
read -p "Elige solo uno: " s1

clear

if [ $s1 == 1 ]; then
    asignatura="Coreografía"
    echo -e "\n ${yellowColour}Tú elegiste${endColour} ${redColour}$asignatura${endColour}\n"
elif [ $s1 == 2 ]; then
    asignatura="Expresión Corporal"
    echo -e "\n ${yellowColour}Tú elegiste${endColour} ${redColour}$asignatura${endColour}\n"
elif [ $s1 == 3 ]; then
    asignatura="Condición Física"
    echo -e "\n ${yellowColour}Tú elegiste${endColour} ${redColour}$asignatura${endColour}\n"
elif [ $s1 == 4 ]; then
    asignatura="Compañerismo"
    echo -e "\n ${yellowColour}Tú elegiste${endColour} ${redColour}$asignatura${endColour}\n"
elif [ $s1 == 5 ]; then
    asignatura="Disciplina"
    echo -e "\n ${yellowColour}Tú elegiste${endColour} ${redColour}$asignatura${endColour}\n"
else
    sleep 2
    clear
    echo -e "\n ${redColour}El ramo elegido no es valido${endColour}"
    echo -e "\n ${yellowColour}Terminamos $usuario...${endColour} \n"
    sleep 2
    exit
fi

read -p "La calificación del primer bloque para $asignatura será: " f4
read -p "La calificación del segundo bloque para $asignatura será: " s4
read -p "La calificación del tercer bloque para $asignatura será: " t4
read -p "La calificación del cuarto bloque para $asignatura será: " f4

clear

echo -e "\n${redColour}CALIFICACIONES${endColour}\n"
p1=$(( f4 + s4 ))
let p1/=2
echo -e "\n ${greenColour}Primer partial:${endColour} ${yellowColour}$p1${endColour}"
p2=$(( t4 + f4 ))
let p2/=2
echo -e "\n ${greenColour}Segundo partial:${endColour} ${yellowColour}$p2${endColour}"
promedio=$(( p1 +p2 ))
let promedio/=2
echo -e "\n ${greenColour}Promedio del semestre en $asignatura:${endColour} ${yellowColour}$promedio${endColour}"
#fin calculadora
tput cnorm
