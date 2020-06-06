#!/bin/bash

# variables
selection=
delay_time=2
username=$(whoami)


# functions
function get_system_info() {
    read -p "Press any key to continue" -s -n1
    sleep $delay_time
    clear
}

function print_info() {

    read -p "Press any key to continue" -s -n1
    sleep $delay_time
    clear
}


function menu() {
    echo "
*************************************
* 1 - Get system info               *
* 2 - Print saved info              *

* 0 - Exit                          *
*************************************
"
}

# main

while [ true ]; do
    menu
    read -p "Please select [1, 2, 0]: " selection
    case $selection in
        1 ) get_system_info;;
        2 ) print_info;;
        0 ) exit;;
        * )
            echo " You did not select 1, 2 or 0"
    esac

done
