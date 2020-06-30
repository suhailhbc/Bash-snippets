#!/bin/bash

read -p "Enter 1st Number: " X;
read -p "Enter 2nd Number: " Y;

if [ ${X} -gt ${Y} ]; then
    echo -e "X is greater than Y";
elif [ ${X} -lt ${Y} ]; then
    echo -e "X is less than Y";
else
    echo -e "X is equal to Y";
fi
exit 0
