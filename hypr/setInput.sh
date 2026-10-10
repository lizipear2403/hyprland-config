#!/bin/bash

devs=$(cat /proc/bus/input/devices)

if echo "$devs" | grep "EWEADN" -q ; then 
    echo "Have Mouse" 
    hyprctl eval 'hl.config({input={sensitivity=-0.7}})'
else
    echo "Without Mouse"
    hyprctl eval 'hl.config({input={sensitivity=0}})'
fi
