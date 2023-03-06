#!/bin/sh

# compositor
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf -b &

# xinput disable 19 &

# ~/.config/polybar/launch.sh &
~/.fehbg &
dunst &
autotiling &

#sxhkd
sxhkd -c $HOME/.config/i3/sxhkd/sxhkdrc &

# laptop monitor off is external monitor is connected
#
xrandr | grep 'HDMI1 connected' > /dev/null && xrandr --output eDP1 --off & 
