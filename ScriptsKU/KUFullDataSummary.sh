#!/bin/bash
#CONTADOR=0
#ip=${1:-127.0.0.1}
NumberTest=${1:-2}

#rm -r ~/ClearwaterTestResults/Kubernetes3

. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 10 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 20 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 30 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 40 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 50 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 60 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 70 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 80 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 90 30 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 100 30 $NumberTest
