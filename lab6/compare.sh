# !/bin/bash

echo "Input first number: "
read first

echo "Input second number: "
read second

if [ $first -eq $second ]; then
    echo "$first equals $second"
elif [ $first -lt $second ]; then
    echo "$first is lower than $second"
elif [ $first -gt $second ]; then
    echo "$first is higher than $second"
fi
