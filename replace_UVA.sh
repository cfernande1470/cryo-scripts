#!/bin/bash

#    Use:
#   ./sum2column.sh your_input.star your_output.star
#

awk '/_rln/ {print}' $1 | nl
read -p "Column U `echo $'\n> '`" U1
read -p "Column V `echo $'\n> '`" V1
read -p "Column Angle `echo $'\n> '`" A1

awk '/_rln/ {print}' `ls *_local.star | head -1` | nl
read -p "Column U local `echo $'\n> '`" U2
read -p "Column V local`echo $'\n> '`" V2
read -p "Column Angle local`echo $'\n> '`" A2

awk '!/@/ {print}' $1 > $2

for f in *_local.star
do
awk  "/${f%_local.star}/" $1 > ${f%_local.star}.temp
awk "/mrc/" $f > ${f%_local.star}_local_clean.star

awk -v U1=$U1 -v U2=$U2  'FNR==NR{a[NR]=$U2;next}{$U1=a[FNR]}1' ${f%_local.star}_local_clean.star ${f%_local.star}.temp > ${f%_local.star}.atemp
awk -v V1=$V1 -v V2=$V2  'FNR==NR{a[NR]=$V2;next}{$V1=a[FNR]}1' ${f%_local.star}_local_clean.star ${f%_local.star}.atemp > ${f%_local.star}.btemp
awk -v A1=$A1 -v A2=$A2  'FNR==NR{a[NR]=$A2;next}{$A1=a[FNR]}1' ${f%_local.star}_local_clean.star ${f%_local.star}.btemp >> $2

done

rm *temp

