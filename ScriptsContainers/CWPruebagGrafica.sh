#!/bin/bash
#CONTADOR=0
#docker exec sipptest /usr/share/clearwater/bin/run_stress example.com 100 1 . &
#echo Introducir el numero de reporte
#read NoReporte
#mkdir -p ~/clearwater-docker/ResultadoPruebas/$NoReporte
#echo "ban1"
#filedir=/~/clearwater-docker/ResultadoPruebas/$NoReporte
#echo "ban2"
#startTime=$(date +"%T")
echo Introducir el numero de usuarios?
read usuarios
echo Introducir la duracion del experimento
read duracion
echo tiempo aproximado
read tiempoAprox
#echo numero de usuarios: $usuarios, duracion: $duracion

. ~/clearwater-docker/ScriptsContainers/CWPrueba1.sh $usuarios $duracion &

#docker cp ~/clearwater-docker/Scripts/run_stress sipptest:/usr/share/clearwater/bin
#docker exec sipptest chmod +x /usr/share/clearwater/bin/run_stress
#docker exec sipptest /usr/share/clearwater/bin/run_stress example.com $usuarios $duracion | tee ~/clearwater-docker/ResultadosPruebas/ResultadoPrueba$usuarios$duracion.txt
mkdir -p ~/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion
echo "Tiempo Inicial : $(date +"%T")" >> ~/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/Tiempos.csv
#echo "ban3"
#NoReporte= 4
#RunTest = $RunTest
CONTADOR=0
TiempoSeg=30
tiempoContador=$((30*$tiempoAprox))
echo Tiempo aprox $tiempoAprox
echo Tiempo seg $TiempoSeg
echo Tiempo contador $tiempoContador
while [ $CONTADOR -lt $tiempoContador ]; do
#echo $RunTest
#while  $RunTest == 1; do
# while [  $RunTest -lt 300 ]; do
     #echo "ban4"
     #echo El contador es $CONTADOR
     now=$(date +"%T")
     echo $now
     echo -e "Tiempo $now" >> ~/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/Tiempos.csv
     #echo "" >> $fileReport
     #docker ps -q | xargs  docker stats --no-stream >> $fileReport
     #docker ps -q | xargs docker stats --no-stream  --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" astaire>> $fileReport
     #for i in base astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest; do
     #docker stats --no-stream  --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" astaire>> ~/clearwater-docker/ResultadoPruebas/$NoReporte/$i.csv;
     #done
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q)>> ~/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/contenedores.csv
     let CONTADOR=CONTADOR+1
 done

 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest chronos_2 chronos_3; do
 for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest ; do
 #docker stats --no-stream  --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" astaire>> ~/clearwater-docker/ResultadoPruebas/$NoReporte/$i.csv;
 cat ~/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/contenedores.csv | grep $i >> ~/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$i.csv;
#sed -i '/chronos_2/d' ./chronos.csv
 done
 # Este ciclo deja listos los csv
 for j in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest ; do

sed -i 's/              /,/g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
sed -i 's/            /,/g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
sed -i 's/           /,/g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
sed -i 's/      /,/g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
sed -i 's/%/ /g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
sed -i 's/,/ ,/g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
sed -i 's/ //g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
sed -i 's/,/           /g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
#sed -i 's/, /,/g' /home/gabriel/clearwater-docker/ResultadoPruebasContainers/$usuarios$duracion/$j.csv
# El último es para quitar cualquier espacio
 done
