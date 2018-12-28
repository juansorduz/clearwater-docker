#!/bin/bash
users="$1"
duration="$2"
#show number of user and duration
echo number of users: $users, duration: $duration

#Copy test script inside the container and gives permissions
docker cp ~/clearwater-docker/Scripts/run_stress2 sipptest:/usr/share/clearwater/bin
docker exec sipptest chmod +x /usr/share/clearwater/bin/run_stress2

#Create storage test folder if not exists and storage the test logs
mkdir -p ~/ClearwaterTestResults/Containers/$users$duration
docker exec sipptest /usr/share/clearwater/bin/run_stress2 example.com $users $duration | tee ~/ClearwaterTestResults/Containers3/$users$duration/logsTestContainer.txt


#$RunTest=500
