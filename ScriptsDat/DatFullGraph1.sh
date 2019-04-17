#!/bin/bash
#CONTADOR=0
NumberTest=${1:-2}

#rm -r ~/ClearwaterTestResults
. ~/clearwater-docker/ScriptsDat/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat/Graphs/DatGraphMainDockerCPSvsRAM1.sh
. ~/clearwater-docker/ScriptsDat/Graphs/DatGraphMainCPSvsSCR3.sh
. ~/clearwater-docker/ScriptsDat/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat/Graphs/DatGraphMainDockerCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat/Graphs/DatGraphMainVMCPSvsRAM1.sh
