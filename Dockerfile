FROM ubuntu:artful

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
 && apt-get -y update \
 && apt-get -y install wget apt-transport-https

RUN wget -q -O- https://downloads.opennebula.org/repo/repo.key | apt-key add - \
 && echo "deb https://downloads.opennebula.org/repo/5.4/Ubuntu/16.04 stable opennebula" > /etc/apt/sources.list.d/opennebula.list \
 && apt-get -y update \
 && apt-get -y install opennebula-node \
 && mkdir -p /var/run/sshd \
 && rm -f /etc/libvirt/qemu/networks/autostart/default.xml
