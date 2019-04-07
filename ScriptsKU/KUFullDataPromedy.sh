#!/bin/bash
#CONTADOR=0
#ip=${1:-127.0.0.1}
NumberTest=${1:-2}

#rm -r ~/ClearwaterTestResults/Kubernetes3

. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 10 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 20 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 30 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 40 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 50 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 60 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 70 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 80 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 90 150 $NumberTest
. ~/clearwater-docker/ScriptsKU/KUDataFullSummary.sh 100 150 $NumberTest
