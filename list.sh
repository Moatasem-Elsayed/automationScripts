#!/bin/bash

# Read each line from the file and append it to the array
values=$(cat $"$HOME/.notes.txt")
# Prompt user to select a value using Rofi
selected_value=$(echo -e "${values[@]}" | rofi -dmenu -p "add/rm/:")
if [ "$selected_value" == "add" ]; then
  # Show the dmenu and capture the selected option in the variable "result"
  result=$(rofi -dmenu -p "Enter something:")
  # Print the selected option (entered text) to the terminal
  echo "You entered: $result"
  values+=("${result}")
  echo -e "$result" >>"$HOME/.notes.txt"
# Check if a value was selected
elif [[ $selected_value == "rm" ]]; then
  code "$HOME/.notes.txt"
elif [[ -n $selected_value ]]; then
  # echo "value is $selected_value"| xclip -selection clipboard
  # Paste the selected value into the terminal
  #printf "%s" "$selected_value" | xclip -selection clipboard
  #xdotool key --clearmodifiers Shift+Inserts
  xdotool type --delay 10 "$selected_value"
fi
#the key command is used to generate keyboard events and simulate key presses. In this case, we are specifying the key combination Shift+Insert. The --clearmodifiers option ensures that no other modifier keys (such as Ctrl or Alt) are active when the key combination is simulated.
