#!/bin/bash

a="$(swaymsg -t get_tree | jq '.. | objects | select(.type == "con") | select(.focused == true) | .marks | index("t") != null')"

#echo $a
if [ $a = "true" ]; then
    swaymsg '[con_mark="l"] focus'
else
    swaymsg 'mark --add "l"; [con_mark="t"] focus'
fi

