#!/bin/bash

read -p "Enter 1st size: " X;
read -p "Enter 2nd size: " Y;
read -p "Enter 3rd size: " Z;


if [[ ${X} == ${Y} && ${Y} == ${Z} ]]; then
    echo -e "EQUILATERAL";
elif [[ ${Z} > ${Y} && ${Y} > ${X} ]]; then
    echo -e "SCALENE";
elif [[ ${X} == ${Y} || ${Y} == ${Z} ]]; then
    echo -e "ISOSCELES";
else
    echo -e "Invalid sizes";
fi
exit 0;
