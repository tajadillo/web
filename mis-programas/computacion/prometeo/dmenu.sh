#!/bin/sh
#https://www.youtube.com/watch?v=J6D1nTQCJGE
#https://gitlab.com/shastenm76
https://gitlab.com/users/shastenm76/projects

# Función para mostrar un menú para seleccionar una carpeta dentro de ~/documentos, excluyendo ocultos
select_folder() {
  # Buscar todas las carpetas dentro de ~/documentos, excluyendo ocultas
  find ~/Escritorio -type d -not -path '*/.*' 2>/dev/null | sort | rofi -dmenu -i -p "Selecciona una carpeta:"
}

# Función para mostrar un menú para seleccionar un archivo dentro de una carpeta, excluyendo ocultos
select_file() {
  local folder=$1
  # Buscar archivos de texto comunes y formatos compatibles con nvim
  find "$folder" -type f \( \
    -iname "*.txt" -o \
    -iname "*.md" -o \
    -iname "*.js" -o \
    -iname "*.log" -o \
    -iname "*.css" -o \
    -iname "*.conf" -o \
    -iname "*.html" -o \
    -iname "*.json" -o \
    -iname "*.xml" -o \
    -iname "*.yml" -o \
    -iname "*.toml" -o \
    -iname "*.ini" -o \
    -iname "*.csv" -o \
    -iname "*.rtf" -o \
    -iname "*.sh" -o \
    -iname "*.bash" -o \
    -iname "*.zsh" \
  \) -not -path '*/.*' 2>/dev/null | sort | rofi -dmenu -i -p "Selecciona un archivo:"
}

# Paso 1: Seleccionar una carpeta
FOLDER=$(select_folder)

# Verifica si se seleccionó una carpeta
if [ -n "$FOLDER" ]; then
  echo "Seleccionaste la carpeta: $FOLDER"

  # Paso 2: Seleccionar un archivo dentro de la carpeta seleccionada
  FILE=$(select_file "$FOLDER")

  # Verifica si se seleccionó un archivo
  if [ -n "$FILE" ]; then
    # Abre el archivo seleccionado con el programa nvim usando kitty
    PROGRAM=nvim
    kitty --execute $PROGRAM "$FILE"
  else
    echo "No seleccionaste ningún archivo."
  fi
else
  echo "No seleccionaste ninguna carpeta."
fi
