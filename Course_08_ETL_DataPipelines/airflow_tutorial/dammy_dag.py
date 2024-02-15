## importing libraries
from datetime import timedelta
from airflow import DAG 
from airflow.operators.bash_operator import days_ago
from airflow.utils import days_ago

## Defining DAG arguments
default_args = {
    'owner': 'Zainab jan',
    'start_date' : days_ago(0),
    'email': ['zainab@email.com'],
    'email_on_failure' : False,
    'email_on_retry' : False, 
    'retries' : 1,
    'retry_delay': timedelta(minutes=1),
}