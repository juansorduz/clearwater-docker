#!/bin/bash
cps=${1:-10}
time=${2:-10}
ip=${3:-127.0.0.1}
time_call=${4:-3000}
cp ~/clearwater-docker/Scripts/sip-stress-template.xml ~/clearwater-docker/Scripts/sip-stress.xml
time2=$(($time * 1000))
usrs=$(($cps * $time))
max_pause="$(($time2 - $time_call))"
echo cps: $cps, usuarios: $usrs, tiempo: $time, max_pause: $max_pause


sed -i '51s@.*@<pause distribution="uniform" min="0" max="num" />@' ~/clearwater-docker/Scripts/sip-stress.xml
sed -i "51s@num@$max_pause@" ~/clearwater-docker/Scripts/sip-stress.xml

cp ~/clearwater-docker/Scripts/sip-stress-ku-template ~/clearwater-docker/Scripts/sip-stress
sed -i '45s@.*@num_users=code@' ~/clearwater-docker/Scripts/sip-stress
sed -i "45s@code@$usrs@" ~/clearwater-docker/Scripts/sip-stress
#192.168.190.20
sed -i "69s@192.168.190.20@$ip@" ~/clearwater-docker/Scripts/sip-stress
echo Running tester_kubernetes script

. ~/clearwater-docker/Scripts/auto_test.sh $cps $time

echo Finalizo prueba subscript
echo stateTest=2 > $testfolder/Variables.txt
