#!/bin/bash
#CONTADOR=0

ip=${1:-127.0.0.1}
NumberTest=${2:-2}

. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 10 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 20 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 30 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 40 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 50 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 60 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 70 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 80 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 90 150 $ip $NumberTest
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 90 150 $ip $NumberTest
