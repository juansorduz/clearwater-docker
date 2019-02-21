#!/bin/bash
users="$1"
duration="$2"
#show number of user and duration
echo number of users: $users, duration: $duration, number of tests: $NumTest, testfolder $testfolder

echo stateTest=1 > $testfolder/Variables.txt

#Copy test script inside the container and gives permissions
docker cp ~/clearwater-docker/Scripts/run_stress2 sipptest:/usr/share/clearwater/bin
docker exec sipptest chmod +x /usr/share/clearwater/bin/run_stress2

#Create storage test folder if not exists and storage the test logs
mkdir -p ~/ClearwaterTestResults/Containers2/$users$duration/$users$duration$NumTest
docker exec sipptest /usr/share/clearwater/bin/run_stress2 example.com $users $duration > ~/ClearwaterTestResults/Containers2/$users$duration/$users$duration$NumTestss/logsTestContainer.txt

echo Finalizo prueba subscript
echo stateTest=2 > $testfolder/Variables.txt
#$RunTest=500
