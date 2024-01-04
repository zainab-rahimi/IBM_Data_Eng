''' In the following code:
Create a database using Python
Load the data from a CSV file as a table to the database
Run basic "queries" on the database to access the information'''

### Download the csv file in terminal from the below url
#wget "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-PY0221EN-Coursera/labs/v2/INSTRUCTOR.csv"

import sqlite3
import pandas as pd 

#create and connect to a new database STAFF
conn = sqlite3.connect('staff.db')

## create and load table 
'''To create a table in the database, you first need to have the attributes of the required table.
 Attributes are columns of the table.
Along with their names, the knowledge of their data types are also required. '''

table_name = 'INSTRUCTOR'
attribute_list = ['ID', 'FNAME', 'LNAME', 'CITY', 'CCODE']

## Read the csv file 
df = pd.read_csv("./INSTRUCTOR.csv", names= attribute_list)

## Loading the data to a table
df.to_sql(table_name, conn, if_exists='replace', index = False)
print("table is loaded with the data")

query_statment = f"SELECT * from {table_name}"
query_output = pd.read_sql(query_statment, conn)
print(query_output)

# query_statment = f"SELECT FNAME from {table_name}"
# query_output = pd.read_sql(query_statment, conn)
# print(query_output)

# query_statment = f"SELECT COUNT(*) from {table_name}"
# query_output = pd.read_sql(query_statment, conn)
# print(query_output)

'''Appending data to the table in the database'''
data_dict = {'ID' : [100],
            'FNAME' : ['John'],
            'LNAME' : ['Doe'],
            'CITY' : ['Paris'],
            'CCODE' : ['FR']}
#convert the dict to dataframe
new_data = pd.DataFrame(data_dict)

new_data.to_sql(table_name, conn, if_exists='append', index= False)
print("new data has been appended!")

## Now when we repeat count query we will see that count has been increased by 1
print(pd.read_sql(f"SELECT COUNT(*) from {table_name}",
            conn))


############ Practice lab
practice_table = 'DEPARTMENTS' 
practice_table_attributes = ['DEPT_ID', 'DEP_NAME', 'MANAGER_ID', 'LOC_ID']
'''url to get the data for the table
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-PY0221EN-Coursera/labs/v2/Departments.csv
'''

### read the csv file 
practice_df = pd.read_csv("./Departments.csv", names= practice_table_attributes)

### Load the data to the sql table
practice_df.to_sql(practice_table, conn, if_exists='replace', index = False)
print("practice table in database is loaded with the csv data")

practice_dict = {'DEPT_ID' : [9],
                     'DEP_NAME': ['Quality assurance'],
                     'MANAGER_ID': [2300],
                     'LOC_ID': ['L0010']}
practice_new_data = pd.DataFrame(practice_dict)
practice_new_data.to_sql(practice_table, conn, if_exists='append', index= False)

print(pd.read_sql(f"SELECT COUNT(*) FROM {practice_table}", conn))