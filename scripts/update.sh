#!/bin/bash
# Author: Georgy Shapchits <gogi.soft.gm@gmail.com>

NODES=8

APP=/root/a.out
BIN_FILE=/root/bin/a.out

cp ${APP} ${BIN_FILE}
for i in $(seq 1 ${NODES})
do
    scp ${APP} slave-${i}:${BIN_FILE}
done