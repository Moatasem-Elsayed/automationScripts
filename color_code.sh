#!/bin/bash

# Create an array of ANSI color codes and color names
declare -A colors=([Red]="\e[31m"
    [Green]="\e[32m"
    [Yellow]="\e[33m"
    [Blue]="\e[34m"
    [Magenta]="\e[35m"
    [Cyan]="\e[36m"
    [White]=:"\e[37m"
    [BOLD]="\e[1m"
    [ITALIC]="\e[3m"
    [UNDERLINE]="\e[4m"
    [RESET]="\e[0m"
)
color_names=("Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "White" "BOLD" "ITALIC" "UNDERLINE" "RESET")

# Use rofi -dmenu to select a color
selected_color=$(printf "%s\n" "${color_names[@]}" | rofi -dmenu -p "Select a color:")

# echo "${colors[$selected_color]}" | xclip -sel clip
xdotool type -delay 20 "${colors[$selected_color]}"
