#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DB_DIR="$BASE_DIR/data"
SCRIPTS_DIR="$BASE_DIR/scripts"
BACKUP_DIR="$DB_DIR/backups"
SEP=","
DELIM='"'

ARTICULOS="$DB_DIR/articulos.csv"
CATEGORIAS="$DB_DIR/categorias.csv"
PROVEEDORES="$DB_DIR/proveedores.csv"
MOVIMIENTOS="$DB_DIR/movimientos.csv"
PEDIDOS="$DB_DIR/pedidos.csv"

mkdir -p "$BACKUP_DIR"

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
