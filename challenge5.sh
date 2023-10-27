#!/bin/bash

# Script Name:                  challenge5
# Author:                       Arturo Laguna
# Date of latest revision:      10/27/2023
# Purpose:                      Code Fellows 201 Ops Challenge Class 5

# Declaration of variables
# Declaration of functions

# Main
# repeats forever
while :
do
    # prints the processes
    ps -aux
    printf "\n\n Press CTRL + C to exit \n\n"
    printf " Enter PID to kill \n\n"
    # allows user input
    read response
    # kills the process
    kill $response
done
# End