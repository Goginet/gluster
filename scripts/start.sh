#!/bin/bash
# Author: Georgy Shapchits <gogi.soft.gm@gmail.com>

master=$(hostname -i)
slave1=$(cat /etc/hosts | grep -m1 "slave-1" | grep -oE "172.[0-9]*.[0-9]*.[0-9]*.")
slave2=$(cat /etc/hosts | grep -m1 "slave-2" | grep -oE "172.[0-9]*.[0-9]*.[0-9]*.")

echo ${master} master >> /etc/hosts

ssh slave-1 "echo ${master} master >> /etc/hosts"
ssh slave-1 "echo ${slave1} slave-1 >> /etc/hosts"
ssh slave-1 "echo ${slave2} slave-2 >> /etc/hosts"

ssh slave-2 "echo ${master} master >> /etc/hosts"
ssh slave-2 "echo ${slave1} slave-1 >> /etc/hosts"
ssh slave-2 "echo ${slave2} slave-2 >> /etc/hosts"

/usr/sbin/sshd -D