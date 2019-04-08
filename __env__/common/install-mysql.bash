echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
DEBIAN_FRONTEND=noninteractive apt-get -yq install \
  mysql-server=5.7.25-0ubuntu0.18.04.2 && \
usermod -d /var/run/mysqld/ mysql
