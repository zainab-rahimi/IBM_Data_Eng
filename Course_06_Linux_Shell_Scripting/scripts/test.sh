#! /bin/bash


# save the csv file as a variable
csv_file="./arrays_table.csv"

## parse the csv as 3 separate arrays

column_1=($(cut -d "," -f 1 $csv_file))
echo "${column_1[@]}"