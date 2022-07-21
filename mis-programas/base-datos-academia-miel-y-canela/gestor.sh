#!/bin/bash

#base de datos academia Miel y Canela
#autor: Richard Alexander Tajadillo Pérez

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

negro="\033[1;30m"
rojo="\033[1;31m"
verde="\033[1;32m"
amarillo="\033[1;33m"
azul="\033[1;34m"
morado="\033[1;35m"
cian="\033[1;36m"
blanco="\033[1;37m"

clear


# https://weather.com/

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n${yellowColour}[*]${endColour}${grayColour}Cancelado${endColour}"
	tput cnorm;
	exit 0
}





#================= inicio de tabla ==================================



function printTable(){

    local -r delimiter="${1}"
    local -r data="$(removeEmptyLines "${2}")"

    if [[ "${delimiter}" != '' && "$(isEmptyString "${data}")" = 'false' ]]
    then
        local -r numberOfLines="$(wc -l <<< "${data}")"

        if [[ "${numberOfLines}" -gt '0' ]]
        then
            local table=''
            local i=1

            for ((i = 1; i <= "${numberOfLines}"; i = i + 1))
            do
                local line=''
                line="$(sed "${i}q;d" <<< "${data}")"

                local numberOfColumns='0'
                numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<< "${line}")"

                if [[ "${i}" -eq '1' ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi

                table="${table}\n"

                local j=1

                for ((j = 1; j <= "${numberOfColumns}"; j = j + 1))
                do
                    table="${table}$(printf '#| %s' "$(cut -d "${delimiter}" -f "${j}" <<< "${line}")")"
                done

                table="${table}#|\n"

                if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi
            done

            if [[ "$(isEmptyString "${table}")" = 'false' ]]
            then
                echo -e "${table}" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1'
            fi
        fi
    fi
}

function removeEmptyLines(){

    local -r content="${1}"
    echo -e "${content}" | sed '/^\s*$/d'
}

function repeatString(){

    local -r string="${1}"
    local -r numberToRepeat="${2}"

    if [[ "${string}" != '' && "${numberToRepeat}" =~ ^[1-9][0-9]*$ ]]
    then
        local -r result="$(printf "%${numberToRepeat}s")"
        echo -e "${result// /${string}}"
    fi
}

function isEmptyString(){

    local -r string="${1}"

    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}

function trimString(){

    local -r string="${1}"
    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}

#===================== fin tabla =============================================

#variables
OPCION=0
FECHA=$(date '+%A %d de %B')
NUEVO=""

echo -e ${grayColour}"Hola!"${endColour}
sleep 1
read -p "Como te llamas? " nombre
sleep 2
tput civis
echo -e "${redColour}\n[*][*][*][*][*][*][*][*][*][*][*][*][*]"${endColour}
echo -e ${yellowColour}"Correcto${endColour}${grayColour} $nombre"${endColour} "${yellowColour}ahora buscaremos a los bailarines de Miel y Canela.${endColour}"

sleep 2
tput civis
#echo -e "\n\t ${purpleColour}Sigue las instrucciones a continuacion:${endColour}\n"
while [ $OPCION -ne "4" ]; do



    echo -e "\t\t\t\t\t${redColour}+--------------------------+${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}a) buscar a un alumno${endColour}     ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}b) ingresar nuevo alumno${endColour}  ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}| ${yellowColour}c) salir${endColour}                  ${redColour}|${endColour}"
    echo -e "\t\t\t\t\t${redColour}+--------------------------+${endColour}"


 tput cnorm   

#case $OPCION in

sleep 2

read -p "Ingrese una opcion " OPCION

    if [ $OPCION = "a" ]; then
    read -p "Cual es el nombre del alumno?: " ALUMNO
	echo	
        if [ "$ALUMNO" = "$ALUMNO" ]; then
		grep -iwe $ALUMNO base-datos.txt
	fi
	;;
   elif [ $OPCION = "b" ]; then
	echo $NUEVO >> base-datos.txt
	;;
    else
	echo $OPCION no es la una opcion valida
	;;
    fi

    
#esac
done








#    if [ "$OPCION" = "1" ]; then
#	    read -p "Cual es el nombre del alumno?: " ALUMNO
#		echo	
#	        if [ "$ALUMNO" = "$ALUMNO" ]; then
#		     grep -iwe $ALUMNO base-datos.txt
#		 fi
#		echo
#		echo
 #   elif [ "$OPCION" = "2" ]
#
#	read -p "Ingrese los datos del nuevo alumno: " NUEVO
#	     echo $NUEVO >> base-datos.txt
 #   else [ "$OPCION" gt "3" ]
#	    echo $OPCION no es la una opcion valida
#
#
 #   fi
#
#
#
#done





#tput cnorm

#case $numero in

#1)
#    find . -type f -iname "*.png" -exec mv "{}" Imágenes/ ";"
 #   find . -type f -iname "*.jpg" -exec mv "{}" Imágenes/ ";"
  #  find . -type f -iname "*.jpeg" -exec mv "{}" Imágenes/ ";"> /dev/null 2>&1;;
#
#2)    
 #   find . -type f -iname "*.doc" -exec mv "{}" Documentos/ ";" 
  #  find . -type f -iname "*.txt" -exec mv "{}" Documentos/ ";"
   # find . -type f -iname "*.pdf" -exec mv "{}" Documentos/ ";";
#    find . -type f -iname "*.docx" -exec mv "{}" Documentos/ ";"
 #   find . -type f -iname "*.xls" -exec mv "{}" Documentos/ ";"> /dev/null 2>&1;;
#
#3)
 #   find . -type f -iname "*.mp4" -exec mv "{}" Vídeos/ ";"> /dev/null 2>&1;;

#4)
 #   find . -type f -iname "*.mp3" -exec cp "{}" Música/ ";"> /dev/null 2>&1;;



#esac

#echo -e "\n${yellowColour}[*]${endColour}${grayColour}Terminamos${endColour}"


