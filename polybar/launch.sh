#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
    echo $m
    MONITOR=$m polybar main -r -c $HOME/.config/polybar/config.ini &

    # MONITOR=$m polybar barleft -r -c $HOME/.config/polybar/config.ini &
    # MONITOR=$m polybar barcenter -r -c $HOME/.config/polybar/config.ini & 
    # MONITOR=$m polybar barright -r -c $HOME/.config/polybar/config.ini &


done;
