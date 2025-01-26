#!/bin/bash

values=$(cat $"$HOME/.bookmarks.txt")

selected_value=$(echo -e "${values[@]}" | rofi -dmenu -p "bookmark a/r/:")
if [[ "$selected_value" == "add" ]]; then
    result=$(xclip -o sel)
    echo "$result" >>"$HOME/.bookmarks.txt"
# Check if a value was selected
elif [[ $selected_value == "rm" ]]; then
    selected_value=$(echo -e "${values[@]}" | rofi -dmenu -p "select:")
    if [ -n "$selected_value" ]; then
        data=$(grep -v "$selected_value" ~/.bookmarks.txt)
        echo "$data" >~/.bookmarks.txt
    fi
elif [[ -n $selected_value ]]; then

    firefox "$selected_value"
fi
