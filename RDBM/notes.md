
# RDBMS

## Deployment topologies

Databases are deployed in different topologies, depending on which best suits the processing and access requirements.

- A single-tier topology is one where the database is installed on a user’s local desktop. It is useful for small databases that only require single user access.
- In 2-tier database topologies the database resides on a remote server and users access it from client systems.
- In 3-tier database topologies the database resides on a remote server and users access it through an application server or a middle-tier.

- In Cloud deployments the database resides in the cloud, and users access it through an application server layer or another interface that also resides in the cloud.

## Distributed architecture and clustered databases

In shared disk distributed database architectures, multiple database servers process the workload in parallel, allowing the workload to be processed faster. There are three shared nothing distributed database architectures:

Replication. Changes taking place on a database server are replicated to one or more database replicas. In a single location, database replication provides high availability. When database replica is stored in a separate location, it provides a copy of the data for disaster recovery.

Partitioning. Very large tables are split across multiple logical partitions.

Sharding. Each partition has its own compute resources.

- In shared disk database architectures multiple database servers process the workload in parallel, allowing the workload to be processed faster.

- In database replication changes taking place on a database server are replicated to one or more database replicas. In a single location database replication provides high availability. When a database replica is stored in a separate location, it provides a copy of the data for disaster recovery.
- In partitioning, very large tables are split across multiple logical partitions.
- In sharding, each partition has its own compute resources.

## Database users and usage patterns

Three main classes of users are:

- Data Engineers
- Data Scientists and Business Analysts
- Application Developers
 Databases can be accessed through: **Graphical and Web Interfaces** which make it easy to interact with the database visually. **Command line** tools and scripts can be cumbersome to use but are powerful in the hands of an experienced Data Engineer and help with automating repetitive tasks. APIs and ORMs which help application developers create applications that access a database on behalf of a user or client application.

Major categories of database applications include: Database Management tools like phpMyAdmin or pgAdmin.
Data Science and BI tools like Microsoft Excel, IBM Congos, and MicroStrategy, which enable Data Scientists and Data Analysts to analyze data and produce targeted reports. Purpose built or off the shelf business applications for tasks such as e-commerce, supply chain, etc.

The method you choose to access the database depends on your needs.

## Types of sql statements (DDL vs. DML)

**DDL** or Data Definition Language statements are used for defining or changing objects in a database such as tables. And **DML** or Data Manipulation Language statements are used for manipulating or working with data in tables.

## Normalization types

1- First normal form (1NF): 

- each row must be unique
- each cell should contain single value

2- Second normal form (2NF):

- Separate tables for the values that apply to multiple records

3- Third normal form (3NF):

- Eliminate  columns that are not dependent on the primary key

## Normalization in OLTP and OLAT

- OLTP: Data is read and write frequently -> data is normalized in 3NF or BSNF (Boyce Codd Normal form or BCNF, which is an extension to the third normal form)

- OLAP: Data is mostly read only and database is optimized for read performance -> data is de-normalized in 2NF or 1NF 

##
The objects in a Relational Database Management System (RDBMS) object hierarchy include:

Instances. This is a logical boundary for a database or set of databases where you organize and isolate database objects and set configuration parameters. 

Relational databases. This is a set of objects used to store, manage, and access data.

Schemas. A user or system schema is a logical grouping of tables, views, nicknames, triggers, functions, packages, and other database objects. Schemas provide naming contexts so that you can distinguish between objects with the same name.

Database partitions. You can split very large tables across multiple partitions to improve performance. 

Database objects. Database objects are the items that exist within the database, such as tables, constraints, indexes, views, and aliases.

Primary key and Foreign Keys have several uses:

Primary keys enforce uniqueness of rows in a table, whereas Foreign keys are columns in a table that contain the same information as the primary key in another table.

You can use primary and foreign keys to create relationships between tables. Relationships between tables reduce redundant data and improve data integrity. 

Indexes provide ordered pointers to rows in tables and can improve the performance of SELECT queries, but can decrease the performance of INSERT, UPDATE, and DELETE queries.

Normalization reduces redundancy and increases consistency of data. There are two forms of normalization:

First normal form (1NF). In this form, the table contains only single values and has no repeating groups.

Second normal form (2NF). This form splits data into multiple tables to reduce redundancy.

You can define six relational model constraints:

Entity integrity constraint. Ensures that the primary key is a unique value that identifies each tuple (or row.)

Referential integrity constraint. Defines relationships between tables.

Semantic integrity constraint. Refers to the correctness of the meaning of the data.

Domain constraint. Specifies the permissible values for a given attribute.

Null constraint. Specifies that attribute values cannot be null.

Check constraint. Limits the values that are accepted by an attribute.

