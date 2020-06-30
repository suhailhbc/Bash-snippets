#!/bin/bash

read X;

output=$(echo "$X" | bc -l);

printf "%.3f" $output;
exit 0;
