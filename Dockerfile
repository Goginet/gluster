FROM ubuntu:16.04

MAINTAINER Georgy Shapchits <gogi.soft.gm@gmail.com>

ENV HOME /root
ENV SRC_FILE ${HOME}/src/main.c
ENV BIN_FILE ${HOME}/bin/a.out

WORKDIR ${HOME}

ADD configs configs
ADD src src
ADD ssh .ssh
ADD scripts scripts

RUN apt update -y && \
    apt install -y apt-utils vim iputils-ping openssh-server build-essential mpich && \
    mkdir /var/run/sshd && \
    mkdir -p .ssh && \
    mkdir -p $(dirname ${BIN_FILE}}) && \
    chmod -R 600 .ssh/* && \
    mpicc ${SRC_FILE} -o ${BIN_FILE} && \
    chmod +x scripts/* && \
    cp scripts/run.sh /usr/bin/run && \
    cp scripts/start.sh /usr/bin/start

CMD ["start"]