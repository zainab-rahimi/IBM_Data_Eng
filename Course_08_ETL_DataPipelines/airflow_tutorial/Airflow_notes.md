# Apache Airflow 

To start with apache airflow, first let's start with creating an virtual environement.
`python3 -m venv env_name` 
after creating the environement then you should activate it by `source env_name/bin/activate`
Then you need to install Apache airflow, we look for the official github repository of ApacheAirflow and look for the installation guide with pip for python, copy and paste the installation command into terminal and change to requirement based on the version of your python.
a command like this `pip install 'apache-airflow==2.8.1' \
 --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.8.1/constraints-3.8.txt"`
 
##### Quick note on linux paths: 
Absolute path: provide the exacat location of a file or dirctory from the root directory and starts with `/` that denotes the root directory.An absolute path don't make assumption of your current directory in relation to the file or dirctory describing. Whereever you are you can navigate to root directory by the the the shortcut command of `cd /`. 
Absolute path are more compatible when working with scripts.

Relative path: A relative path starts with the current directory, relative paths are more compatible with long and complex files.

shortcut `cd ~` navigates to home directory

#### Starting with Apache airflow

By default Airflow is opening a folder in home directory and if you want to have a your files in your project directory you change it to your project directory by  exporting the airflow_home to your current directory by the following command: 

`export AIRFLOW_HOME=.`

Next initialise database with the command `airflow db_name init`, This will create a sqlite db and some configuration files.

