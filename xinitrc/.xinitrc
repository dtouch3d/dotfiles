#!/usr/bin/env bash

# Map Caps Lock to Ctrl when holded, Esc when pressed
setxkbmap -layout us,gr -option 'grp:alt_shift_toggle,ctrl:nocaps' &
xcape &

# Memento Mori
feh --bg-fill Dropbox/Photos/DeathDying_TheSeventhSeal.jpg &

~/src/suckless/dwm-6.0/dwm-statusbar.sh &

# dropbox start &

# this will keep the primary in sync
# with the clipboard buffer

autocutsel -selection CLIPBOARD -fork
autocutsel -selection PRIMARY -fork

~/src/artproject/artproject.sh &

exec dwm
