# led-send 🚀

Ein Tool zur drastischen Vereinfachung der Nutzung von `pypixelcolor`. Es automatisiert die Aktivierung der Python-Umgebung und ermöglicht das Senden von Texten direkt über die Kommandozeile oder Pipes.

## ⚡ Installation

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

### Sendet das aktuelle Wetter aus die Matrix :-)
curl wttr.in/Berlin?format=3 | ./led-send.sh 

### um die Matrix auf dunkel zu schalten: 
./led-send.sh " "  



Powerd by AI



![Demo Video](LED-send-example.mp4)

<video src="LED-send-example.mp4" width="600" controls>
  Dein Browser unterstützt das Video-Tag nicht.
</video>



Links:   https://github.com/lucagoc/pypixelcolor   `pypixelcolor`

