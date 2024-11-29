#!/bin/bash

# Opciones personalizables
MAX_LENGTH=25            # Longitud máxima del texto mostrado
ICON_PLAY=""            # Icono para estado "Reproduciendo"
ICON_STOP=""            # Icono para estado "No hay reproducción"

# Obtener la salida completa de mocp
MOC_STATE=$(mocp -i 2>/dev/null)

# Verifica si el estado de MOC contiene "State: PLAY"
if echo "$MOC_STATE" | grep -q "State: PLAY"; then
    # Obtén el archivo de la canción
    FILE=$(echo "$MOC_STATE" | grep -oP 'File: \K.*' | sed 's/^[ \t]*//;s/[ \t]*$//')  # Obtener el nombre del archivo

    # Extraer solo el nombre del archivo (sin la ruta)
    FILENAME=$(basename "$FILE")

    # Construir el texto final, solo con el nombre del archivo
    INFO="$FILENAME"

    # Trunca el texto si excede la longitud máxima
    if [ ${#INFO} -gt $MAX_LENGTH ]; then
        INFO="${INFO:0:$MAX_LENGTH}…"
    fi

    # Muestra el resultado con el icono
    echo "$ICON_PLAY $INFO"
else
    # Si MOC no está reproduciendo
    echo "$ICON_STOP No hay reproducción"
fi
