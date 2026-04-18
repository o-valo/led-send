#!/bin/bash


# Name des venv-Ordners (hier anpassen, falls deiner anders heißt, z.B. .venv)
VENV_NAME="led_env"

# 1. Prüfen, ob die Umgebung bereits aktiv ist
if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "Bereits in einer virtuellen Umgebung: $VIRTUAL_ENV"
else
    # 2. Prüfen, ob der venv-Ordner im aktuellen Verzeichnis existiert
    if [ -d "$VENV_NAME" ]; then
        echo "Aktiviere Umgebung aus $VENV_NAME..."
        source "$VENV_NAME/bin/activate"
    else
        echo "Fehler: Keine Umgebung '$VENV_NAME' gefunden."
        echo "Möchtest du sie mit 'python3 -m venv $VENV_NAME' erstellen?"
        # Optional: Hier könnte man das Erstellen automatisieren
    fi
fi

# Hier kannst du dein eigentliches Programm starten, z.B.:
# python3 dein_skript.py




# --- Konfiguration ---
MAC_ADRESSE="AC:B8:89:3C:67:5B"
FARBE="000000"
FONT="VCR_OSD_MONO"

# --- Input-Logik ---
# 1. Prüfen, ob Daten über eine Pipe kommen (z.B. date | ./led-send.sh)
if [ ! -t 0 ]; then
    TEXT_ZU_SENDEN=$(cat -)
# 2. Wenn keine Pipe, dann alle Argumente nehmen (z.B. ./led-send.sh Hallo Welt)
elif [ $# -gt 0 ]; then
    TEXT_ZU_SENDEN="$*"
else
    echo "Fehler: Kein Text oder Befehl übergeben."
    echo "Nutzung:"
    echo "  Direkt:  $0 Hallo Welt"
    echo "  Befehl:  $0 \$(date +%H:%M)"
    echo "  Pipe:    date | $0"
    exit 1
fi

# Bereinigung: Zeilenumbrüche entfernen (pypixelcolor mag meist einzeiligen Text lieber)
TEXT_ZU_SENDEN=$(echo "$TEXT_ZU_SENDEN" | tr -d '\n')

echo "Sende: '$TEXT_ZU_SENDEN' an $MAC_ADRESSE..."

# Der eigentliche pypixelcolor-Aufruf
pypixelcolor -a "$MAC_ADRESSE" -c send_text "$TEXT_ZU_SENDEN" \
    animation=1 speed=100 bg_color="$FARBE" font="$FONT"
~
~
~
