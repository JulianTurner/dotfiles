#!/bin/bash
notify-send "VM" "Opening Windows VM..." -t 2000
xfreerdp -grab-keyboard /v:192.168.122.28 /u:Julian /p:Ruzica1988 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive