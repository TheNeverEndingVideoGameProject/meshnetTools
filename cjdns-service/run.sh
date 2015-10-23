#!/bin/bash
#cjdns anti-crash outage helper script
#this assumes that cjdns is installed to /opt/cjdns/
#paste this script into /opt/cjdns/run.sh
 
 
cd /opt/cjdns/
 
while true
do
        if [ `cat runlock` == 1 ]; then
                ./cjdroute --nobg < config &
                echo $! > pid
                wait
                echo "server process ended"
                sleep 1
        else
                break
        fi
done
