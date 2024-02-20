

#!/bin/bash

## To run pgadmin in a container, there was some packaging problem, I couldn't install it directly on my system

docker container run --name pgadmin_container --network='host' \
-e PGADMIN_DEFAULT_EMAIL='zrahimi1992@gmail.com' -e PGADMIN_DEFAULT_PASSWORD='123' dpage/pgadmin4
