#!/bin/bash

# Script Name:                  challenge7
# Author:                       Arturo Laguna
# Date of latest revision:      10/31/2023
# Purpose:                      Code Fellows 201 Ops Challenge Class 7

# READ ME --------------------------
# Second time I used ChatGPT
# Makes finding the GREP settings so much easier
# AI FINNA TAKE ALL OUR JERBS
# ----------------------------------
echo "CPU:"
echo
sudo lshw -class cpu | grep -E "product:|vendor:|physical id:|bus info:|width:"
echo
echo "RAM:"
echo
sudo lshw -class memory | awk '/description: System Memory/,/size:/' | grep -v "slot:"
echo
echo "Display Adapter:"
echo
sudo lshw -class display | grep -E "description:|product:|vendor:|physical id:|bus info:|width:|clock:|capabilities:|configuration:|resources:"
echo
echo "Network Adapter:"
echo
sudo lshw -class network | grep -E "description:|product:|vendor:|physical id:|bus info:|logical name:|version:|serial:|size:|capacity:|width:|clock:|capabilities:|configuration:|resources:"
echo