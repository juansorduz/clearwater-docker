#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
NumberTest=${2:-2}

#rm -r ~/ClearwaterTestResults
echo Duration $Duration NumberTest $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  10 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  10 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  10 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  20 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  20 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  20 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  30 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  30 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  30 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  40 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  40 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  40 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  50 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  50 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  50 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  60 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  60 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  60 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  70 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  70 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  70 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  80 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  80 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  80 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  90 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  90 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  90 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  100 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  100 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  100 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  120 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  120 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  120 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  150 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  150 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  150 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  200 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  200 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  200 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  250 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  250 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  250 $Duration $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  300 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  300 $Duration $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  300 $Duration $NumberTest
