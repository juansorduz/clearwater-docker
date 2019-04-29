#!/bin/bash
cps=${1:-10}
time=${2:-10}
NumSipp=${3:-1}
ip=${4:-10.55.3.89}
time_call=${5:-3000}
cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-template.xml ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress.xml
time2=$(($time * 1000))
usrs=$(($cps * $time))
max_pause="$(($time2 - $time_call))"
#Optaining sipp pod
#SipptestPods=$(kubectl get pods | grep sipptest | awk '{print $1}')
#sipptest=$(echo $SipptestPods | cut -d ' ' -f$NumSipp);
sipptest=sipptest
#LocalSipptestIP=$(echo $SipptestIPs | cut -d ' ' -f$i);
#Optaining bono ip
#NumBono can change, for this test we have pairs of sipp and bono
#NumBono=$NumSipp
#BonoIPs=$(kubectl get pods -o wide | grep bono | awk '{print $6}')
#ip=$(echo $BonoIPs | cut -d ' ' -f$NumBono);
userfile=users$NumSipp.csv

echo [SCTIPT GENERADOR TRAFICO] sipppod=$sipptest cps: $cps, usuarios: $usrs, tiempo: $time, ipBono: $ip


sed -i '51s@.*@<pause distribution="uniform" min="0" max="num" />@' ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress.xml
sed -i "51s@num@$max_pause@" ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress.xml

cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-ku-template ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress$NumSipp
sed -i '45s@.*@num_users=code@' ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress$NumSipp
sed -i "45s@code@$usrs@" ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress$NumSipp
#192.168.190.20
sed -i "70s@192.168.190.20@$ip@" ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress$NumSipp
sed -i "70s@users.csv@$userfile@" ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress$NumSipp


docker cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress$NumSipp $sipptest:/usr/share/clearwater/bin/sip-stress
docker cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress.xml $sipptest:/usr/share/clearwater/sip-stress/sip-stress.xml
docker exec $sipptest chmod 777 /usr/share/clearwater/bin/sip-stress
docker exec $sipptest chmod 777 /usr/share/clearwater/sip-stress/sip-stress.xml
docker exec $sipptest chmod +x /usr/share/clearwater/bin/sip-stress
docker exec $sipptest chmod +x /usr/share/clearwater/sip-stress/sip-stress.xml


#touch $testfolder/logsSIPpTest.txt
docker exec $sipptest ./usr/share/clearwater/bin/sip-stress > $testfolder/logsSIPpTest$NumSipp.txt
#docker exec $sipptest ./usr/share/clearwater/bin/sip-stress
#kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress > $testfolder/logsSIPpTest$NumSipp.txt 2> /dev/nul

docker cp $sipptest:/var/log/clearwater-sipp/ $testfolder
#sleep 30

echo Finalizo script generador de trafico
echo stateTest$NumSipp=2 >> $testfolder/Variables.txt
