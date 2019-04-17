#!/bin/bash
#CONTADOR=0
NumberTest=${1:-2}

#rm -r ~/ClearwaterTestResults

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  10 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  10 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  10 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  20 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  20 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  20 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  30 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  30 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  30 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  40 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  40 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  40 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  50 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  50 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  50 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  60 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  60 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  60 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  70 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  70 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  70 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  80 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  80 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  80 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  90 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  90 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  90 120 $NumberTest

. ~/clearwater-docker/ScriptsDat/DatGeneralDataPromedy1.sh  100 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatDockerDataPromedy1.sh  100 120 $NumberTest
. ~/clearwater-docker/ScriptsDat/DatVMDataPromedy1.sh  100 120 $NumberTest
