import requests
import pandas as pd 
from datetime import datetime
import sqlite3
from bs4 import BeautifulSoup
import numpy as np 

url = "https://web.archive.org/web/20230908091635 /https://en.wikipedia.org/wiki/List_of_largest_banks"
db_name = "largest_banks.db"
csv_path ="./largest_banks.csv"
log_file = "./log.txt"
table_name = "largest_banks"
table_attributes = ["Name", "MC_USD_Billion"]
csv_rate = "./exchange_rate.csv"


def extract (url, table_attributes):
    html_file = requests.get(url).text
    soup = BeautifulSoup(html_file, "html.parser")
    tables = soup.find_all("tbody")
    my_rows = tables[0].find_all("tr")
    df = pd.DataFrame(columns= table_attributes)
    for row in my_rows:
        col = row.find_all('td')
        if len(col)>= 3:
            bank_name = col[1].find_all('a')[1].get_text()
            ## or I get the same result with the below commented line
            # bank_name = col[1].find_all('a')[1]['title']
            market_cap = col[2].get_text(strip = True)
            #or 
            # market_cap = col[2].contents[0][:-1]
            data_dict ={"Name": bank_name,
                        "MC_USD_Billion": market_cap}
            df1 = pd.DataFrame(data_dict, index = [1])
            df = pd.concat([df, df1], ignore_index=True)
    return df

def transform(df, csv_rate):
    exchange_df = pd.read_csv(csv_rate)
    # Ensure that the 'Currency' column is of string type
    exchange_df['Currency'] = exchange_df['Currency'].astype(str)
    cap_list = df["MC_USD_Billion"].tolist()
    cap_list = [float("".join(x.split(','))) for x in cap_list] 
    df["MC_USD_Billion"] = cap_list
    #Create a dictionary that currency is the key and rate is value from the exchange_rate csv
    currency_dict = dict(zip(exchange_df['Currency'], exchange_df['Rate']))
    df['MC_GBP_Billion'] = [np.round(x*currency_dict['GBP'],2) for x in df['MC_USD_Billion']]
    df['MC_EUR_Billion'] = [np.round(x*currency_dict['EUR'],2) for x in df['MC_USD_Billion']]
    df['MC_INR_Billion'] = [np.round(x*currency_dict['INR'],2) for x in df['MC_USD_Billion']]
    #print(f"the value for the fifth largest bank is :  {df['MC_EUR_Billion'][4]}")
    return df

def load_to_csv(df, csv_path):
    df.to_csv(csv_path)

def load_to_db(df, sql_connection, table_name):    
    df.to_sql( table_name ,sql_connection, if_exists='replace', index =False)

def run_query(query_statement, sql_connection):
    print (query_statement)
    query_output = pd.read_sql(query_statement, sql_connection)
    print(query_output)
    
def log_progress(message):
    current_time = datetime.now()
    date_format = current_time.strftime("%Y-%B-%d-%H:%M:%S")
    with open("./log_file.txt", 'a') as file:
        file.write(date_format + " : " + message + '\n')

'''Here define the entities and call required functions to get the result'''
log_progress("Preliminaries complete. Initiating ETL process")

df = extract(url, table_attributes)
log_progress("Data extraction complete. Initiating Transformation process")
df = transform(df, csv_rate)
log_progress("Data transformation complete. Initiating Loading process")
load_to_csv(df, csv_path)
log_progress("Data saved to CSV file")
sql_connection = sqlite3.connect("largest_banks.db")
log_progress("SQL Connection initiated")
load_to_db(df , sql_connection = sql_connection,table_name= table_name)
log_progress("Data loaded to Database as a table, Executing queries")

query_statement1 = f"SELECT * FROM {table_name}"
query_statement2 = f"SELECT AVG (MC_GBP_Billion) FROM {table_name}"
query_statement3 = f"SELECT Name from {table_name} LIMIT 5"
run_query(query_statement=query_statement1, sql_connection= sql_connection)
run_query(query_statement=query_statement2, sql_connection= sql_connection)
run_query(query_statement=query_statement3, sql_connection= sql_connection)
log_progress("Process Complete")
sql_connection.close
log_progress("Server Connection closed")



