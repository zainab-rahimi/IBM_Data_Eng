# Getting started with data warehousing and BI analytics

## hands on lab - Setting up a staging area 

##### Objectives


    Setup a staging server for a data warehouse
    Create the schema to store the data
    Load the data into the tables
    Run a sample query

We will be using the PostgreSQL server as our staging server.

Start the PostgreSQL server. After installing the postgres run the below command 

`sudo -i -u postgres` 

Then run the command to create a database named billingDW:

`createdb -h localhost -U postgres -p 5432 billingDW`

For removing the database you can use `dropdb` and the rest will be the same as the previous command.

Download the schema files.

The commands to create the schema are available in the file below.

https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Setting%20up%20a%20staging%20area/billing-datawarehouse.tgz
Run the commands below to download and extract the schema files.

```
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Setting%20up%20a%20staging%20area/billing-datawarehouse.tgz`

tar -xvzf billing-datawarehouse.tgz
ls *.sql
```

Step 2: Create the schema

Run the command below to create the schema in the billingDW database.
`psql  -h localhost -U postgres -p 5432 billingDW < star-schema.sql`

#### Load data into dimension tables 

When we load data into the tables, it is a good practice to load the data into dimension tables first.

Run the command below to load the data into DimCustomer table in billingDW database.

`psql -h localhost -U postgres -p 5432 billingDW < DimCustomer.sql`

Load data into DimMonth table

Run the command below to load the data into DimMonth table in billingDW database.

`psql -h localhost -p 5432 -U postgres billingDW < DimMonth.sql`

Load data into FactBilling table

Run the command below to load the data into FactBilling table in billingDW database.

`psql  -h localhost -U postgres -p 5432 billingDW < FactBilling.sql`

#### Practice exercises

Create a database named practice 

`createdb -h localhost -p 5432 -U postgres practice`

In the practice database create a star schema using star_schema.sql file

`psql -h localhost -p 5432 -U postgres practice < star-schema.sql`

In the practice database, load the data into all tables using the DimMonth.sql, DimCustomer.sql and FactBilling.sql.

```
psql  -h localhost -U postgres -p 5432 practice < DimMonth.sql

psql  -h localhost -U postgres -p 5432 practice < DimCustomer.sql

psql  -h localhost -U postgres -p 5432 practice < FactBilling.sql
```

## Hands-on lab - Verifying data quality for a data warehouse

#### objectives

    Check Null values
    Check Duplicate values
    Check Min Max
    Check Invalid values
    Generate a report on data quality

Start postgresql server 

`sudo -i -u postgres`

Download the staging area setup script.

Run the command below to download the staging area setup script.

`wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/setup_staging_area.sh`

Run the setup script.

Run the command below to execute the staging area setup script.

`bash setup_staging_area.sh`

You will see the message 

    Successfully setup the staging area

#### Getting the testing framework ready

You can perform most of the data quality checks by manually running sql queries on the data warehouse.

It is a good idea to automate these checks using custom programs or tools. Automation helps you to easily

    create new tests,
    run tests,
    and schedule tests.

We will be using a python based framework to run the data quality tests. 

Download the framework.

Run the commands below to download the framework

```
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/dataqualitychecks.py

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/dbconnect.py

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/mytests.py

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/generate-data-quality-report.py

