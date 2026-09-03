#!/bin/bash

# ============================================================
# RT-Linux-Theme — Instalador de WebApps
# Brave + Rofi + i3
# ============================================================

set -e

# ============================================================
# 1. CREAR ESTRUCTURA DE CARPETAS
# ============================================================

mkdir -p ~/RT-Linux-Theme
mkdir -p ~/RT-Linux-Theme/webapps
mkdir -p ~/RT-Linux-Theme/webapps/icons
mkdir -p ~/RT-Linux-Theme/webapps/applications

mkdir -p ~/.local/share/applications

# ============================================================
# 2. DEFINIR RUTAS
# ============================================================

THEME_DIR="$HOME/RT-Linux-Theme"
WEBAPPS_DIR="$THEME_DIR/webapps"

ICON_DIR="$WEBAPPS_DIR/icons"
DESKTOP_DIR="$WEBAPPS_DIR/applications"

SYSTEM_APPS="$HOME/.local/share/applications"

BASE_URL="https://cdn.simpleicons.org"

# ============================================================
# 3. COMPROBAR BRAVE
# ============================================================

if command -v brave-browser >/dev/null 2>&1; then
    BRAVE="brave-browser"
elif command -v brave >/dev/null 2>&1; then
    BRAVE="brave"
else
    echo
    echo "[ERROR] No se encontró Brave."
    echo
    exit 1
fi

# ============================================================
# 4. COMPROBAR CURL
# ============================================================

if ! command -v curl >/dev/null 2>&1; then
    echo
    echo "[ERROR] curl no está instalado."
    echo
    echo "Instálalo con:"
    echo
    echo "sudo apt install curl"
    echo
    exit 1
fi

# ============================================================
# 5. DATOS DE LAS WEBAPPS
# ============================================================

declare -A URLS

URLS[youtube]="https://www.youtube.com"
URLS[gmail]="https://mail.google.com"
URLS[outlook]="https://outlook.live.com/mail/"
URLS[whatsapp]="https://web.whatsapp.com"
URLS[spotify]="https://open.spotify.com"
URLS[instagram]="https://www.instagram.com"
URLS[telegram]="https://web.telegram.org"
URLS[discord]="https://discord.com/app"
URLS[github]="https://github.com"

declare -A NAMES

NAMES[youtube]="YouTube"
NAMES[gmail]="Gmail"
NAMES[outlook]="Outlook"
NAMES[whatsapp]="WhatsApp Web"
NAMES[spotify]="Spotify"
NAMES[instagram]="Instagram"
NAMES[telegram]="Telegram Web"
NAMES[discord]="Discord"
NAMES[github]="GitHub"

declare -A COMMENTS

COMMENTS[youtube]="YouTube en Brave"
COMMENTS[gmail]="Gmail en Brave"
COMMENTS[outlook]="Outlook en Brave"
COMMENTS[whatsapp]="WhatsApp Web en Brave"
COMMENTS[spotify]="Spotify en Brave"
COMMENTS[instagram]="Instagram en Brave"
COMMENTS[telegram]="Telegram Web en Brave"
COMMENTS[discord]="Discord en Brave"
COMMENTS[github]="GitHub en Brave"

# ============================================================
# 6. DESCARGAR ICONOS SVG
# ============================================================

echo
echo "=============================================="
echo " RT-Linux-Theme — WebApps"
echo "=============================================="
echo

echo "Creando estructura:"
echo
echo "$THEME_DIR"
echo "└── webapps"
echo "    ├── icons"
echo "    └── applications"
echo

echo "Descargando iconos..."
echo

for APP in youtube gmail outlook whatsapp spotify instagram telegram discord github
do

    ICON_FILE="$ICON_DIR/$APP.svg"

    echo -n "  $APP.svg ... "

    if curl -fsSL "$BASE_URL/$APP" -o "$ICON_FILE"; then
        echo "OK"
    else
        echo "ERROR"
        rm -f "$ICON_FILE"
    fi

done

# ============================================================
# 7. CREAR ARCHIVOS .DESKTOP
# ============================================================

echo
echo "Creando archivos .desktop..."
echo

for APP in youtube gmail outlook whatsapp spotify instagram telegram discord github
do

    DESKTOP_FILE="$DESKTOP_DIR/$APP.desktop"
    ICON_FILE="$ICON_DIR/$APP.svg"

    cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=${NAMES[$APP]}
GenericName=${NAMES[$APP]}
Comment=${COMMENTS[$APP]}
Exec=$BRAVE --app=${URLS[$APP]}
Icon=$ICON_FILE
Terminal=false
StartupNotify=true
Categories=Network;
EOF

    chmod +x "$DESKTOP_FILE"

    echo "  [OK] ${NAMES[$APP]}"

done

# ============================================================
# 8. INSTALAR .DESKTOP PARA ROFI
# ============================================================

echo
echo "Instalando aplicaciones para Rofi..."
echo

for APP in youtube gmail outlook whatsapp spotify instagram telegram discord github
do

    cp "$DESKTOP_DIR/$APP.desktop" \
       "$SYSTEM_APPS/$APP.desktop"

    chmod +x "$SYSTEM_APPS/$APP.desktop"

    echo "  [OK] ${NAMES[$APP]}"

done

# ============================================================
# 9. ACTUALIZAR BASE DE DATOS DE APLICACIONES
# ============================================================

if command -v update-desktop-database >/dev/null 2>&1; then

    update-desktop-database "$SYSTEM_APPS" 2>/dev/null || true

fi

# ============================================================
# 10. MOSTRAR RESULTADO
# ============================================================

echo
echo "=============================================="
echo " INSTALACIÓN COMPLETADA"
echo "=============================================="
echo

echo "Estructura creada:"
echo

echo "$THEME_DIR/"
echo "└── webapps/"
echo "    ├── icons/"
echo "    │   ├── youtube.svg"
echo "    │   ├── gmail.svg"
echo "    │   ├── outlook.svg"
echo "    │   ├── whatsapp.svg"
echo "    │   ├── spotify.svg"
echo "    │   ├── instagram.svg"
echo "    │   ├── telegram.svg"
echo "    │   ├── discord.svg"
echo "    │   └── github.svg"
echo "    │"
echo "    └── applications/"
echo "        ├── youtube.desktop"
echo "        ├── gmail.desktop"
echo "        ├── outlook.desktop"
echo "        ├── whatsapp.desktop"
echo "        ├── spotify.desktop"
echo "        ├── instagram.desktop"
echo "        ├── telegram.desktop"
echo "        ├── discord.desktop"
echo "        └── github.desktop"
echo

echo "Los .desktop también están instalados en:"
echo
echo "$SYSTEM_APPS"
echo

echo "Para abrir Rofi:"
echo
echo "rofi -show drun"
echo

echo "=============================================="
echo " RT-Linux-Theme WebApps listo."
echo "=============================================="
echo
