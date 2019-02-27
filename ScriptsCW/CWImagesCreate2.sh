#!/bin/bash
cd ~/clearwater-docker
#for i in base homer live-test ; do docker build -t clearwater/$i $i ; done
#docker stop $(docker ps -aq)
#docker rm $(docker ps -aq)
#docker rmi $(docker images -aq)
#docker network rm $(docker network ls)
#for i in base astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest sprout-full; do docker build -t clearwater/$i $i ; done
for i in base2 astaire2 urcassandra msccassandra chronos2 bono2 ellis2 homer2 urhomestead mschomestead homestead-prov2 ralf2 ursprout mscsprout sipptest; do docker build -t clearwater/$i $i ; done
