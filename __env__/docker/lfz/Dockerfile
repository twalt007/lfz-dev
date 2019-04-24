FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get install -y \
      locales=2.27-3ubuntu1 \
      nano=2.9.3-2 \
      sudo=1.8.21p2-3ubuntu1 \
      telnet=0.17-41 && \
    useradd -m -s /bin/bash -G sudo dev && \
    echo "dev ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/dev && \
    chmod 0440 /etc/sudoers.d/dev

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

COPY common/*.bash /setup/
COPY common/.profile /home/dev/.profile
COPY common/mcrypt.so /usr/lib/php/20170718/mcrypt.so

USER dev

WORKDIR /home/dev

EXPOSE 80 443 3000 3001

RUN sudo bash /setup/install.bash
