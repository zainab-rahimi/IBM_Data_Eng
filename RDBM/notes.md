
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
