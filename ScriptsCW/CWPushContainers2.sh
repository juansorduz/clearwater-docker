#!/bin/bash

nameRepository=${1:-juansorduz}

echo $nameRepository
nameRepository1=gabrielorozco20
for i in bono2 homer2 ellis2 urcassandra mschomestead ursprout sipptest
do
    docker tag clearwater/$i:latest $nameRepository1/clearwater-$i:latest
    docker push $nameRepository1/clearwater-$i:latest
done

nameRepository2=juansorduz
for i in astaire2 ralf2 chronos2 homestead-prov2 msccassandra urhomestead mscsprout
do
    docker tag clearwater/$i:latest $nameRepository2/clearwater-$i:latest
    docker push $nameRepository2/clearwater-$i:latest
done
