#### All images must have openssh-server installed and a fix IP address in /etc/network/interfaces starting with ip_base.140
## users in VMs must be named clearwater
ip_base=${1:-10.55.3.}
ip_dns=${1:-10.55.3.87}
password=${2:-'nfv1234'}
j=88
k=88
m=1
for i in ellis bono sprout homer dime vellum ; do
  l=$ip_base$k
  echo $i

sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install clearwater-management --yes "
sshpass -p $password scp ~/clearwater-docker/Scriptsinstaller/shared_config worker$m@$l:/tmp/
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S cp /tmp/shared_config /etc/clearwater/"
sshpass -p $password ssh -t worker$m@$l "echo $'nameserver '"$ip_dns" > /tmp/dnsmasq.resolv.conf"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S cp /tmp/dnsmasq.resolv.conf /etc/"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S cp /etc/default/dnsmasq /tmp/"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S chmod +x /tmp/*"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S chown clearwater /tmp/*"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S echo 'RESOLV_CONF=/etc/dnsmasq.resolv.conf' >> /tmp/dnsmasq"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S cp -rf /tmp/dnsmasq /etc/default/"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S service dnsmasq restart"
sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S reboot"
((k++))
((m++))
done
