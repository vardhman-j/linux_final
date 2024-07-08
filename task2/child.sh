#!/bin/bash

num1=$1
num2=$2

# sleep 10
#Check if num2 is zero
if [ $num2 -eq 0 ]; then
    echo "Error: Division by zero!"
    exit -1
fi

result=$(awk "BEGIN { printf \"%.3f\", $num1/$num2 }")
# results=(echo "scale=2; $num1 / $num2" | bc)

echo "Result of $num1 / $num2 = $result"
# echo "$result"