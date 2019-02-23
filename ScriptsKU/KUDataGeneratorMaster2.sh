#!/bin/bash
password=${1:-0}
#. ~/clearwater-docker/ScriptsKU/KUCreate2.sh
. ~/clearwater-docker/ScriptsKU/KuStart2.sh $password 
. ~/clearwater-docker/ScriptsKU/KUMonitor2.sh 200 1
. ~/clearwater-docker/ScriptsKU/KUMonitor2.sh 500 1
. ~/clearwater-docker/ScriptsKU/KUMonitor2.sh 1000 1
. ~/clearwater-docker/ScriptsKU/KUMonitor2.sh 2000 1
. ~/clearwater-docker/ScriptsKU/KUMonitor2.sh 5000 1
