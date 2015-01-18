#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

#feh --no-xinerama --bg-center /D/Dropbox/Photos/mountain_moon.jpg
#feh --bg-fill /D/Dropbox/Photos/tenacity.png &
#feh --bg-center /D/Dropbox/Photos/dream_dark.png
feh --bg-fill /D/Dropbox/Photos/DeathDying_TheSeventhSeal.jpg &
#redshift -l 40.65:22.9 -t 5600:5000 -b 0.7 &

# Toggle greek with alt+space, set caps lock as control key when pressed once
setxkbmap us,el -option 'grp:lwin_toggle,ctrl:nocaps' &
# escape
xcape &

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

xsetroot -cursor_name left_ptr &
xset +fp /usr/share/fonts/local/

hdparm -S 255 /dev/sda
hdparm -B 255 /dev/sda

#xscreensaver -no-splash &
/home/dtouch3d/src/suckless/dwm-6.0/dwm-statusbar.sh &

dropbox start &

exec dwm
