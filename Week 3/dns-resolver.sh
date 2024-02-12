#!bin/bash

prefix=$1
server=$2
for i in {1..255}; do
    ip="$prefix.$i"
    timeout .1 bash -c "nslookup $ip $server | grep 'name'"
done
exit