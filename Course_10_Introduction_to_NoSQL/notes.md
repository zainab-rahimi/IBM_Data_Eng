### Week 3 - Architecture of Cassandra

The Apache Cassandra architecture is designed to provide scalability, availability, and reliability to store massive amounts of data. Cassandra is a based on distributed system and but can be run on only one container or machine and a single Cassandra istance is a node. 

It works as peer to peer architecture and all nodes can commiunicate together with a process called 'Gossip'. The gossip protocol informs a node about the state of all other nodes. A node performs gossip communications with up to three other nodes every second. The gossip messages follow a specific format and use version numbers to make efficient communication, thus shortly each node can build the entire metadata of the cluster (which nodes are up/down, what are the tokens allocated to each node, etc..). 

Each Cassandra node can perform all database operations and can serve client requests without the need for a primary node.  


#### Hands-on lab - using the cqlshell

To access the cassandra server using cqlsh I run the cassandra using a docker container, here is the steps I followed:

```
##pull the official images of cassandra 
`docker pull cassandra:latest`

##run the image 
`run --name cassandra -p 9042:9042 -p 9160:9160   -d cassandra `

connect to cqlsh
`docker exec -it cassandra /bin/bash

#cqlsh`
``` 

