FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get install -y \
      nano=2.9.3-2 \
      telnet=0.17-41 \
      sudo=1.8.21p2-3ubuntu1 && \
    useradd -m -s /bin/bash -G sudo dev && \
    echo "dev ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/dev && \
    chmod 0440 /etc/sudoers.d/dev

COPY common/*.bash /setup/
COPY common/.profile /home/dev/.profile
COPY common/mcrypt.so /usr/lib/php/20170718/mcrypt.so

USER dev

WORKDIR /home/dev/lfz

EXPOSE 80 443 3000 3001

RUN sudo bash /setup/install.bash
