#!/bin/bash

for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf scscf.sprout icscf.sprout; do

  docker cp ~/clearwater-docker/Scripts/clearwater-auto-config-docker $i:/etc/init.d/clearwater-auto-config-docker
  docker exec $i chmod +x /etc/init.d/clearwater-auto-config-docker
#
done
docker stop $(docker ps -aq)
docker restart etcd
docker restart astaire
docker restart cassandra
docker restart chronos
docker restart homestead
docker restart homestead-prov
docker restart homer
docker restart ralf
docker restart scscf.sprout
docker restart icscf.sprout
docker restart bono
docker restart ellis
docker restart sipptest
