#!/bin/bash

#En resumen, el comando nmap -Pn -sV te permite escanear un host sin enviar pings y obtener información detallada sobre los servicios y sus versiones, lo que puede ser muy útil si estás investigando una red que responde de manera más restrictiva o si quieres obtener un análisis más profundo de los servicios activos.

#Este enfoque es ideal si estás probando configuraciones avanzadas de red o verificando qué servicios están expuestos y cuáles podrían ser vulnerables.


#El comando nmap -Pn -sV tiene un propósito bastante específico en el escaneo de redes y puertos. Te explico los componentes:

#-Pn (Ping Scan Desactivado): Con esta opción, Nmap no realiza el ping tradicional para verificar si el host está en línea antes de comenzar el escaneo. Esto es útil cuando sabes que el objetivo está activo pero filtra solicitudes ICMP (ping), o si quieres evitar que te detecten mediante el ping. También puedes usarlo cuando escaneas redes protegidas o sistemas que no responden a pings por razones de seguridad.

#-sV (Detección de versión de servicio): Esta opción le indica a Nmap que intente identificar la versión exacta de los servicios que están escuchando en los puertos abiertos. No solo detecta qué puertos están abiertos, sino que intenta obtener detalles como la versión del software que está detrás de cada puerto (por ejemplo, Apache 2.4.29 en lugar de solo decir que el puerto 80 está abierto).

#En resumen, el comando nmap -Pn -sV te permite escanear un host sin enviar pings y obtener información detallada sobre los servicios y sus versiones, lo que puede ser muy útil si estás investigando una red que responde de manera más restrictiva o si quieres obtener un análisis más profundo de los servicios activos.

#Este enfoque es ideal si estás probando configuraciones avanzadas de red o verificando qué servicios están expuestos y cuáles podrían ser vulnerables. ¿Tienes en mente alguna red en particular donde lo estés aplicando?


#ChatGPT
#Respuesta 2
#El comando nmap -Pn -sV combina varias opciones de Nmap para realizar un escaneo más específico. Aquí te explico cada parte del comando:

#1. -Pn (No Ping)
#Descripción: Omite la detección previa de hosts (evita el ping).
#Función: Por defecto, Nmap primero envía un "ping" para verificar si el host está activo antes de proceder al escaneo. Al usar -Pn, Nmap asume que el host está activo, lo que es útil cuando los pings ICMP (ping estándar) están bloqueados por firewalls, pero quieres intentar escanear los puertos de todas formas.
#Usos: Se usa cuando el host no responde a pings, pero se desea hacer el escaneo igual.

#2. -sV (Service Version Detection)
#Descripción: Detecta las versiones de los servicios que están corriendo en los puertos abiertos.
#Función: Al encontrar un puerto abierto, Nmap intentará identificar no solo qué servicio está corriendo (como HTTP, FTP, etc.), sino también la versión del software. Por ejemplo, si encuentra un servidor web, intentará determinar si es Apache, Nginx, etc., y su versión exacta.
#Usos: Esto es útil para obtener más detalles sobre los servicios que están corriendo en el host, lo que puede ser útil en auditorías de seguridad o pruebas de penetración.
#Ejemplo de uso:

#nmap -Pn -sV 192.168.1.1
#Este comando:

#Omite el paso de ping para verificar si el host está activo.
#Escanea los puertos abiertos en el host 192.168.1.1.
#Intenta identificar la versión de los servicios que están corriendo en esos puertos.

#Casos prácticos:

#Firewalls estrictos: Si el firewall de un host bloquea los pings pero quieres saber qué servicios están corriendo en él, esta opción evita que el escaneo sea descartado antes de tiempo.

#Auditorías de seguridad: Te da información detallada de los servicios y versiones que pueden ser vulnerables si no están actualizados.



#!/bin/bash

# Colores para la salida
redColour="\033[31m"
greenColour="\033[32m"
yellowColour="\033[33m"
blueColour="\033[34m"
endColour="\033[0m"

# Pedir la dirección IP
read -p "Ingresa la dirección IP: " direccion

clear

# Verificar si la dirección IP es válida usando una expresión regular
if [[ $direccion =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo -e "${redColour}Escaneando servicios de la maquina...${endColour}"
    nmap -Pn -sV $direccion
    echo -e "\n${yellowColour}Terminamos...${endColour}"
else
    clear
    echo -e "${redColour}Modo de uso:${endColour}"
    echo -e "${greenColour}El comando para conocer cual es mi IP pública es:${endColour} ${yellowColour}curl ifconfig.io${endColour}"
    echo -e "${greenColour}Luego escribes el siguiente comando:${endColour}"
    echo -e "${yellowColour}bash nmapService.sh [la dirección 'IP' conseguida]${endColour}"
fi

