FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install openssh-server squid -y

EXPOSE 22 3128

ENTRYPOINT "/etc/init.d/ssh start" && "/etc/init.d/squid start" && /bin/bash
