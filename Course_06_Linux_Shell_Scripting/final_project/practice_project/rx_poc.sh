#!/bin/bash

#### Extract the current tempreture and store in under the variable obs_temp############
weather_data=./weather_report


obs_temp=$(cat $weather_data | grep -m 1 "°C" | grep -o '[0-9]\+')
echo  $obs_temp

################# Extract tomorrow's noon tempreture and save it as fc_temp##########
fc_temp=$(cat $weather_data | awk 'NR==23'| grep "°C"  | cut -d 'C' -f2  | grep -o '[0-9]\+')
echo $fc_temp
#| sed "s/\.\\-\.//g"

############# Store current hour day month year in the corresponding shell varibales ######
hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

############ Merge the fields in the tab-delimited record corresponding to single row 


header=$(echo -e "year\tmonth\tday\tobs_temp\tfc_temp")
echo $header > rx_poc.log

echo $year, $month, $day, $obs_temp, $fc_temp >> rx_poc.log