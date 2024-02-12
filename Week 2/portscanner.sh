!/bin/bash

if [ $# -lt 2 ]
  then
    echo "invalid input - please specify a host and port file. ./portscanner.sh hostfile.txt portfile.txt"
    exit 1
  fi
hostfile=$1
portfile=$2
echo "host,port"
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
    timeout 0.1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
       echo "$host,$port"
  done
done






