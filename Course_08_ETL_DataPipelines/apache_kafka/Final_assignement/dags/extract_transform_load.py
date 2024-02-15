from datetime import timedelta
from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.operators.bash_operator import BashOperator

## Defining dag args 

default_args= {
    'owner': "zainab jan",
    'start_date': days_ago(0),
    'email': ['zainab@gmail.con'],
    'email_on_failur': True ,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay':timedelta(minutes=2),

}

## Defining the DAG 
 
dag = DAG(
    dag_id = 'dag_final',
    default_args= default_args,
    description= 'etl for final assignment',
    schedule_interval=timedelta(days=1),
)

## Defining the task

extract_transform_load = BashOperator(
    task_id = 'extract_transform_load',
    bash_command = "home/Data_eng/Course_08_ETL_DataPipelines/apache_kafka/Final_assignement/extract_transform_load.sh",
    dag = dag,
)

## pipeline 
extract_transform_load