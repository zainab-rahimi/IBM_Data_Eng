import requests
import pandas as pd 
from bs4 import BeautifulSoup
import sqlite3

### Initialization

url = "https://web.archive.org/web/20230902185655/https://en.everybodywiki.com/100_Most_Highly-Ranked_Films"
db_name = 'movies.db'
table_name = 'top_50'
csv_path = './top_50_films.csv'
df = pd.DataFrame(columns = ['Average Rank', 'Film', 'Year'])
count = 0 

#### Loading webpage for webscraping

html_page = requests.get(url).text
data_soup = BeautifulSoup(html_page, 'html.parser')

### Extracting the rows data

tables = data_soup.find_all('table')
table_rows = tables[0].find_all('tr')
'''The following code does:
- Iterate over the contents of the variable rows.
- Check for the loop counter to restrict to 50 entries.
- Extract all the td data objects in the row and save them to col.
- Check if the length of col is 0, that is, if there is no data in a current row. This is important since, many timesm there are merged rows that are not apparent in the web page appearance.
- Create a dictionary data_dict with the keys same as the columns of the dataframe created for recording the output earlier and corresponding values from the first three headers of data.
- Convert the dictionary to a dataframe and concatenate it with the existing one. This way, the data keeps getting appended to the dataframe with every iteration of the loop.
- Increment the loop counter.
- Once the counter hits 50, stop iterating over rows and break the loop.'''

for row in table_rows:
    if count < 50:
        col = row.find_all('td')
        if len(col) != 0:
                data_dict ={
                    'Average Rank': col[0].contents[0],
                    'Film': col[1].contents[0],
                    'Year': col[2].contents[0]
                }
                df1 = pd.DataFrame(data_dict, index = [0])
                df = pd.concat([df, df1], ignore_index= True)
                count+= 1
    else:
         break
print(df)
### Save the data into a csv file
df.to_csv(csv_path)

'''To store the data into a database
- create connection to the database
- save the dataframe as a table
- close the connection'''
conn = sqlite3.connect(db_name)
df.to_sql(table_name, conn, if_exists='replace',index= False) ## saving the dataframe as table
conn.close