
# ETL & Data Pipelines with Shell, Airflow and Kafka

## Week 1

### ETL basics

What is ETL: it is the process of extracting data from multipe sources and transforming it into the data format or structure that is suitable for its final destination and then load data to its new environment.

### ETL Vs ELT

Differences between ETL and ELT: For one thing, the transformations happen in a different order: Transformations for ETL pipelines take place within the data pipeline, before the data reaches its destination, whereas Transformations for ELT are decoupled from the data pipeline, and happen in the destination environment at will.

- where and when the transformation happen
  - in ETL within data pipeline
  - in ELT after the data arrived in its new destination

- flexibility:
  - ETL is rigid; pipelines are engineered to user specifications
  - ELT it flexible; users build their own transformations

- Support for big data
  - for relational data, on premise, scalability is difficult
  - ELT solves scalability, support for both structured and unstructured data in cloud

### The evolution of ETL to ELT 

increasing demand to access the raw data
ETL has its place for many applications
ELT enables ad-hoc, self-serve data analytics in real-time 

#### ELT Basics

In ELT data is acquired and loaded directly into its new destination. From the new enviroment that can be a data lake a sophisticated analytical platform, data is transformed in the way that user wish. The Transformation process for ELT is much more dynamic than it is for conventional ETL. Modern analytics tools in the destination environment enable interactive, on-demand exploration and visualization of your data, including advanced analytics such as modelling and prediction. Use cases for ELT processes typically fall within the high-performance computing and Big Data realms. 

In terms of speed, **moving data** is usually more of a bottleneck than processing it, so the less you move it, the better. Therefore, ELT may be your best bet when you want flexibility in building a suite of data products from the same sources.

With ELT, you have a clean separation between moving data and processing data. Thus, ELT is a flexible option that enables a variety of applications from the same source of data. Because you are working with a replica of the source data, there is **no information loss**.

#### Extract

Edge computing reduces the data volumes of redundant data by extracting features of interest from the raw data. Edge computing devices, for example, false negatives appear in surveillance devices designed to only stream alarm signals, not the raw data.

#### Loading

##### Data loading techniques

- Full: Start transactions in a new warehouse; used for porting over transaction history.
- Incremental: Data is appended, not overwritten. Used for accumalating transaction history. Depended on the volume of the data can be batch or stream loaded.
- Scheduled: Periodic loading like daily transactions to database, can be done in windows by windows task scheduler and in Linux by cron job
- On-demand: Triggered by measures such as data size or event detection like sound, motion or temprature change and also by user request like video or music streaming  
- Batch and Stream: Batch is periodic updates using windows of data; stream loading continues updates as data arrives; micro batch loading:short time windows used to access older data
- Pull and Push: Based on client-server model. Pull: requests originates from the client like RSS feed and email in Push: server pushes data to cients based on client subscription like push notifications and instant messaging.
- parallel loading: Parallel loading can be employed on multiple data streams to boost loading efficiency, particularly when the data is big or has to travel long distances. Similarly, by splitting a single file into smaller chunks, the chunks can be loaded simultaneously.


