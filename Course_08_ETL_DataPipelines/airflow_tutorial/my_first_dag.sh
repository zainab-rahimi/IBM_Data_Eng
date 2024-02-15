#!/bin/bash

echo "starting extract transform load"

cut -d ":" -f1,3,6 /etc/passwd > /home/zainab/Data_eng/Course_08_ETL_DataPipelines/airflow_tutorial/extracted-data.txt
tr ":" "," < /home/zainab/Data_eng/Course_08_ETL_DataPipelines/airflow_tutorial/extracted-data.txt > /home/zainab/Data_eng/Course_08_ETL_DataPipelines/airflow_tutorial/transformed_data.txt