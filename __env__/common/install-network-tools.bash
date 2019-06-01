function install-network-tools() {

  apt-get install -y \
    curl \
    httpie \
    telnet \
    iputils-ping \
    traceroute
}
