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


  sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S rm -r /etc/clearwater"
  sshpass -p $password ssh -t worker$m@$l "echo 'deb http://repo.cw-ngv.com/stable binary/' > /tmp/clearwater.list"
  sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S cp /tmp/clearwater.list /etc/apt/sources.list.d/"
  sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S sh -c 'curl -L http://repo.cw-ngv.com/repo_key | apt-key add -'"
  sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S apt-get update "
  sshpass -p $password ssh -t worker$m@$l "echo $'local_ip='"$l"$'\npublic_ip='"$l"$'\npublic_hostname='"$i"$'\netcd_cluster=\"'"$ip_base$(($j)),$ip_base$(($j+1)),$ip_base$(($j+2)),$ip_base$(($j+3)),$ip_base$(($j+4)),$ip_base$(($j+5))"$'\"' > /tmp/local_config"
  sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S mkdir /etc/clearwater"
  sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S cp /tmp/local_config /etc/clearwater/"
  if test $i = "ellis"
        then
          echo ellis
          sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install ellis --yes"
  fi
  if test $i = "bono"
        then
          echo bono
          sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install bono restund --yes"
  fi
  if test $i = "sprout"
        then
          echo sprout
          sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install sprout --yes"
  fi
  if test $i = 'homer'
        then
          echo homer
          sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install homer --yes"
  fi
  if test $i = 'dime'
        then
          echo dime
          sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install dime clearwater-prov-tools --yes"
  fi
  if test $i = 'vellum'
        then
          echo vellum
          sshpass -p $password ssh -t worker$m@$l "echo $password | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install vellum --yes"
  fi
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
