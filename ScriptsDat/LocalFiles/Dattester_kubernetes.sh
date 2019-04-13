#!/bin/bash
cps=${1:-10}
time=${2:-10}
ip=${3:-127.0.0.1}
time_call=${4:-3000}
cp ~/clearwater-docker/Scripts/sip-stress-template.xml ~/clearwater-docker/Scripts/sip-stress.xml
time2=$(($time * 1000))
usrs=$(($cps * $time))
max_pause="$(($time2 - $time_call))"
sipptest=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)

echo [SCTIPT GENERADOR TRAFICO] cps: $cps, usuarios: $usrs, tiempo: $time, max_pause: $max_pause


sed -i '51s@.*@<pause distribution="uniform" min="0" max="num" />@' ~/clearwater-docker/Scripts/sip-stress.xml
sed -i "51s@num@$max_pause@" ~/clearwater-docker/Scripts/sip-stress.xml

cp ~/clearwater-docker/Scripts/sip-stress-ku-template ~/clearwater-docker/Scripts/sip-stress
sed -i '45s@.*@num_users=code@' ~/clearwater-docker/Scripts/sip-stress
sed -i "45s@code@$usrs@" ~/clearwater-docker/Scripts/sip-stress
#192.168.190.20
sed -i "70s@192.168.190.20@$ip@" ~/clearwater-docker/Scripts/sip-stress


kubectl cp ~/clearwater-docker/Scripts/sip-stress $sipptest:/usr/share/clearwater/bin/sip-stress
kubectl cp ~/clearwater-docker/Scripts/sip-stress.xml $sipptest:/usr/share/clearwater/sip-stress/sip-stress.xml
kubectl exec $sipptest chmod 777 /usr/share/clearwater/bin/sip-stress
kubectl exec $sipptest chmod 777 /usr/share/clearwater/sip-stress/sip-stress.xml
kubectl exec $sipptest chmod +x /usr/share/clearwater/bin/sip-stress
kubectl exec $sipptest chmod +x /usr/share/clearwater/sip-stress/sip-stress.xml


touch $testfolder/logsSIPpTest.txt
kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress > $testfolder/logsSIPpTest.txt

kubectl cp $sipptest:/var/log/clearwater-sipp/ $testfolder
#sleep 30

echo Finalizo script generador de trafico
echo stateTest=2 > $testfolder/Variables.txt
