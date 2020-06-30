#!/bin/bash

for number in {1..99}; do
        remainder=$(( $number % 2 ))
        if [ $remainder != 0 ]; then
            echo -e "$number";
        fi
done
