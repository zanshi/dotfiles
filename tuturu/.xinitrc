
#/usr/bin/start-pulseaudio-x11 &


# fonts

mkfontdir ~/.local/share/fonts
mkfontscale ~/.local/share/fonts
xset +fp ~/.local/share/fonts
xset fp rehash

# mouse
xset m 0 0

# Disable DPMS turning off screen
xset -dpms
xset s off

# keyboard
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#test -r "$HOME/.Xresources" && XRESOURCES="$XRESOURCES 
#$HOME/.Xresources"
#cat /dev/null $XRESOURCES | xrdb -nocpp -merge -

xset r rate 150 80
setxkbmap -model pc105 -layout se,us -variant , -option grp:alt_shift_toggle

## bspwm
#xsetroot -cursor_name left_ptr

#xfsettingsd
#unclutter -noevents &
#redshift &
xrandr --output DVI-0 --auto --output DVI-1 --auto --right-of DVI-0
#sxhkd -f 100 &
#nitrogen --restore &
#compton --config ~/.config/compton.conf &
#exec bspwm


## i3
exec i3 
#exec startxfce4
