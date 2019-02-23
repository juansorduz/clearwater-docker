#!/bin/bash
password=${1:-0}
. ~/clearwater-docker/ScriptsContainers/CWDataGeneratorMaster1.sh $password
. ~/clearwater-docker/ScriptsContainers/CWDataGeneratorMaster2.sh $password
. ~/clearwater-docker/ScriptsKU/KUDataGeneratorMaster1.sh $password
. ~/clearwater-docker/ScriptsKU/KUDataGeneratorMaster1.sh $password
