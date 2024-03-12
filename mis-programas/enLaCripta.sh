#!/bin/bash

# ENCRIPTADOR DE TEXTO
# Autora LCDS <lachicadesistemas@gmail.com>
# LICENCIA GNU GPL 3.0
#..........................................

if ! which openssl &> /dev/null; then
    echo "OpenSSL no está instalado. Por favor, instalar:"
    echo "Debian/Mint/Ubuntu: sudo apt-get install openssl"
    echo "RHEL/Fedora/Centos: sudo yum install openssl"
    exit 1
else
    openssl version
fi

if [ "$1" == "-e"  ];then
    echo "Encriptando Archivo..."
    read -sp "Introducir una palabra clave o contraseña para el encriptado:" pass
    openssl enc -aes-256-cbc -salt "$2" -out "$2.encr" -k "$pass"
    echo "Archivo $2 encriptado como $2.encr"
elif [ "$1" == "-d" ]; then
    echo "Desencriptando Archivo..."
    read -sp "Introducir la contraseña o palabra clave para desencriptar:" pass
    openssl enc -aes-256-cbc -d -in "$2" -out "${2%.encr}" -k "$pass"
    echo "Archivo descifrado con éxito y guardado como ${2%.encr}"
else
    echo "Error: Uso:"
    echo "./enLaCripta.sh -e ejemplo.txt"   encripta ejemplo.txt
    echo "./enLaCripta.sh -d ejemplo.txt"   desencripta ejemplo.txt
fi


