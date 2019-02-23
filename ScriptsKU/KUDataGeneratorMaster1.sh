#!/bin/bash
password=${1:-0}
#. ~/clearwater-docker/ScriptsCW/CWCreate1.sh
. ~/clearwater-docker/ScriptsKU/KuStart1.sh $password
. ~/clearwater-docker/ScriptsKU/KUMonitor1.sh 200 1
. ~/clearwater-docker/ScriptsKU/KUMonitor1.sh 500 1
. ~/clearwater-docker/ScriptsKU/KUMonitor1.sh 1000 1
. ~/clearwater-docker/ScriptsKU/KUMonitor1.sh 2000 1
. ~/clearwater-docker/ScriptsKU/KUMonitor1.sh 5000 1
