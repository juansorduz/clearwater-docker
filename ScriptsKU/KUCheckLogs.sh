#!/bin/bash
users=${1:-0}
duration=${2:-0}

pods=$(kubectl get pods)
astairepod=$(kubectl get pods | grep astaire | cut -d ' ' -f1)
bonopod=$(kubectl get pods | grep bono | cut -d ' ' -f1)
cassandrapod=$(kubectl get pods | grep cassandra | cut -d ' ' -f1)
chronospod=$(kubectl get pods | grep chronos | cut -d ' ' -f1)
ellispod=$(kubectl get pods | grep ellis | cut -d ' ' -f1)
homerpod=$(kubectl get pods | grep homer | cut -d ' ' -f1)
homesteadpod3=$(kubectl get pods | grep homestead- | cut -d ' ' -f1)
homesteadpod2=($homesteadpod3)
homestead=${homesteadpod2[0]}
homesteadprovpod=$(kubectl get pods | grep homestead-prov | cut -d ' ' -f1)
ralfpod=$(kubectl get pods | grep ralf | cut -d ' ' -f1)
sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
sproutpod=$(kubectl get pods | grep sprout | cut -d ' ' -f1)

mkdir -p ~/ClearwaterTestResults/Kubernetes/$users$duration/logs
testfolder=~/ClearwaterTestResults/Kubernetes/$users$duration/logs

if [ "$users" = "0" ]
then
    echo "Using default values"
fi

echo "Collecting logs"

kubectl logs  $astairepod -c astaire> $testfolder/astaire.sh
kubectl logs  $bonopod -c bono > $testfolder/bono.sh
kubectl logs  $cassandrapod -c cassandra > $testfolder/cassandra.sh
kubectl logs  $chronospod -c chronos > $testfolder/chronos.sh
kubectl logs  $ellispod -c ellis > $testfolder/ellis.sh
kubectl logs  $homerpod -c homer > $testfolder/homer.sh
kubectl logs  $homestead -c homestead > $testfolder/homestead.sh
kubectl logs  $homesteadprovpod -c homestead-prov > $testfolder/homesteadprov.sh
kubectl logs  $ralfpod -c ralf > $testfolder/ralf.sh
kubectl logs  $sipptestpod -c sipptest > $testfolder/sipptest.sh
kubectl logs  $sproutpod -c sprout > $testfolder/sprout.sh

echo "Finish Collection logs"
