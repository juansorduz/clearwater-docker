#!/bin/bash
users=${1:-100}
duration=${2:-1}
sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#show number of user and duration
echo number of users: $users, duration: $duration, number of tests: $NumTest, testfolder $testfolder

echo stateTest=1 > $testfolder/Variables.txt
#Copy test script inside the container and gives permissions
kubectl cp ~/clearwater-docker/ScriptsKU/run_stress1 $sipptestpod:/usr/share/clearwater/bin
kubectl exec $sipptestpod chmod +x /usr/share/clearwater/bin/run_stress1

echo "Creating test folder"
#Create storage test folder if not exists and storage the test logs
mkdir -p ~/ClearwaterTestResults/Kubernetes1/$users$duration/$users$duration$NumTest
#testfolder=~/ClearwaterTestResults/Kubernetes1/$users$duration

echo "Start test"
kubectl exec $sipptestpod /usr/share/clearwater/bin/run_stress1 default.svc.cluster.local $users $duration | tee $testfolder/logsTestContainer.txt

echo Finalizo prueba subscript
echo stateTest=2 > $testfolder/Variables.txt
