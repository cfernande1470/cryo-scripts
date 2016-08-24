#!/bin/bash
awk '/_rln/ {print}' $1 | nl
read -p "Column number?" col
read -p "Add value:" value
awk '!/@/ {print}' $1 >> $2 && awk -v col=$col -v value=$value '/@/{$col = $col + $value; print}' $1 | column -t >> $2 
