function install-mysql() {

  echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
  echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    mysql-server && \
  usermod -d /var/run/mysqld/ mysql && \
  service mysql start && \
  echo "bind-address            = 0.0.0.0" >> /etc/mysql/mysql.conf.d/mysqld.cnf && \
  mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;" && \
  service mysql stop
}
