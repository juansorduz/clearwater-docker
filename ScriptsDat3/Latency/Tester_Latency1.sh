#!/bin/bash
NumSipp=${1:-1}
ip=${2:-10.55.3.95}
directory=~/clearwater-docker/ScriptsDat3/Latency
#SipptestPods=$(kubectl get pods | grep sipptest | awk '{print $1}')
#sipptest=$(echo $SipptestPods | cut -d ' ' -f$NumSipp);
sipptest=sipptest

#Optaining bono ip
#NumBono can change, for this test we have pairs of sipp and bono
# NumBono=$NumSipp
# BonoIPs=$(kubectl get pods -o wide | grep bono | awk '{print $6}')
# ip=$(echo $BonoIPs | cut -d ' ' -f$NumBono);

echo [SCTIPT GENERDOR RETARDO] sipppod=$sipptest ipBono=$ip

userfile=users_test_latency.csv.$NumSipp
cp $directory/sip-stress-latency-template $directory/sip-stress-latency$NumSipp
sed -i "69s@192.168.190.72@$ip@" $directory/sip-stress-latency$NumSipp
sed -i "69s@users_test_latency.csv.1@$userfile@" $directory/sip-stress-latency$NumSipp
echo Sending single latency scenario
docker cp $directory/sip-stress-complete-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
echo Sending csv file for single test $directory/users_test_latency.csv.$NumSipp
docker cp $directory/users_test_latency.csv.$NumSipp $sipptest:/usr/share/clearwater/sip-stress/
echo Sending single latency script
docker cp $directory/sip-stress-latency$NumSipp $sipptest:/usr/share/clearwater/bin/

docker exec $sipptest chmod 777 /usr/share/clearwater/sip-stress/users_test_latency.csv.$NumSipp
docker exec $sipptest chmod 777 /usr/share/clearwater/bin/sip-stress-latency$NumSipp
docker exec $sipptest chmod +x /usr/share/clearwater/sip-stress/users_test_latency.csv.$NumSipp
docker exec $sipptest chmod +x /usr/share/clearwater/bin/sip-stress-latency$NumSipp

[ -e $testfolder/SingleLatencyTest$NumSipp.csv ] && rm $testfolder/SingleLatencyTest$NumSipp.csv
touch $testfolder/SingleLatencyTest$NumSipp.csv
source $testfolder/Variables.txt
while [ "$stateTest" -eq '1' ]; do
#echo REGISTRY
  START=$(date +%s.%N)
  ERRORVARIABLE="$(docker exec $sipptest ./usr/share/clearwater/bin/sip-stress-latency$NumSipp 2>&1 > /dev/null)"
  #ERRORVARIABLE="$(kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress-latency$NumSipp 2>&1)"
  #ERRORVARIABLE=0
  #kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress-latency$NumSipp
  END=$(date +%s.%N)
  LATENCY=$(echo "$END - $START" | bc)
  #echo $LATENCY
  #echo $ERRORVARIABLE
  ERROR_LENGTH=${#ERRORVARIABLE}
  echo $ERROR_LENGTH
  if [ "$ERROR_LENGTH" -lt '300' ]
  then
    #echo Valor positivo $NumSipp $LATENCY
    echo $LATENCY >> $testfolder/SingleLatencyTest$NumSipp.csv

   #else
     #echo Valor negativoo $NumSipp $LATENCY
  fi
  source $testfolder/Variables.txt
  if [ "$stateTest" -eq '2' ]
  then
    echo Finalizo prueba Retardo
  fi
done
