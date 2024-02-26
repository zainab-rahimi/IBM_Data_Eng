# Hands-on lab: Final assignment using PostgreSQL

### Scenario 

You are a data engineer hired by a solid waste management company. The company collects and recycles solid waste across major cities in the country of Brazil. The company operates hundreds of trucks of different types to collect and transport solid waste. The company would like to create a data warehouse so that it can create reports like

    total waste collected per year per city
    total waste collected per month per city
    total waste collected per quarter per city
    total waste collected per year per trucktype
    total waste collected per trucktype per city
    total waste collected per trucktype per station per city

You will use your data warehousing skills to design and implement a data warehouse for the company.

### Objectives

    Design a Data Warehouse
    Load data into Data Warehouse
    Write aggregation queries
    Create MQTs
    Create a Dashboard

#### Exercise 1: Design a data warehouse 

The solid waste management company has provied you the sample data they wish to collect.
![sample_data](/final_assignment/solid-waste-trips-new.png)

You will start your project by designing a Star Schema warehouse by identifying the columns for the various dimension and fact tables in the schema.

##### Task 1 - Design the dimension table MyDimDate

Write down the fields in the MyDimDate table in any text editor one field per line. The company is looking at a granularity of day. Which means they would like to have the ability to generate the report on yearly, monthly, daily, and weekday basis.


1-MyDimDate

    dateid
    date
    month
    monthname
    weekday
    quarter
    quartername
    year

```
CREATE TABLE public."DimDate"
(
    dateid integer NOT NULL,
    date date,
    "Year" integer,
    "Quarter" integer,
    "QuarterName" character varying,
    "Month" integer,
    "Monthname" character varying,
    "Day" integer,
    "Weekday" integer,
    "WeekdayName" character varying,
    PRIMARY KEY (dateid)
);
```

ALTER TABLE IF EXISTS public."DimDate"
    OWNER to postgres;

##### Task 2 - Design the dimension table MyDimWaste

Write down the fields in the MyDimWaste table in any text editor one field per line.

2-MyDimWaste

    wasteid
    wastetype
    waste_tone

##### Task 3 - Design the dimension table MyDimZone

Write down the fields in the MyDimZone table in any text editor one field per line.

3-MyDimZone

    zoneid
    zonename
    city

##### Task 4 - Design the fact table MyFactTrips

Write down the fields in the MyFactTrips table in any text editor one field per line.

4-MyFactTrips

    tripnumber
    dateid
    wasteid
    zoneid


```
    CREATE TABLE public."DimTruck"
    (
        "Truckid" integer,
        "TruckType" character varying,
        PRIMARY KEY ("Truckid")
    );

    ALTER TABLE IF EXISTS public."DimTruck"
        OWNER to postgres;
```


#### Queries

```
    select "FactTrips"."Stationid", "DimTruck"."TruckType",
    sum ("FactTrips"."Wastecollected") as totalwaste
    from "FactTrips"
    left join "DimTruck"
    on "FactTrips"."Truckid" = "DimTruck"."Truckid"
    left join "DimStation"
    on "FactTrips"."Stationid" = "DimStation"."Stationid"
    group by 
    grouping sets ("FactTrips"."Stationid", "DimTruck"."TruckType")
    order by "DimTruck"."TruckType";
```

##### Rollup
```
    select  "DimDate"."Year","DimStation"."City","FactTrips"."Stationid",
    sum ("FactTrips"."Wastecollected") as totalwaste
    from "FactTrips"
    left join "DimStation"
    on "FactTrips"."Stationid" = "DimStation"."Stationid"
    left join "DimDate"
    on "FactTrips"."Dateid" = "DimDate"."dateid"
    group by rollup ("FactTrips"."Stationid", "DimDate"."Year","DimStation"."City")
    order by "DimDate"."Year" ASC;
```
##### Cube

```
select  "DimDate"."Year","DimStation"."City","FactTrips"."Stationid",
avg("FactTrips"."Wastecollected") as average_waste
from "FactTrips"
left join "DimStation"
on "FactTrips"."Stationid" = "DimStation"."Stationid"
left join "DimDate"
on "FactTrips"."Dateid" = "DimDate"."dateid"
group by cube ("FactTrips"."Stationid", "DimDate"."Year","DimStation"."City")
order by "DimDate"."Year" ASC;
```
##### Create materialized view

```
create materialized view max_waste_stats (city, stationid, Trucktype, max_waste) AS
(
	select "DimStation"."City","FactTrips"."Stationid", "DimTruck"."TruckType",
    max("FactTrips"."Wastecollected") as max_waste
    from "FactTrips"
    left join "DimTruck"
    on "FactTrips"."Truckid" = "DimTruck"."Truckid"
    left join "DimStation"
    on "FactTrips"."Stationid" = "DimStation"."Stationid"
    group by ("DimStation"."City","FactTrips"."Stationid","DimTruck"."TruckType")
    order by "DimTruck"."TruckType"
);
``` 