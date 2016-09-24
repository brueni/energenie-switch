#!/bin/bash
cd `dirname $0`

#Control a energenie-switchboard with 4 plugs with this script
#Usage: switch.sh <ip> <pw> <1/0/stay> <1/0/stay> <1/0/stay> <1/0/stay>

#Login
curl -s -d pw=$2 http://$1/login.html > /dev/null

#Switch Outlet 1, but only if attribute is not 'stay'
if [ "$3" != "stay" ]; then
	curl -s -d cte1=$3 http://$1/ > /dev/null
	echo $3 > state_$1_outlet1.txt
fi

#Dito for Outlet 2
if [ "$4" != "stay" ]; then
        curl -s -d cte2=$4 http://$1/ > /dev/null
	echo $3 > state_$1_outlet2.txt
fi

#Dito for Outlet 3
if [ "$5" != "stay" ]; then
        curl -s -d cte3=$5 http://$1/ > /dev/null
	echo $3 > state_$1_outlet3.txt
fi

#Dito for Outlet 4
if [ "$6" != "stay" ]; then
        curl -s -d cte4=$6 http://$1/ > /dev/null
	echo $3 > state_$1_outlet4.txt
fi
