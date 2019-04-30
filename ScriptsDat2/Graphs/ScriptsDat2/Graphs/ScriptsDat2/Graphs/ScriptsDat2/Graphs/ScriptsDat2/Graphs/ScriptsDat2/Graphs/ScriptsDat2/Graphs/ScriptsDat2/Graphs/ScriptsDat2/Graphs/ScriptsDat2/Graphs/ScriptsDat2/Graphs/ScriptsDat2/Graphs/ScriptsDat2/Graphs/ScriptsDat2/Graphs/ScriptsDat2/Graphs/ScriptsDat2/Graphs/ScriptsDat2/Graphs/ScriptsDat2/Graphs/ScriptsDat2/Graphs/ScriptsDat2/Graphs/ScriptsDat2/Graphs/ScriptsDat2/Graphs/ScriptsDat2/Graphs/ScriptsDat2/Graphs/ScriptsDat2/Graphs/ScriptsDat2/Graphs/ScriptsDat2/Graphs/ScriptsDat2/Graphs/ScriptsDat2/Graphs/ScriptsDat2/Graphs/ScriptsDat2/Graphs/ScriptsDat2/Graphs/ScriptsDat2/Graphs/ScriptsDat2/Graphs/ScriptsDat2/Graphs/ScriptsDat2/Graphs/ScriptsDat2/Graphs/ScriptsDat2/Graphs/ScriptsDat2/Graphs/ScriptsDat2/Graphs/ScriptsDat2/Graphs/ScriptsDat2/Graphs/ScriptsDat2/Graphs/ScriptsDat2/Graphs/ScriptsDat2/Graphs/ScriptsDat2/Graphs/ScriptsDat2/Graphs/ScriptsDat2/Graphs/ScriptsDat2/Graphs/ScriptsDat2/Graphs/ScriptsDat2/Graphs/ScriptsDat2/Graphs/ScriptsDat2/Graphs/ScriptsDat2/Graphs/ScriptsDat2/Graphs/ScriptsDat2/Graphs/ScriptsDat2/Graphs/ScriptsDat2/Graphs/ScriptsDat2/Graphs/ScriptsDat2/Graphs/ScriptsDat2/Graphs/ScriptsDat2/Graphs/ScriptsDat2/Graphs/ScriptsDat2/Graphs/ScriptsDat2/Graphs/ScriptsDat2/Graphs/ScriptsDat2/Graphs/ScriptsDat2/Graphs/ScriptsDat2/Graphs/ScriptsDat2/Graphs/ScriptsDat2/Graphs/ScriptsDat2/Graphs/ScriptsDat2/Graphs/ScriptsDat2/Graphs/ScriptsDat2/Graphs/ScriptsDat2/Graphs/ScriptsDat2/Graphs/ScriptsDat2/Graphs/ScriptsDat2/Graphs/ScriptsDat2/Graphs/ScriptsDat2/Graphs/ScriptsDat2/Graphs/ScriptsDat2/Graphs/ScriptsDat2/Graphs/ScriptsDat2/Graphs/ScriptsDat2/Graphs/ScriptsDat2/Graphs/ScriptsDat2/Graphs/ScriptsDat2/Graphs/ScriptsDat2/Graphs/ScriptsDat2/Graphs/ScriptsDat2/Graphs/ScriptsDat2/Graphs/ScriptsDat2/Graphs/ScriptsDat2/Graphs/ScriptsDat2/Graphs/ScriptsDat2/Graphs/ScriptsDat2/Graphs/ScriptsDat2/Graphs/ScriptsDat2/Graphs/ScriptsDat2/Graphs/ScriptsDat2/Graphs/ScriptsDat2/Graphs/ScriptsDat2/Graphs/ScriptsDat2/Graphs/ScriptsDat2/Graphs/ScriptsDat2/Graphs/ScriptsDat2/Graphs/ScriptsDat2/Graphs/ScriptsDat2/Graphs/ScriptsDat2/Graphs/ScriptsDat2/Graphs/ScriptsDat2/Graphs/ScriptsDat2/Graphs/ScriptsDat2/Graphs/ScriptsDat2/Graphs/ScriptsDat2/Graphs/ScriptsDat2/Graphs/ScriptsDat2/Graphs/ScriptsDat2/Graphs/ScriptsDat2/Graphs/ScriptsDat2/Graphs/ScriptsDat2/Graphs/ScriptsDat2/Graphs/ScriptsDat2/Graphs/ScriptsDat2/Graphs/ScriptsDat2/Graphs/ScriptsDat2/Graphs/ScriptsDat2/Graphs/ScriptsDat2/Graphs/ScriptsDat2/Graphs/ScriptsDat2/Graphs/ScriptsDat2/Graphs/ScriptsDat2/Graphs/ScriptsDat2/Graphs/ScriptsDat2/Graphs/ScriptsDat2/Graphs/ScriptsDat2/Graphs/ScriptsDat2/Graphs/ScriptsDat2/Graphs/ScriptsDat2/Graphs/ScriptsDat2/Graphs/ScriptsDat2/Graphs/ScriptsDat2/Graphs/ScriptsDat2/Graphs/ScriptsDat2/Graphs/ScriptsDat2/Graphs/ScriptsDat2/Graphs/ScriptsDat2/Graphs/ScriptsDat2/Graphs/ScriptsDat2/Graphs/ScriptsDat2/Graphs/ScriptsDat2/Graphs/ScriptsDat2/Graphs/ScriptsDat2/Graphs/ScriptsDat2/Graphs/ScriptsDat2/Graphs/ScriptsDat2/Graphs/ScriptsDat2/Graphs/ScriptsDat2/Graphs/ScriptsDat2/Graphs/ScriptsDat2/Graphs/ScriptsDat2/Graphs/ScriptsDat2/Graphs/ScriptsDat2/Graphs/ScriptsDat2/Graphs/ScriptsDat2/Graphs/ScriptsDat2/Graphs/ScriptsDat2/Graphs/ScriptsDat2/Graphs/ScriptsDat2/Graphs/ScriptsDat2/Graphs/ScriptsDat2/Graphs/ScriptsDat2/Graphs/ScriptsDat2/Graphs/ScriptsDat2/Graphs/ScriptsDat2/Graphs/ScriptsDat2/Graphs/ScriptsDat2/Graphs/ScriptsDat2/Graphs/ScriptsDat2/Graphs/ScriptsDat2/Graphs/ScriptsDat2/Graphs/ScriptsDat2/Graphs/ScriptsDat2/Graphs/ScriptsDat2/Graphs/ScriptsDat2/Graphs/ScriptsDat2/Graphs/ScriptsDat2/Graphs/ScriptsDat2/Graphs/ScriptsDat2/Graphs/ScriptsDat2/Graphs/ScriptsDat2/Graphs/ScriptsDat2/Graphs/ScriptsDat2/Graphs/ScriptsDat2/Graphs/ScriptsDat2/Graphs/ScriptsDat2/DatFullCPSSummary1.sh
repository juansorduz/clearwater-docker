#!/bin/bash
#CONTADOR=0
duration=${1:-120}
NumberTest=${2:-2}

#rm -r ~/ClearwaterTestResults
echo CPS Test duration $duration NumberTest $NumberTest

source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  10 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  10 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  10 $duration $NumberTest

# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  20 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  20 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  20 $duration $NumberTest
#exit 0
. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  30 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  30 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  30 $duration $NumberTest

# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  40 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  40 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  40 $duration $NumberTest

# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  50 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  50 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  50 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  60 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  60 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  60 $duration $NumberTest

# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  70 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  70 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  70 $duration $NumberTest
#
# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  80 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  80 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  80 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  90 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  90 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  90 $duration $NumberTest

# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  100 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  100 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  100 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  120 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  120 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  120 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  150 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  150 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  150 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  180 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  180 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  180 $duration $NumberTest

# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  200 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  200 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  200 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  240 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  240 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  240 $duration $NumberTest

# . ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  250 $duration $NumberTest
# #. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  250 $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  250 $duration $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatGeneralDataSummary1.sh  300 $duration $NumberTest
#. ~/clearwater-docker/ScriptsDat2/DatDockerDataSummary1.sh  300 $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatVMDataSummary1.sh  300 $duration $NumberTest
