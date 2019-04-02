fix-phpmyadmin() {
  # count(): Parameter must be an array or an object that implements Countable
  # https://stackoverflow.com/questions/48001569/phpmyadmin-count-parameter-must-be-an-array-or-an-object-that-implements-co/50536059
  sed -i "s/count(\$analyzed_sql_results\['select_expr'\]/(count(\$analyzed_sql_results['select_expr'])/g" /usr/share/phpmyadmin/libraries/sql.lib.php
}

fix-apache2() {
  # The TCP_DEFER_ACCEPT socket option is not natively supported by Windows
  # https://github.com/Microsoft/WSL/issues/1953
  echo "AcceptFilter http none" >> /etc/apache2/apache2.conf && \
  echo "AcceptFilter https none" >> /etc/apache2/apache2.conf
}

service mysql start && \
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections && \
echo "phpmyadmin phpmyadmin/mysql/admin-pass password root" | debconf-set-selections && \
echo "phpmyadmin phpmyadmin/mysql/app-pass password root" | debconf-set-selections && \
echo "phpmyadmin phpmyadmin/app-password-confirm password root" | debconf-set-selections && \
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections && \
DEBIAN_FRONTEND=noninteractive apt-get -yq install \
  libmcrypt-dev=2.5.8-3.3 \
  phpmyadmin=4:4.6.6-5 && \
service mysql stop && \
fix-phpmyadmin && \
fix-apache2 && \
echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
echo "error_reporting = E_ALL" >> /etc/php/7.2/apache2/php.ini && \
echo "display_errors = On" >> /etc/php/7.2/apache2/php.ini && \
sudo bash -c "echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/cli/conf.d/mcrypt.ini" && \
sudo bash -c "echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/apache2/conf.d/mcrypt.ini" && \
rm -rf /var/www/html/ && \
ln -s /home/dev/lfz /var/www/html
