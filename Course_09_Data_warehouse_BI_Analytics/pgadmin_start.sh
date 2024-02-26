

#!/bin/bash


#there was some packaging problem, I couldn't install pgadmin directly on my system
## So I run it in a container below is the command to run pgadmin in a container,

docker container run --name pgadmin_container --network='host' \
-e PGADMIN_DEFAULT_EMAIL='zrahimi1992@gmail.com' -e PGADMIN_DEFAULT_PASSWORD='123' dpage/pgadmin4

## The shortcut to stop all containers

## docker stop $(docker ps -a -q)
## To remove all the container
## docker rm $(docker ps -a -q)