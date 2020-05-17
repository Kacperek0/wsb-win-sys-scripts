#!/bin/bash

date=$(date +"%A, %-d/%m/%Y, %T")
memory=$(free | grep Mem: | awk -F" " '{ print $2 }')

echo "Witaj uzytkowniku $USER"
echo "Dzisiejsza data to: $date"
echo "Aktualnie znajdzujesz sie w katalogu: $(pwd)"
echo "Twoj katalog domowy to: $HOME"
echo "Aktualny stan pamieci systemu: $memory"
