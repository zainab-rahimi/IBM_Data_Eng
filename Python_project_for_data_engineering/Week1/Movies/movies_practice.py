import requests
import sqlite3
from bs4 import BeautifulSoup
import pandas as pd 

'''This file is the practice lab for the movies webscraping lab
to extract different headers from the one in the lab explained
1. Modify the code to extract Film, Year, and Rotten Tomatoes' Top 100 headers.

2. Restrict the results to only the top 25 entries.

3. Filter the output to print only the films released in the 2000s (year 2000 include)'''


url = "https://web.archive.org/web/20230902185655/https://en.everybodywiki.com/100_Most_Highly-Ranked_Films"
db_name = 'movies_practice.db'
table_name = 'rotten_tomatos'
csv_path = './top_rotten_tomatos_films.csv'
df = pd.DataFrame(columns = [ 'Film', 'Year', "Rotten Tomatoes' Top 100"])
count = 0 

html_page = requests.get(url).text
data_soup = BeautifulSoup(html_page, 'html.parser')

rows = data_soup.find_all('table')[0].find_all('tr')

for row in rows:
    if count < 25:
        col = row.find_all('td')
        if len(col) != 0:
            data_dict = {
                'Film' : col[1].contents[0],
                'Year' : col[2].contents[0],
                "Rotten Tomatoes' Top 100" : col[3].contents[0]
            }
            df1 = pd.DataFrame(data_dict, index = [0])
            df = pd.concat([df1,df], ignore_index = True)
            count+=1
    else:
        break

#print(df)

'''# Assuming you have a DataFrame named 'movies_df' with a column 'year'
filtered_movies = movies_df[movies_df['year'] > 1999]
# Display or perform operations on the filtered_movies DataFrame
print(filtered_movies)'''

### Filtering the movies and saving it into csv file

df['Year'] = pd.to_numeric(df["Year"], errors= 'coerce')
print(df['Year'].dtype)
filtered_movies = df[df['Year'] > 1999]
filtered_movies.to_csv(csv_path)

## Store the filtered movies to the database
conn = sqlite3.connect(db_name)
filtered_movies.to_sql(table_name, conn, if_exists='replace', index = False)
conn.close