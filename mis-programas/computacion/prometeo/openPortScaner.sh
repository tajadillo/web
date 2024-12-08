#/bin/bash
#el comando para conocer cual es mi ip publica es "curl ifconfig.io"

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

clear

if [ $1 ]; then
        echo -e "${redColour}Escaneando puertos abiertos...${endColour}"
    ip=$1
    for i in {1..65535}
    do
        timeout 1 bash -c "echo '' > /dev/tcp/$ip/$i" && echo -e "${greenColour}Puerto${endColour} ${yellowColour}$i${endColour}${greenColour}: Abierto"
    done 2>/dev/null
    echo -e "\n ${yellowColour}Terminamos...${endColour}"
else
    clear
    echo -e "${redColour}Modo de uso:${endColour}\n ${greenColour}El comando para conocer cual es mi ip publica es${endColour} ${yellowColour}curl ifconfig.io${endColour}\n ${greenColour}Luego escribes el siguiente comando${endColour}\n  ${yellowColour}bash puertoScaner.sh${endColour} ${blueColour}[la dirección 'IP' conseguida]${endColour}"

fi

