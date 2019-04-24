#!/bin/bash
NumSipp=${1:-1}
directory=~/clearwater-docker/ScriptsDat2/Latency
SipptestPods=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
sipptest=$(echo $SipptestPods | cut -d ' ' -f$NumSipp);

#Optaining bono ip
#NumBono can change, for this test we have pairs of sipp and bono
NumBono=$NumSipp
BonoIPs=$(kubectl get pods -o wide | grep bono | cut -d ' ' -f34)
ip=$(echo $BonoIPs | cut -d ' ' -f$NumBono);

cp $directory/sip-stress-latency-template $directory/sip-stress-latency
sed -i "69s@192.168.190.72@$ip@" $directory/sip-stress-latency
echo Sending single latency scenario
kubectl cp $directory/sip-stress-complete-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
echo Sending csv file for single test $directory/users_test_latency.csv.1
kubectl cp $directory/users_test_latency.csv.1 $sipptest:/usr/share/clearwater/sip-stress/
echo Sending single latency script
kubectl cp $directory/sip-stress-latency $sipptest:/usr/share/clearwater/bin/

kubectl exec $sipptest chmod 777 /usr/share/clearwater/sip-stress/users_test_latency.csv.1
kubectl exec $sipptest chmod 777 /usr/share/clearwater/bin/sip-stress-latency
kubectl exec $sipptest chmod +x /usr/share/clearwater/sip-stress/users_test_latency.csv.1
kubectl exec $sipptest chmod +x /usr/share/clearwater/bin/sip-stress-latency

[ -e $testfolder/SingleLatencyTest$NumSipp.csv ] && rm $testfolder/SingleLatencyTest$NumSipp.csv
touch $testfolder/SingleLatencyTest$NumSipp.csv
source $testfolder/Variables.txt
while [ "$stateTest" -eq '1' ]; do
#echo REGISTRY
  START=$(date +%s.%N)
  ERRORVARIABLE="$(kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress-latency 2>&1 > /dev/null)"
  #kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress-latency > /dev/null
  END=$(date +%s.%N)
  LATENCY=$(echo "$END - $START" | bc)
  #echo $LATENCY
  #echo $ERRORVARIABLE
  ERROR_LENGTH=${#ERRORVARIABLE}
  #echo $ERROR_LENGTH
  if [ "$ERROR_LENGTH" -lt '150' ]
  then
    #echo Valor positivo $LATENCY
    echo $LATENCY >> $testfolder/SingleLatencyTest$NumSipp.csv

  # else
  #   echo Valor negativoo $LATENCY
  fi
  source $testfolder/Variables.txt
  if [ "$stateTest" -eq '2' ]
  then
    echo Finalizo prueba Latencia
  fi
done
