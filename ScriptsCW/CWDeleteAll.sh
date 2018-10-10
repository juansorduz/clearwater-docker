#!/bin/bash
#docker network ls -q | xargs --no-run-if-empty docker network rm
#docker network rm $(docker network ls | grep "foo" | awk '/ / { print $1 }')
docker network rm $(docker network ls)
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
