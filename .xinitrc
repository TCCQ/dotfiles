xset r rate 210 35

conky | while read -r; do xsetroot -name "$REPLY"; done &
feh dotfiles/wp.jpg & 
dwm
