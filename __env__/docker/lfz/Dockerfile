FROM ubuntu:18.04

RUN rm /etc/dpkg/dpkg.cfg.d/excludes

RUN apt-get -qq update && \
    apt-get install -y man && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall

RUN apt-get install -y \
      locales \
      nano \
      sudo \
      bash-completion && \
    useradd -m -s /bin/bash -G sudo dev && \
    echo "dev ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/dev && \
    chmod 0440 /etc/sudoers.d/dev

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY common/*.bash /setup/
COPY common/.profile /home/dev/.profile

USER dev

WORKDIR /home/dev

EXPOSE 80 443 3000 3001 8081 9000

RUN sudo bash /setup/install.bash
