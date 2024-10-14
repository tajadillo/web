
#!/bin/bash

# Definir colores (opcional)
redColour="\033[31m"
greenColour="\033[32m"
yellowColour="\033[33m"
blueColour="\033[34m"
endColour="\033[0m"

clear

# Obtener la IP y la máscara de subred
IP=$(hostname -I | awk '{print $1}')
RED=$(echo $IP | awk -F '.' '{print $1"."$2"."$3".0/24"}')

echo -e "\n${redColour}Escaneando la red${endColour} ${yellowColour}$RED...${endColour}"

# Declarar un array asociativo para guardar las IPs y los nombres
declare -A NAMES

# Escanear la red usando nmap y mostrar nombres de host
echo -e "\n${greenColour}Escaneo de red con nmap:${endColour}"
while IFS= read -r line; do
    if [[ $line =~ ^Nmap\ scan\ report\ for ]]; then
        IP=$(echo "$line" | awk '{print $5}')
        HOST=$(echo "$line" | awk '{print $NF}')
        NAMES["$IP"]="$HOST"
        echo -e "${blueColour}IP:${endColour} $IP ${blueColour}- Host:${endColour} ${yellowColour}$HOST${endColour}"
    fi
done < <(nmap -sn $RED)

# Alternativa: Escanear usando ping para verificar activas
echo -e "\n${greenColour}Escaneando máquinas con ping...${endColour}"
for ip in $(seq 1 254); do
    CURRENT_IP="${RED%.*}.$ip"
    # Ejecutar ping y si está activo, intentar resolver el nombre de host
    if ping -c 1 -W 1 $CURRENT_IP > /dev/null; then
        HOSTNAME=${NAMES[$CURRENT_IP]:-'Desconocido'}  # Usar nombre de Nmap o 'Desconocido'
        echo -e "${blueColour}IP:${endColour} $CURRENT_IP ${blueColour}- Host:${endColour} ${yellowColour}$HOSTNAME${endColour}"
    fi
done

#####################################
# Mostrar tabla ARP usando ip neigh #
#####################################
#echo -e "\nTabla ARP:"
#ip neigh
#####################################
