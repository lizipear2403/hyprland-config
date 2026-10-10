#!/bin/bash

while inotifywait -e modify $HOME/mark-shot; do 
    sleep 1 
    find /home/lizi/mark-shot -amin 1 -exec cat {}   \; | wl-copy 
done    
