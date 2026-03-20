#!/bin/bash

# Installations-Skript fuer led-send.sh
echo "--- Starte Installation von led-send ---"

# 1. System-Abhaengigkeiten installieren
echo "Pruefe System-Pakete..."
sudo apt-get update && sudo apt-get install -y python3-venv python3-pip bluetooth bluez hcitool

# 2. Virtuelle Umgebung einrichten (passend zu deinem VENV_NAME)
VENV_NAME="led_env"
INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Erstelle venv in $INSTALL_DIR/$VENV_NAME..."
python3 -m venv "$INSTALL_DIR/$VENV_NAME"
source "$INSTALL_DIR/$VENV_NAME/bin/activate"

# 3. pypixelcolor installieren
echo "Installiere pypixelcolor..."
pip install --upgrade pip
pip install pypixelcolor

# 4. Bluetooth-Scan (Optional zur Ermittlung der MAC)
echo ""
read -p "Moechtest du nach der MAC-Adresse deiner Matrix scannen? (y/n): " do_scan
if [[ "$do_scan" == "y" ]]; then
    echo "Suche nach Bluetooth-Geraeten..."
    hcitool scan
    echo ""
    echo "Bitte die gefundene MAC-Adresse manuell in led-send.sh eintragen."
fi

# 5. Ausfuehrungsrechte setzen
chmod +x "$INSTALL_DIR/led-send.sh"

echo "-------------------------------------------------------"
echo "Installation abgeschlossen!"
echo "-------------------------------------------------------"
