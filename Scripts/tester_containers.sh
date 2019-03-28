#!/bin/bash
cps=${1:-10}
time=${2:-10}
#ip=${2:-1000}
time_call=${3:-3000}
cp ~/clearwater-docker/Scripts/sip-stress-template.xml ~/clearwater-docker/Scripts/sip-stress2.xml
time2=$(($time * 1000))
usrs=$(($cps * $time))
max_pause="$(($time2 - $time_call))"
echo cps: $cps, usuarios: $usrs, tiempo: $time, max_pause: $max_pause


sed -i '51s@.*@<pause distribution="uniform" min="0" max="num" />@' ~/clearwater-docker/Scripts/sip-stress2.xml
sed -i "51s@num@$max_pause@" ~/clearwater-docker/Scripts/sip-stress2.xml

cp ~/clearwater-docker/Scripts/sip-stress2-containers-template ~/clearwater-docker/Scripts/sip-stress2
sed -i '45s@.*@num_users=code@' ~/clearwater-docker/Scripts/sip-stress2
sed -i "45s@code@$usrs@" ~/clearwater-docker/Scripts/sip-stress2

. ~/clearwater-docker/Scripts/auto_test2.sh

echo Finalizo prueba subscript
echo stateTest=2 > $testfolder/Variables.txt
