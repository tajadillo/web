#!/bin/sh

DOCS=$(find /media/tajadillo/TAJADILLO/documentos/ -name "*.txt" | less | dmenu -l 10 -i -p "Cual Manual Quieres Ver?")
PROGRAM=nvim
kitty --execute $PROGRAM "$DOCS"

