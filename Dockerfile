FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install openssh-server squid -y

COPY start.sh /usr/local/bin/start.sh

EXPOSE 22 3128

CMD ["/bin/bash", "/usr/local/bin/start.sh"]
