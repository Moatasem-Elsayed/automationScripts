#!/bin/bash

wiki="/home/moatsem/scripts/wiki.sh"

app=$(echo -e "cpp\nrust\npython" | rofi -dmenu -p "select app")
function pythonHandler() {
    list=$(${wiki} python list)
    selceted=$(echo "$list" | rofi -dmenu)

    if [ -n "$selceted" ]; then
        examples=$(${wiki} python "$selceted")
        # echo "${examples}" >~/deletedvimfile.cpp
        echo "$examples" >/home/moatsem/deletedvimfile.py
        # terminator -e "/bin/bash -i -c 'cat /home/moatsem/deletedvimfile.py && read -p 'thank you ' test '"
        gnome-terminal --window --full-screen -- bash -c "cat /home/moatsem/deletedvimfile.py && read -p 'thank you' "
        rm ~/deletedvimfile.py
    fi
}
function cppHandler() {
    list=$(${wiki} cpp list)
    selceted=$(echo "$list" | rofi -dmenu)

    if [ -n "$selceted" ]; then
        examples=$(${wiki} cpp "$selceted")
        # echo "${examples}" >~/deletedvimfile.cpp
        echo "$examples" >/home/moatsem/deletedvimfile.cpp
        # terminator -e "/bin/bash -i -c 'cat /home/moatsem/deletedvimfile.cpp && read -p 'thank you ' test '"
        gnome-terminal --window --full-screen -- bash -c "cat /home/moatsem/deletedvimfile.cpp && read -p 'thank you' "
        rm ~/deletedvimfile.cpp
    fi
}
function rustHandler() {
    list=$(${wiki} rust list)
    selceted=$(echo "$list" | rofi -dmenu)

    if [ -n "$selceted" ]; then
        examples=$(${wiki} rust "$selceted")
        # echo "${examples}" >~/deletedvimfile.rs
        echo "$examples" >/home/moatsem/deletedvimfile.rs
        gnome-terminal --window --full-screen -- bash -c "cat /home/moatsem/deletedvimfile.rs && read -p 'thank you' "
        rm ~/deletedvimfile.rs
    fi
}
case $app in
cpp)
    cppHandler
    ;;
rust)
    rustHandler
    ;;
python)
    pythonHandler

    ;;

esac
