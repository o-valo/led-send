# led-send 🚀

Ein Tool zur drastischen Vereinfachung der Nutzung von `pypixelcolor`. Es automatisiert die Aktivierung der Python-Umgebung und ermöglicht das Senden von Texten direkt über die Kommandozeile oder Pipes.

## ⚡ Installation 

1. Repo klonen
2.  Für Debian & Ubuntu Systeme einfach 
 a. `./install.sh` ausfuehren.
 b. Bei CachyOS `./install-cachy-os.sh` verwenden. 
4. MAC-Adresse in `led-send.sh` anpassen


## Nutzung

Das Skript erkennt automatisch, ob Text per Argument oder per Pipe uebergeben wird.

### Als Argument:
./led-send.sh "Hallo Welt"

### Per Pipe:
date +%H:%M | ./led-send.sh

### System-Status:
echo "CPU Temp: $(vcgencmd measure_temp)" | ./led-send.sh

### Sendet das aktuelle Wetter auf die Matrix :-)
curl wttr.in/Berlin?format=3 | ./led-send.sh 

### um die Matrix auf dunkel zu schalten: 
./led-send.sh " "  



Powerd by AI

<a href="https://github.com/o-valo/led-send/raw/refs/heads/main/LED-send-example.mp4">
  <img src="https://github.com/o-valo/led-send/blob/main/images/led-foto-2.png?raw=true" alt="Demo Video" width="200">
</a>
<a href="https://github.com/o-valo/led-send/raw/refs/heads/main/LED-send-example.mp4">
  <img src="https://github.com/o-valo/led-send/blob/main/images/led-foto-1.png?raw=true" alt="Demo Video" width="200">
</a>


<p align="center">
  <video src="https://github.com/o-valo/led-send/raw/refs/heads/main/LED-send-example.mp4" width="600" controls>
    Dein Browser unterstützt das Video-Tag nicht.
  </video>
</p>
<BR>
<BR>

![Demo Video](https://github.com/o-valo/led-send/raw/refs/heads/main/LED-send-example.mp4)



<BR>

<BR>
Projekte und Links:
<BR>
Link:   https://github.com/lucagoc/pypixelcolor   `pypixelcolor` 

Link:   https://github.com/chubin/wttr.in   `Wttr.in`


<BR>
