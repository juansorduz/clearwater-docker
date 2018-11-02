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

mkdir -p ~/ClearwaterTestResults/Kubernetes/$users$duration/describe
testfolder=~/ClearwaterTestResults/Kubernetes/$users$duration/describe

if [ "$users" = "0" ]
then
    echo "Using default values"
fi

echo "Collecting description"

kubectl describe pods $astairepod > $testfolder/astaire.sh
kubectl describe pods $bonopod > $testfolder/bono.sh
kubectl describe pods $cassandrapod > $testfolder/cassandra.sh
kubectl describe pods $chronospod > $testfolder/chronos.sh
kubectl describe pods $ellispod > $testfolder/ellis.sh
kubectl describe pods $homerpod > $testfolder/homer.sh
kubectl describe pods $homestead > $testfolder/homestead.sh
kubectl describe pods $homesteadprovpod > $testfolder/homesteadprov.sh
kubectl describe pods $ralfpod > $testfolder/ralf.sh
kubectl describe pods $sipptestpod > $testfolder/sipptest.sh
kubectl describe pods $sproutpod > $testfolder/sprout.sh

echo "Finish collection descripption"
