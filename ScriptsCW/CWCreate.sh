#!/bin/bash
#docker network ls -q | xargs --no-run-if-empty docker network rm
#docker network rm $(docker network ls | grep "foo" | awk '/ / { print $1 }')
#docker network rm clearwater_nw
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker network rm $(docker network ls)
docker network create --driver bridge clearwater_nw
docker run -d --net=clearwater_nw --name etcd quay.io/coreos/etcd:v2.2.5 -name etcd0 -advertise-client-urls http://etcd:2379,http://etcd:4001 -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 -initial-advertise-peer-urls http://etcd:2380 -listen-peer-urls http://0.0.0.0:2380  -initial-cluster etcd0=http://etcd:2380 -initial-cluster-state new
docker run -d --net=clearwater_nw --name astaire -p 22 clearwater/astaire
docker run -d --net=clearwater_nw --name cassandra -p 22 --sysctl net.ipv6.conf.lo.disable_ipv6=0 clearwater/cassandra
docker run -d --net=clearwater_nw --name chronos -p 22 clearwater/chronos
docker run -d --net=clearwater_nw --name homestead -p 22 clearwater/homestead
docker run -d --net=clearwater_nw --name homestead-prov -p 22 clearwater/homestead-prov
docker run -d --net=clearwater_nw --name homer -p 22 clearwater/homer
docker run -d --net=clearwater_nw --name ralf -p 22 clearwater/ralf
docker run -d --net=clearwater_nw --network-alias=scscf.sprout --name scscf.sprout -p 22 clearwater/sprout-full
docker run -d --net=clearwater_nw --network-alias=sprout --network-alias=icscf.sprout --name icscf.sprout -p 22 clearwater/sprout-full
#docker run -d --net=clearwater_nw  --network-alias=icscf.sprout --network-alias=scscf.sprout --name sprout -p 22 clearwater/sprout
docker run -d --net=clearwater_nw --name bono --env-file .env -p 22 -p 3478:3478 -p 3478:3478/udp -p 5060:5060 -p 5060:5060/udp -p 5062:5062 clearwater/bono
docker run -d --net=clearwater_nw --name ellis -p 22 -p 80:80 clearwater/ellis
docker run -d --net=clearwater_nw --name sipptest -p 22 -p 5082:5082 clearwater/sipptest
#docker run -d --net=clearwater_nw --name live-test -p 22 -p 808:808 clearwater/live-test
sleep 60
docker exec cassandra /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh 100
