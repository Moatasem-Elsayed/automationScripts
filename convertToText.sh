#!/bin/bash

# Directory where screenshots are saved
screenshots_directory="/home/moatsem/Pictures/Screenshots"

latest_screenshot=$(ls -t "$screenshots_directory"/*.png | head -n 1)

if [ -z "$latest_screenshot" ]; then
    echo "No screenshots found in the specified directory."
    exit 1
fi

extracted_text=$(tesseract "$latest_screenshot" stdout)

# Print the extracted text
echo "Extracted Text from $latest_screenshot:"
echo "$extracted_text" | xclip -selection clipboard


