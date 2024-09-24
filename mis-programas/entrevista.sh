#!/bin/bash
################################################
#Autor: Richard A. Tajadillo Pérez
#Copyright (C) 2024
# LICENCIA GNU GPL 3.0


#tabla de valores para los pagos en seminarios culturales

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
######################################################################



#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function ctrl_c(){
    echo -e "\n${yellowColour}[*]${endColour}${grayColour}Saliendo${endColour}"
    tput cnorm; airmon-ng stop ${networkCard}mon > /dev/null 2>&1
    rm Captura* 2>/dev/null
    exit 0
}

function saludar(){
    # script en UNIX que saludo al usuario por su nombre
    NOMBRE=`cat /etc/passwd | grep "^$LOGNAME" | \
        cut -d: -f5 | cut -d' ' -f1`
            # si el usuario no tiene ingresado un nombre, toma "Nadie"
            HORA=`date | cut -c12-13 | tr -d ' '`

            if expr "$HORA" \<= 5 > /dev/null
            then
                echo 'Buenas noches, '$usuario
            elif expr "$HORA" \<= 12 > /dev/null
            then
                echo 'Buenos dias, '$usuario
            elif expr "$HORA" \<= 19 > /dev/null
            then
                echo 'Buenas tardes, '$usuario
            elif expr "$HORA" \<= 24 > /dev/null
            then
                echo 'No se que hora es, '$usuario
            fi
        }


#function dependencias
tput civis
clear; dependencies=(figlet)

echo -e "${yellowColour}[*]${endColour}${grayColour} Comprobando programas necesarios...${endColour}"
sleep 2

for program in "${dependencies[@]}"; do
    echo -ne "\n${yellowColour}[*]${endColour}${blueColour} Herramienta${endColour}${purpleColour} $program${endColour}${blueColour}...${endColour}"

    test -f /usr/bin/$program

    if [ "$(echo $?)" == "0" ]; then
        echo -e " ${greenColour}(V)${endColour}"
    else
        echo -e " ${redColour}(X)${endColour}\n"
        echo -e "${yellowColour}[*]${endColour}${grayColour} Instalando herramienta ${endColour}${blueColour}$program${endColour}${yellowColour}...${endColour}"
        apt-get install $program -y > /dev/null 2>&1
        fi; sleep 1
    done

        #saludo
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

        tput civis
        clear
        sleep 2


######### VARIABLES ############
fecha=$(date "+%A %d de %B del %Y a las %T")
######### FIN VARIABLES ############
echo
echo -e "\n ${greenColour}$fecha${endColour}"

echo
echo
echo -e "\n ${redColour}##############################################################################${endColour}"

###############################
# llamar a la funcion saludar #
###############################
#saludar
#########
echo

clear
sleep 2

#Que
#Que objetivos queremos conseguir??
#Podemos medirlos
#Que hemos hecho o estamos haciendo para cumplir esos objetivos

#Por que
#Porque es importante
#Identificamos problemas, aportamos soluciones… A MEDIDA
#Se ha intentado antes, (si, y se consiguieron resultados, replicamos lo mismo), (si, y no se consiguio nada, cambiamos la estrategia), (no, es el momento de partir con una estrategia)

#Cuando
#Tenemos fecha limite
#Porque es importante la fecha limite (si la determino el cliente)
#Fijando plazos para generar accion (a corto, medio y largo plazo y poder medirlos)

#Como
#Amor/odio ( que actividad te gustaria realizar para el entrenamiento o como / donde) / ( como no te gustaria que realicemos el entrenamiento)
#Tiempo / energia / disponivilidad (programar agenda)
#Divertir = fidelizar

#Quien
#El mas preparado
#El mas motivado
#El que ya lo ha conseguido antes
#Soy yo?
#Sin duda!!!




#Otro ejemplo mas practico de pimera entrevista

#¿Por que yo y ahora?
#Cuentame un poco sobre tus problemas
#¿Que cosas te faltan o que cosas necesitan solucion?
#¿Que has probado?
#¿Que te hace falta ahora mismo? ¿De mi?
#Es algo que quieres ahora, o mas adelante

#De lo que has dicho, me suena que tus grandes problemas son

#Tu realmente quieres (meta) pero (obstaculo) esta por medio
#Necesitas una forma de (resultado)
# Has echo ya (acciones) pero (fracaso)
#¿Esto es correcto?



#pk_yo
#meta
#obstaculo
#acciones
#resultado
#cuando




tput civis

saludar
echo -e "\n ${blueColour}Este programa esta diseñado para realizar la primera entrevista en una sesión de valoración con tu cliente${endColour}"

tput cnorm


echo

read -p "¿Por que yo y por que ahora? " pk_yo
clear
echo
read -p "Cuentame un poco sobre que objetivos queremos conseguir " meta
clear
echo
read -p "¿Que cosas te faltan, cuales podrian ser tus obstaculos/problemas, o que cosas necesitan solucion? " obstaculo
clear
echo
read -p "¿Que has probado? " acciones
clear
echo
read -p "¿Que paso con eso? " fracaso
clear
echo
read -p "¿Que cosa necesitas ahora mismo? ¿De mi? " resultado
clear
echo
read -p "¿En que fecha será? " cuando

echo
echo


echo -e "\n${greenColour}Tu realmente quieres${endColour} ${yellowColour}$meta${endColour} ${greenColour}para${endColour} ${yellowColour}$cuando${endColour}. ${greenColour}Pero,${endColour} ${yellowColour}$obstaculo,${endColour} ${greenColour}esta de por medio${endColour}"
echo -e "\n${greenColour}Necesitas${endColour} ${yellowColour}$resultado${endColour}"
echo -e "\n${greenColour}Has intentado${endColour} ${yellowColour}$acciones${endColour} ${greenColour}pero${endColour} ${yellowColour}$fracaso${endColour}"
echo -e "\n${greenColour}Y necesitas de mi porque${endColour} ${yellowColour}$pk_yo${endColour}"
echo -e "\n${greenColour}¿Esto es correocto?${endColour}"

