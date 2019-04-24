#!/bin/bash
#CONTADOR=0
duration=${1:-120}
NumberTest=${2:-2}

#rm -r ~/ClearwaterTestResults
echo duration $duration NumberTest $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  10 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  10 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  10 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  20 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  20 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  20 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  30 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  30 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  30 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  40 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  40 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  40 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  50 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  50 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  50 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  60 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  60 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  60 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  70 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  70 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  70 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  80 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  80 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  80 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  90 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  90 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  90 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  100 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  100 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  100 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  120 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  120 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  120 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  150 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  150 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  150 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  200 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  200 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  200 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  250 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  250 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  250 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataSummary1.sh  300 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataSummary1.sh  300 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataSummary1.sh  300 $duration $NumberTest
