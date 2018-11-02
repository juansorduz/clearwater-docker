#!/bin/bash

nameRepository=${1:-juansorduz}

echo $nameRepository
for i in base astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest
do
    docker tag clearwater/$i:latest $nameRepository/clearwater-$i:latest
    docker push $nameRepository/clearwater-$i:latest
done
