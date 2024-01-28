#!/bin/bash

#Download the synthetic historical forecasting accuracy dataset from the below link 
#wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-LX0117EN-Coursera/labs/synthetic_historical_fc_accuracy.tsv

#Load the historical accuracies into an array covering the last week of data
last_week_accuracy=($(tail -n 7  synthetic_historical_fc_accuracy.tsv | cut  -f6 ))


# The way I did 
for i in ${last_week_accuracy[@]} 
do
    echo -e "$i"
done
## The below solution is from the lab itself
# for i in {0..6}; do
#     echo ${last_week_accuracy[$i]}
# done

############ Display the minimum and maximum absolute forecasting errors for the week###########

for i in ${last_week_accuracy[@]}; do
    ## Check for negative numbers
    if (( ${last_week_accuracy[i]} < 0 )) ; then
        i=$(( -i ))
    fi
done

minimum=${last_week_accuracy[1]}
maximum=${last_week_accuracy[1]}
for item in ${weeklast_week_accuracy_fc[@]}; do
   if [[ $minimum > $item ]]
   then
     minimum=$item
   fi
   if [[ $maximum < $item ]]
   then
     maximum=$item
   fi
done
echo "minimum ebsolute error = $minimum"
echo "maximum absolute error = $maximum"