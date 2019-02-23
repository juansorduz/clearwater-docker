#!/bin/bash
password=${1:-0}
echo $password | sudo -S kubeadm reset -f
rm -rf ~/.kube/
. ~/clearwater-docker/ScriptsCW/CWImagesCreate.sh
. ~/clearwater-docker/ScriptsCW/CWCreate2.sh
. ~/clearwater-docker/ScriptsContainers/CWPruebaContainer2.sh 200 1
. ~/clearwater-docker/ScriptsContainers/CWPruebaContainer2.sh 500 1
. ~/clearwater-docker/ScriptsContainers/CWPruebaContainer2.sh 1000 1
. ~/clearwater-docker/ScriptsContainers/CWPruebaContainer2.sh 2000 1
. ~/clearwater-docker/ScriptsContainers/CWPruebaContainer2.sh 5000 1
