xset r rate 210 35

conky | while read -r; do xsetroot -name "$REPLY"; done &
feh --bg-fill dotfiles/wp.jpg 
dwm
