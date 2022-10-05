#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf --experimental-backends --vsync &

~/.config/polybar/launch.sh &
feh --bg-fill ~/pics/bg/touka1.png &
