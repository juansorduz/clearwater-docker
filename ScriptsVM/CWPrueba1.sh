#!/bin/bash
test="$1"
duration="$2"
sshpass -p 'cw123' ssh -t cw@192.168.1.150 /usr/share/clearwater/bin/run_stress rtn.edu.co $test $duration
