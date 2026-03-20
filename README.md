# led-send 🚀

Ein Tool zur drastischen Vereinfachung der Nutzung von `pypixelcolor`. Es automatisiert die Aktivierung der Python-Umgebung und ermöglicht das Senden von Texten direkt über die Kommandozeile oder Pipes.

## ⚡ ## Installation

1. Repo klonen
2. `./install.sh` ausfuehren
3. MAC-Adresse in `led-send.sh` anpassen

## Nutzung

Das Skript erkennt automatisch, ob Text per Argument oder per Pipe uebergeben wird.

### Als Argument:
./led-send.sh "Hallo Welt"

### Per Pipe:
date +%H:%M | ./led-send.sh

### System-Status:
echo "CPU Temp: $(vcgencmd measure_temp)" | ./led-send.sh
