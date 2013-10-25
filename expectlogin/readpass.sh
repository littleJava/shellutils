#!/bin/bash
#expect shell doesn't support the read command

#gather the server via the armory
servers=()
i=0
for s in `armory --appnode ticketserver | grep real_hostname | awk '{print $2}'`
 do 
	servers[i]=$s
 	let i++
done

#echo the tips for user choosing
index=0
for server in ${servers[*]}
do
    echo $index $server
    let index++
done

serverindex=-1
#echo ${#servers[@]}
#loop until the suitable index of the array
while [ $serverindex -lt 0 ]||[ $serverindex -ge ${#servers[*]} ]
do
 read -p "input the target server index:" serverindex
done
#echo ${servers[$serverindex]}

#password exists in the env
if [ -z $password  ]; then
 read -p "password:" -s password
fi
./expectserver.sh ${servers[$serverindex]} 'haibo.lhb' $password
