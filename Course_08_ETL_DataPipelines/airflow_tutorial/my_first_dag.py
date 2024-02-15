## Import required libraries
from datetime import timedelta
from airflow import DAG
from airflow.operators.bash.operator import BashOperator
from airflow.utils.dates import days_ago

## Define DAG arguments 

default_args = {
    'owner': 'Zainab Rahimi',
    'start_date' : 'days_ago(0)',
    'email': ['zainab@gmail.com'],
    'email_on_failure': False ,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

## Defining the dag 
dag = DAG('MY-DAG',
    default_args= default_args,
    description= 'my first dag',
    schedule_interval=timedelta(days=1),
)

### Defining tasks

extract_transform_load = BashOperator(
    task_id = 'extract_transform_load',
    bash_command = '/home/zainab/Data_eng/Course_08_ETL_DataPipelines/airflow_tutorial/my_first_dag.sh',
    dag = dag,
)

## task pipeline

extract_transform_load