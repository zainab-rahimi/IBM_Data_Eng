#!/bin/bash

########### Create a script to report historical forecasting accuracy########

header=$(echo -e "year\tmonth\tday\tobs_temp\tfc_temp\taccuracy\taccuracy_range")
echo $header > historical_fc_accuracy.tsv

#### Determine the difference between today's forecasted and actual temperatures####
# Extract the forecasted and observed temperatures for today and store them in variables

## For finding the differnece, since we don't have many data we append some fake data
echo -e "2024, 01, 26, 22, 21"  >> ./rx_poc.log

yesterday_fc=$(tail -2 rx_poc.log | head -1 | cut -d "," -f5)
echo "Yesterday's fc: $yesterday_fc"
today_temp=$(tail -1 rx_poc.log | cut -d "," -f4)
echo "Today's temp: $today_temp"
accuracy=$(($yesterday_fc-$today_temp))
echo "Accuracy is $accuracy"

######## Assign a label to each forecast based on its accuracy#######

if [ -1 -le $accuracy ] && [ $accuracy -le 1 ]
then
   accuracy_range=excellent
elif [ -2 -le $accuracy ] && [ $accuracy -le 2 ]
then
    accuracy_range=good
elif [ -3 -le $accuracy ] && [ $accuracy -le 3 ]
then
    accuracy_range=fair
else
    accuracy_range=poor
fi

###### Append a record to your historical forecast accuracy file #####
row=$(tail -1 rx_poc.log)
year=$(echo $row | cut -d "," -f1)
month=$(echo $row | cut -d "," -f2)
day=$(echo $row | cut -d "," -f3)
obs_temp=$(echo $row | cut -d "," -f4)
fc_temp=$(echo $row | cut -d "," -f5)

echo -e "$year,$month,$day,$obs_temp,$fc_temp,$accuracy,$accuracy_rance" >> historical_fc_accuracy.tsv