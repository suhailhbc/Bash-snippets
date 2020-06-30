#!/bin/bash

read N

X=0;
Y=0;

while [[ ${Y} -lt ${N} ]]; do
    read A
    X=$(( X + A ));
    Y=$(( Y + 1 ));
done

output=$(echo "$X / $N" | bc -l);

printf "%.3f" $output;
exit 0;
