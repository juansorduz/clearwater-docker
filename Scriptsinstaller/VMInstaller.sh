#### All images must have openssh-server installed and a fix IP address in /etc/network/interfaces starting with ip_base.140
## users in VMs must be named clearwater
ip_base=${1:-192.168.190.}
password=${2:-123}
j=61
for i in ip_ellis ; do
  i=$ip_base$j
  echo $i
  sshpass -p $password ssh -t clearwater@$i "echo 'deb https://apt.kubernetes.io/ kubernetes-xenial main' > /tmp/clearwater.list "
  sshpass -p $password ssh -t clearwater@$i "echo $password | sudo cp /tmp/clearwater.list /etc/apt/sources.list.d/ "
  sshpass -p $password ssh -t clearwater@$i "echo $password | sudo -S apt-get update"
  sshpass -p $password ssh -t root@$i "curl -L http://repo.cw-ngv.com/repo_key | sudo apt-key add - "
  sshpass -p $password ssh -t root@$i "apt-get update"
((j++))
done
