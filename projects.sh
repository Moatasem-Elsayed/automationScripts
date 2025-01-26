#!/bin/bash

# Read each line from the file and append it to the array
values=$(cat $"$HOME/.projects.txt")

# Prompt user to select a value using Rofi
selected_value=$(echo -e "${values[@]}" | rofi -dmenu -p "add/rm/:" -i)
if [[ "$selected_value" == "add" ]]; then
    # Show the dmenu and capture the selected option in the variable "result"
    result=$(rofi -dmenu -p "Enter something:")
    tilda=$(echo "$result" | grep "~" | sed 's/~/\/home/moatsem/g')
    if [ -z "$tilda" ]; then
        echo "$result" >>"$HOME/.projects.txt"
    else
        echo "$tilda" >>"$HOME/.projects.txt"
    fi
# Check if a value was selected
elif [[ $selected_value == "rm" ]]; then
    selected_value=$(echo -e "${values[@]}" | rofi -dmenu -p "select:")
    if [ -n "$selected_value" ]; then
        data=$(grep -v "$selected_value" ~/.projects.txt)
        echo "$data" >~/.projects.txt
    fi
elif [[ -n $selected_value ]]; then

    code "$selected_value"
fi
