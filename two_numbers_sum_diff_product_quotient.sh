#!/bin/bash

read -p "Enter 1st Number: " num_1
read -p "Enter 2nd Number: " num_2

sums=$(( $num_1 + $num_2 ));
diffs=$(( $num_1 - $num_2 ));
prods=$(( $num_1 * $num_2 ));
quots=$(( $num_1 / $num_2 ));

echo -e ${sums};
echo -e ${diffs};
echo -e ${prods};
echo -e ${quots};
exit 0
