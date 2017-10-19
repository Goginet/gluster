#!/bin/bash
# Author: Georgy Shapchits <gogi.soft.gm@gmail.com>

NODES=3

master=$(hostname -i)
echo ${master} master >> /etc/hosts

for i in $(seq 1 ${NODES})
do
    slave=$(cat /etc/hosts | grep -m1 "slave-${i}" | grep -oE "172.[0-9]*.[0-9]*.[0-9]*.")
    ssh slave-${i} "echo ${master} master >> /etc/hosts"
    for j in $(seq 1 ${NODES})
    do
        ssh slave-${j} "echo ${slave} slave-${i} >> /etc/hosts"
    done
done

/usr/sbin/sshd -D