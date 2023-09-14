#!/bin/sh

current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

layout_1="latam"
layout_2="us"

if [ "$current_layout" == "$layout_1" ]; then
    new_layout="$layout_2"
else
    new_layout="$layout_1"
fi

setxkbmap "$new_layout"
