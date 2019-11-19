FROM phusion/baseimage:0.11
#TAG tuya:latest

RUN apt-get update && apt-get install -y git sudo iptables iproute2 iputils-ping

RUN echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections

COPY files/bin /usr/bin/

RUN cd /usr/bin/ && git clone -b master https://github.com/Cyber1000/tuya-convert.git && cd /usr/bin/tuya-convert && git checkout b17a54fd33929e356eab8d0a230b36eb5e2a7785

RUN cd /usr/bin/tuya-convert && ./install_prereq.sh
