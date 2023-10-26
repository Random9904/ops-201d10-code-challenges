#!/bin/bash

# Script Name:                  helloworld2
# Author:                       Arturo Laguna
# Date of latest revision:      10/26/2023
# Purpose:                      Code Fellows 201 Ops Challenge Class 4

# Declaration of variables

# Declaration of functions

# -------------------------------------------------
# README ----------------------------------------
# "mkdir -p" would be used but I do not want to keep 
# creating directories, destroy them, etc. 
# and go beyond the scope of the Ops Challenge.
# I will be using dummy variables instead.
# ------------------------------------------------
# ------------------------------------------------
muhDirectories() {
    # Four directories 'created'
    # "mkdir -p" would be used here for all four
    dir1="Apples"
    dir2="Oranges"
    dir3="Tomatoes"
    dir4="Bananas"
    # Storing them into the array
    breadBox=($dir1,$dir2,$dir3,$dir4)
    # "Creating the .txt file"
    # "touch" would be used here for all four
    breadBox[0]="Yum.txt"
    breadBox[1]="Delicious.txt"
    breadBox[2]="Hateem.txt"
    breadBox[3]="Sweet.txt"

    # Show all the contents in the array are there
    echo ${breadBox[*]}

    # Not sure how BASH works entirely, but I would
    # destroy all the newly created directories here
    # assuming BASH did not destroy them after terminal is destroyed
}

# Main
muhDirectories
# End