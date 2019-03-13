#!/bin/bash
users=${1:-100}
duration=${2:-1}
sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#show number of user and duration
echo number of users: $users, duration: $duration, number of tests: $NumTest, testfolder $testfolder

echo stateTest=1 > $testfolder/Variables.txt
#Copy test script inside the container and gives permissions
kubectl cp ~/clearwater-docker/ScriptsKU/run_stress3 $sipptestpod:/usr/share/clearwater/bin
kubectl exec $sipptestpod chmod +x /usr/share/clearwater/bin/run_stress3

#echo "Creating test folder"
#Create storage test folder if not exists and storage the test logs
mkdir -p ~/ClearwaterTestResults/Kubernetes3/$users$duration/$users$duration$NumTest
#testfolder=~/ClearwaterTestResults/Kubernetes2/$users$duration

echo "Start test"
kubectl exec $sipptestpod /usr/share/clearwater/bin/run_stress3 default.svc.cluster.local $users $duration > $testfolder/logsTestContainer.txt

echo Finalizo prueba subscript
echo stateTest=2 > $testfolder/Variables.txt
