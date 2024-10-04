#!/bin/bash

####################
# MENU DE OPCIONES #
####################

opciones="Saludar Listar Funcion Salir"

function holitas(){
    echo "Hola desde la funcion"
}

echo "Seleccione una opción de nuestro menu :)"

select opcion in $opciones
do
    if [ $opcion = "Saludar" ]; then
        echo "Hola desde Bash"
    elif [ $opcion = "Listar" ]; then
        ls
    elif [ $opcion = "Funcion" ]; then
        holitas
    elif [ $opcion = "Salir" ]; then
        echo "Bye"
        exit
    else
        echo "Opcion no permitida"
    fi
done

############
# FIN MENU #
############



