function install-network-tools() {

  DEBIAN_FRONTEND=noninteractive \
  apt-get -y -o Dpkg::Options::="--force-confdef" \
             -o Dpkg::Options::="--force-confold" \
    install \
      unzip \
      curl \
      host \
      httpie \
      telnet \
      iputils-ping \
      netcat-openbsd \
      traceroute
}
