#!/bin/bash
test="$1"
duration="$2"
sshpass -p 'password' ssh -t user@192.168.0.146 /usr/share/clearwater/bin/run_stress rtn.edu.co $test $duration
