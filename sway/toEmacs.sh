#!/bin/bash

#get be to emacs and back

f=$(swaymsg -t get_tree | jq '.. | objects | select(.focused) | .app_id')


if [ $f = '"emacs"' ]; then
    swaymsg '[con_mark="E"] focus'
else
    swaymsg 'mark --add "E"; [app_id="emacs"] focus'
fi
