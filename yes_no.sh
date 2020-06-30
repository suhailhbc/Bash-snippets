#!/bin/bash

read -p "Enter [Y / N]: " value

if [ ${value^^} == "Y" ]; then
    echo -e "YES";
elif [ ${value^^} == "N" ]; then
    echo -e "NO";
else
    echo -e "Invalid Value Entered";
    exit -1;
fi
exit 0
