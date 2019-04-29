echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
DEBIAN_FRONTEND=noninteractive apt-get -yq install \
  mysql-server && \
usermod -d /var/run/mysqld/ mysql
