#!/bin/bash
#CONTADOR=0

ip=${1:-127.0.0.1}
NumberTest=${2:-2}

. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 10 150 $ip $NumberTest
