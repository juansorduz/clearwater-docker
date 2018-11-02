#!/bin/bash
users=${1:-100}
duration=${2:-1}
sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#show number of user and duration
#echo number of users: $users, duration: $duration

#echo "Updating test script"
#Copy test script inside the container and gives permissions
kubectl cp ~/clearwater-docker/ScriptsKU/run_stress $sipptestpod:/usr/share/clearwater/bin
kubectl exec $sipptestpod chmod +x /usr/share/clearwater/bin/run_stress

#echo "Creating test folder"
#Create storage test folder if not exists and storage the test logs
mkdir -p ~/ClearwaterTestResults/Kubernetes/$users$duration
testfolder=~/ClearwaterTestResults/Kubernetes/$users$duration

#echo "Start test"
kubectl exec sipptest /usr/share/clearwater/bin/run_stress default.svc.cluster.local $users $duration >> $testfolder/logsTestContainer.txt


