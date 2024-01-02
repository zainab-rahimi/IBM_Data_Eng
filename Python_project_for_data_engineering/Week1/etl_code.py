import pandas as pd
import glob
import xml.etree.ElementTree as ET
from datetime import datetime
import json
## define two file path that is available to all the functions globally
# 1 to save the transformed data
# 2 to save the logs 
log_file = "log_file.txt"
target_file = "transformed_data.csv"

### TASK 1 Extraction

def extract_json(input_file):
    dataframe = pd.read_json(input_file)
    return input_file

def extract_csv(input_file):
    dataframe = pd.read_csv(input_file)
    return dataframe

## Now write an extract function that calls two above functions in order to open all files and
# save then in one dataframe

def extract():
    # first create an empty dataframe that holds the extracted data
    extracted_data = pd.DataFrame(columns=['name','Height', 'weight'])

    for json_file in glob.glob("*.json"):
        ## Concat the parsed json files to the extracted data frame
        extracted_data = pd.concat([extracted_data, pd.DataFrame(extract_json(json_file))], ignore_index= True)
    for csv_file in glob.glob("*.csv"):
        extracted_data = pd.concat([extracted_data, extract_csv(csv_file)], ignore_index= True)
    
    return extracted_data


def load_data(target_file, extracted_data):
    extracted_data.to_csv(target_file)


final_data =extract()
