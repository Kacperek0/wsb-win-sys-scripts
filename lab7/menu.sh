#!/bin/bash

# variables
delay_time=2
username=$(whoami)
home_catalog=$(eval echo ~$USER)
free_memory=$(free)
total_disk_space=$(df -l)
tmpfile=tmp.txt
home_size=$(cd ~ | du -hs)
sudo_home_size=$(for f in /home/*; do du -sh $f; done)



# functions
function get_system_info() {

    echo "*************************************************************" >> $tmpfile
    echo "*** System info ***" >> $tmpfile
    echo "User name: $username" >> $tmpfile
    echo "Home catalog: $home_catalog" > $tmpfile
    echo "Memory info:" >> $tmpfile
    echo "-----------------------------------------" >> $tmpfile
    echo "$free_memory" >> $tmpfile
    echo "-----------------------------------------" >> $tmpfile
    echo "Total disk space" >> $tmpfile
    echo "-----------------------------------------" >> $tmpfile
    echo "$total_disk_space" >> $tmpfile
    echo "-----------------------------------------" >> $tmpfile
    echo "Home catalog space:" >> $tmpfile

    if [ "$EUID" -ne 0 ]; then
        echo "$home_size" >> $tmpfile
    else
        echo "$sudo_home_size" >> $tmpfile
    fi

    read -p "Data collected. Press any key to continue" -s -n1
    sleep $delay_time
    clear
}

function print_info() {

    cat $tmpfile
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

if [ -f "$tmpfile" ]; then
    rm $tmpfile
fi

touch $tmpfile

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
