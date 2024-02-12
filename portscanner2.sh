!/bin/bash

if [ $# -eq 1 ]
then
  prefix=$1
  echo "host, port"
  for i in {1..255}; do
    ip="$1.$i"
    timeout 0.1 bash -c "echo >/dev/tcp/$ip/53" 2>/dev/null &&
      echo "$ip, 53"
  done
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