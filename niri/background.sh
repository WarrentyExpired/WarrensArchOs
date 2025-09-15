#!/usr/bin/env bash
ps aux|grep -i swaybg|grep -v grep|awk {'print $2'}| xargs kill
walldir=/home/$USER/Pictures/Wallpapers
rbg=$(ls -d $walldir/* | shuf -n 1)
swaybg -m fill -i "$rbg"

