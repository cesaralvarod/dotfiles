#!/bin/sh
xrandr --output eDP1 --primary --mode 1600x900
xrandr --output HDMI2 --mode 1920x1080
xrandr --output HDMI2 --left-of eDP1
