#!/bin/bash

number=1

while [ $number -le 10 ]; do
    printf "$number "
    number=$((number + 1))
done
