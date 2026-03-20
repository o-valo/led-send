#!/bin/bash

# ==============================================================================
# led-send.sh - Vereinfachter Wrapper für pypixelcolor
# ==============================================================================

# Konfiguration
VENV_NAME="led_env"
MAC_ADRESSE="AC:B8:89:3C:67:5B"
FARBE="000000"
FONT="VCR_OSD_MONO"

# 1. Virtuelle Umgebung prüfen/aktivieren
if [[ -z "$VIRTUAL_ENV" ]]; then
    # Ermittelt das Verzeichnis, in dem dieses Skript liegt
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    if [ -d "$SCRIPT_DIR/$VENV_NAME" ]; then
        source "$SCRIPT_DIR/$VENV_NAME/bin/activate"
    else
        echo "Fehler: Virtuelle Umgebung '$VENV_NAME' nicht in $SCRIPT_DIR gefunden."
        echo "Bitte führe zuerst die Installation aus."
        exit 1
    fi
fi

# 2. Input-Logik (Pipe oder Argumente)
if [ ! -t 0 ]; then
    # Daten kommen über eine Pipe (z.B. echo "Test" | ./led-send.sh)
    TEXT_ZU_SENDEN=$(cat -)
elif [ $# -gt 0 ]; then
    # Daten kommen als Argumente (z.B. ./led-send.sh Hallo Welt)
    TEXT_ZU_SENDEN="$*"
else
    echo "Fehler: Kein Text oder Befehl übergeben."
    echo "Nutzung:"
    echo "  Direkt:  $0 Hallo Welt"
    echo "  Befehl:  $0 \$(date +%H:%M)"
    echo "  Pipe:    date | $0"
    exit 1
fi

# Bereinigung: Zeilenumbrüche entfernen
TEXT_ZU_SENDEN=$(echo "$TEXT_ZU_SENDEN" | tr -d '\n')

echo "Sende: '$TEXT_ZU_SENDEN' an $MAC_ADRESSE..."

# Der eigentliche pypixelcolor-Aufruf
pypixelcolor -a "$MAC_ADRESSE" -c send_text "$TEXT_ZU_SENDEN" \
    animation=1 speed=100 bg_color="$FARBE" font="$FONT"

#EOF
