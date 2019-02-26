#!/bin/bash
filename=${1:-Default}
cassandra=${2:-cassandra}
basicTable=${3:-1}
systemTable=${4:-0}
mkdir -p ~/CassandraQuery/
file=~/CassandraQuery/$filename.sql
echo CassandraQuery > $file
if [ $basicTable = '1' ];
then
  docker cp ~/clearwater-docker/Scripts/CassandraDBQuery.sh $cassandra:/
  docker exec $cassandra chmod +x /CassandraDBQuery.sh
  docker exec $cassandra /CassandraDBQuery.sh >> $file
fi

if [ $systemTable = '1' ];
then
  docker cp ~/clearwater-docker/Scripts/CassandraDBSystemQuery.sh $cassandra:/
  docker exec $cassandra chmod +x /CassandraDBSystemQuery.sh
  docker exec $cassandra /CassandraDBSystemQuery.sh >> $file
fi
