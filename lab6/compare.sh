# !/bin/bash

echo "Input first number: "
read first

echo "Input second number: "
read second

function compare {
    if [ $1 -eq $2 ]; then
        echo "$1 equals $2"
    elif [ $1 -lt $2 ]; then
        echo "$1 is lower than $2"
    elif [ $1 -gt $2 ]; then
        echo "$1 is higher than $2"
    fi
}

compare $first $second