ls
```
Install the python driver for Postgresql.

Run the command below to install the python driver for Postgresql database

`python3 -m pip install psycopg2`

For me the above command didn't work, I installed the `psycopg-binary`

Test database connectivity.

Now we need to check

    if the Postgresql python driver is installed properly.
    if Postgresql server is up and running.
    if our micro framework can connect to the database.

The command below to check all the above cases.
`python3 dbconnect.py` notice that you have to edit the file and enter your password for connecting to postgres user. 

You will see the message

    Successfully connected to warehouse
    Connection closed


#### Create a sample data quality report

Run the command below to install pandas.

    python3 -m pip install pandas tabulate

Run the command below to generate a sample data quality report.

    python3 generate-data-quality-report.py

#### Explore the data quality tests

open the file mytests.py  

The file mytests.py contains all the data quality tests.

It provides a quick and easy way to author and run new data quality tests.

The testing framework provides the following tests:

    check_for_nulls - this test will check for nulls in a column
    check_for_min_max - this test will check if the values in a column are with a range of min and max values
    check_for_valid_values - this test will check for any invalid values in a column
    check_for_duplicates - this test will check for duplicates in a column

Each test can be authored by mentioning a minimum of 4 parameters.

    testname - The human readable name of the test for reporting purposes
    test - The actual test name that the testing micro framework provides
    table - The table name on which the test is to be performed
    column - The table name on which the test is to be performed

Let us now create a new check_for_nulls test and run it.

The test below checks if there are any null values in the column year in the table DimMonth.

The test fails if nulls exist.

Copy and paste the code below at the end of mytests.py file.
```
test5={
    "testname":"Check for nulls",
    "test":check_for_nulls,
    "column": "year",
    "table": "DimMonth"
}
```
Save the file and run the generate_data_quality_report.py again
`python3 generate-data-quality-report.py` 

#### Check for min max range

Let us now see what a check_for_min_max test looks like.

Here is a sample check_for_min_max test
```
test2={
    "testname":"Check for min and max",
    "test":check_for_min_max,
    "column": "monthid",
    "table": "DimMonth",
    "minimum":1,
    "maximum":12
}
```
In addition to the usual fields, you have two more fields here.

    minimum is the lowest valid value for this column. (Example 1 in case of month number)
    maximum is the highest valid value for this column. (Example 12 in case of month number)

Let us now create a new check_for_min_max test and run it.

The test below checks for minimum of 1 and maximum of 4 in the column quarter in the table DimMonth.

The test fails if there any values less than minimum or more than maximum.

Copy and paste the code below at the end of mytests.py file.

```
test6={
    "testname":"Check for min and max",
    "test":check_for_min_max,
    "column": "quarter",
    "table": "DimMonth",
    "minimum":1,
    "maximum":4
}
```
#### Check for any invalid entries

Let us now see what a check_for_valid_values test looks like.

Here is a sample check_for_valid_values test:
```
test3={
    "testname":"Check for valid values",
    "test":check_for_valid_values,
    "column": "category",
    "table": "DimCustomer",
    "valid_values":{'Individual','Company'}
}
```
In addition to the usual fields, you have an additional field here.

    use the field valid_values to mention what are the valid values for this column.

Let us now create a new check_for_valid_values test and run it.

The test below checks for valid values in the column quartername in the table DimMonth.

The valid values are Q1,Q2,Q3,Q4

The test fails if there any values less than minimum or more than maximum.

Copy and paste the code below at the end of mytests.py file.
```
test7={
    "testname":"Check for valid values",
    "test":check_for_valid_values,
    "column": "quartername",
    "table": "DimMonth",
    "valid_values":{'Q1','Q2','Q3','Q4'}
}
```
save the file and run the generate_data_quality_report.py again

### Practice exercises 

Create a check_for_nulls test on column billedamount in the table FactBilling

```
test9={
    "testname":"Check for nulls",
    "test" : check_for_nulls,
    "column" : "billedamount",
    "table" : "FactBilling"
}
```
Create a check_for_duplicates test on column billid in the table FactBilling

```
test10= {
    "testname": "check for duplicates",
    "test" : check_for_duplicates,
    "column" : "billid",
    "table" : "FactBilling"
}

Create a check_for_valid_values test on column quarter in the table DimMonth. The valid values are 1, 2, 3, 4
```

```
test11={
    "testname":"Check for valid values",
    "test":check_for_valid_values,
    "column": "quarter",
    "table": "DimMonth",
    "valid_values":{1,2,3,4}
}
```
## Hands-on lab - populating a Data Warehouse using PostgreSQL

The lab is designed to provide hands-on experience in creating and managing a production database using PostgreSQL within the IBM Skills Network Labs (SN Labs) Cloud IDE. You will learn how to launch a PostgreSQL server instance, utilize the pgAdmin graphical user interface (GUI) for database operations, and execute essential tasks like creating a database, designing tables, and loading data. The lab focuses on building a foundation in database management by guiding learners through the process of setting up a ‘Production’ database and populating it with data following a star schema design.

objectives 

    Create production related database and tables in a PostgreSQL instance.
    Populate the production data warehouse byloading the tables from Scripts.

