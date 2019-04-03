#!/bin/bash

option=${1:-0}

nameRepository1=gabrielorozco20
for i in bono2 homer2 ellis2 urcassandra mschomestead ursprout sipptest2
do

    docker pull $nameRepository1/clearwater-$i:latest
done




nameRepository2=juansorduz
for i in astaire2 ralf2 chronos2 homestead-prov2 msccassandra urhomestead mscsprout
do

    docker pull $nameRepository2/clearwater-$i:latest
done
