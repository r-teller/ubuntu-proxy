FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install openssh-server squid curl vim sudo -y
RUN apt-get clean

RUN useradd -m -s /bin/bash ubuntu && echo "ubuntu:$HOSTNAME" | chpasswd && usermod -aG sudo ubuntu && echo 'ubuntu ALL=(ALL:ALL) NOPASSWD:ALL' | EDITOR='tee -a' visudo

COPY squid.conf /etc/squid/squid.conf
COPY start.sh /usr/local/bin/start.sh

EXPOSE 7722:22 7728:3128

CMD ["/bin/bash", "/usr/local/bin/start.sh"]
