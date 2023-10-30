#!/bin/bash

# Script Name:                  challenge6
# Author:                       Arturo Laguna
# Date of latest revision:      10/30/2023
# Purpose:                      Code Fellows 201 Ops Challenge Class 6

# READ ME --------------------------
# First time I used ChatGPT
# WOW IT WERXS
# AI FINNA TAKE ALL OUR JERBS
# Just added comments for me to learn what it does and clarify tidbits
# ----------------------------------

# Array of file or directory paths to check and create
paths_to_check=("directory1" "file1.txt" "directory2")

# Loop through the paths
for path in "${paths_to_check[@]}"; do
    # Check if the path exists
    # -e makes sure it returns TRUE if it exists no matter WHAT it is
    # ; otherwise then must be in a separate line
    # [] replaces test built-in command
    if [ -e "$path" ]; then
        echo "$path already exists."
    else
        # Check if it should be a file or a directory based on its extension
        # [[]] allows for comparisons to be made
        if [[ "$path" == *.* ]]; then
            # It's a file
            touch "$path"
            echo "Created file: $path"
        else
            # It's a directory
            mkdir -p "$path"
            echo "Created directory: $path"
        fi
    fi
done
# Deleting them since I do not want them bad boys
for path in "${paths_to_check[@]}"; do
    if [ -e "$path" ]; then
        rm -r "$path"
        echo "Deleted $path"
    else
            echo "$path not there"
    fi
done