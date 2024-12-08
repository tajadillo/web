#!/bin/bash


#Colours
rosaColour="\033[38;2;255;105;180m"
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
naranjaColour="\033[38;2;243;134;48m"

clear

echo -e "${purpleColour}=======================================================${endColour}"
echo -e "${greenColour} Información del Sistema${endColour}"
echo -e "${purpleColour}=======================================================${endColour}"

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Sistema Operativo:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
uname -a

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Distribución de linux:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
lsb_release -d | cut -f2-

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Versión del Kernel:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
uname -r

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Tiempo de Actividad del Sistema${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
uptime

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Espacio en Disco:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
df -h --output=source,used,avail


echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Paquetes instalados:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${rosaColour}APT:${endColour} $(dpkg --get-selections | wc -l), ${rosaColour}Snap:${endColour} $(snap list | wc -l), ${rosaColour}Flatpak:${endColour} $(flatpak list | wc -l)"

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Interface de red:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
echo $(ip route | grep default | awk '{print $5}')

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Información de la Red${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
ip a

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Conexiones de Red Activas:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
ss -tuln

echo -e "${naranjaColour}=======================================================${endColour}"
echo -e "${greenColour} Archivos de Configuración de Red:${endColour}"
echo -e "${naranjaColour}=======================================================${endColour}"
cat /etc/hosts
cat /etc/resolv.conf

#echo -e "${naranjaColour}=======================================================${endColour}"
#echo -e "${greenColour} Binarios con Permisos SUID:${endColour}"
#echo -e "${naranjaColour}=======================================================${endColour}"
#find / -perm /4000 -type f 2>/dev/null


#echo -e "${naranjaColour}=======================================================${endColour}"
#echo -e "${greenColour} Comandos que se Pueden Ejecutar con Sudoers${endColour}"
#echo -e "${naranjaColour}=======================================================${endColour}"
#sudo -l
