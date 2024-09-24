#!/bin/bash
#Aquí tienes un script en Bash que realiza los cálculos que has solicitado. El script permite al usuario agregar ingredientes con su costo al por mayor, calcular el costo según la receta y determinar el precio de venta al público.

#Script en Bash
#bash

# Función para mostrar el menú de opciones
mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1) Agregar ingrediente"
    echo "2) Calcular costo de la receta"
    echo "3) Salir"
}

# Inicializar variables
declare -A ingredientes
total_costo=0

# Ciclo principal
while true; do
    mostrar_menu
    read -p "Opción: " opcion

    echo -e "\n\t consultar tabla de equivalencias para tener las medidas en claridad \n\n"

    case $opcion in
        1)
            read -p "Nombre del ingrediente: " nombre
            read -p "Costo por kilo (o unidad): " costo
            read -p "Cantidad en la receta (kilos o unidades): " cantidad
            ingredientes["$nombre"]="$costo:$cantidad"
            echo "Ingrediente $nombre agregado."
            ;;

        2)
            total_costo=0
            echo "Ingredientes y costos:"
            for ingrediente in "${!ingredientes[@]}"; do
                costo_info=(${ingredientes["$ingrediente"]//:/ })
                costo=${costo_info[0]}
                cantidad=${costo_info[1]}
                costo_total=$(echo "$costo * $cantidad" | bc)
                total_costo=$(echo "$total_costo + $costo_total" | bc)
                echo "$ingrediente: Costo total = $costo_total"
            done

            read -p "Ingrese el factor de multiplicación (0.5, 2, 3, 4, 5): " factor
            read -p "Número de personas: " num_personas

            precio_venta=$(echo "$total_costo * $factor / $num_personas" | bc)
            echo "Precio de venta al público por plato: $precio_venta"
            ;;

        3)
            echo "Saliendo..."
            exit 0
            ;;

        *)
            echo "Opción no válida. Intente de nuevo."
            ;;
    esac
done

#Uso del script:
#Agregar ingredientes: Puedes añadir tantos ingredientes como desees, especificando su costo y la cantidad utilizada en la receta.
#Calcular costo de la receta: Muestra el costo total de los ingredientes, solicita un factor de multiplicación y el número de personas, y calcula el precio de venta por plato.
#Salir: Termina la ejecución del script.
#¡Espero que te sea útil! Si tienes alguna pregunta o necesitas más modificaciones, no dudes en decírmelo.
