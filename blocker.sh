#!/bin/bash
HAPLOG=$(/usr/bin/tail /var/log/haproxy.log -n 200 | grep "http-in/<NOSRV>" | /usr/bin/cut -d':' -f4 | /usr/bin/sort | /usr/bin/uniq)
for IPADD in $HAPLOG
do
  /usr/sbin/apf -d $IPADD Spam/attack
done
