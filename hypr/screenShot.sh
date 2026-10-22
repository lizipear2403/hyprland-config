#!/bin/bash

inotifywait -m  -e close_write $HOME/mark-shot | while read -r dir eve file 
do 
    file="$dir$file"    
    cat "$file"  | wl-copy 
    cp "$file" /mnt/localNetDisk/clip.png
done    
