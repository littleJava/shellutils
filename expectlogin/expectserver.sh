#!/usr/bin/expect -f
set timeout 3
#spawn /bin/bash
#spawn read -p "password:" -s password
#spawn echo $password

#ssh  -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ticketserver184088.cm4 
#expect ".*:$"
#send "\r"
#expect "password:"
#send "$password\r"
#interact

set serveraddr [lindex $argv 0]
set loginuser [lindex $argv 1]
set password [lindex $argv 2]
spawn ssh -l $loginuser  $serveraddr 
expect "id_dsa':"
send "\r"
expect "password:"
send "$password\r"
expect "]*"
send "cd /home/admin \r"
interact
