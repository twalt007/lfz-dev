fix-phpmyadmin() {
  # count(): Parameter must be an array or an object that implements Countable
  # https://stackoverflow.com/questions/48001569/phpmyadmin-count-parameter-must-be-an-array-or-an-object-that-implements-co/50536059
  sed -i "s/count(\$analyzed_sql_results\['select_expr'\]/(count(\$analyzed_sql_results['select_expr'])/g" /usr/share/phpmyadmin/libraries/sql.lib.php
  # https://medium.com/@chaloemphonthipkasorn/%E0%B9%81%E0%B8%81%E0%B9%89-bug-phpmyadmin-php7-2-ubuntu-16-04-92b287090b01
  sed -i "s/count(\$options/count((array)\$options/g" /usr/share/phpmyadmin/libraries/plugin_interface.lib.php
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
  libmcrypt-dev \
  phpmyadmin && \
service mysql stop && \
fix-phpmyadmin && \
fix-apache2 && \
echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf && \
echo "error_reporting = E_ALL" >> /etc/php/7.2/apache2/php.ini && \
echo "display_errors = On" >> /etc/php/7.2/apache2/php.ini && \
echo "extension=/usr/lib/php/20170718/mcrypt.so" > /etc/php/7.2/cli/conf.d/mcrypt.ini && \
echo "extension=/usr/lib/php/20170718/mcrypt.so" > /etc/php/7.2/apache2/conf.d/mcrypt.ini && \
a2enmod rewrite && \
cat << EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>

  ServerName localhost
  ServerAdmin webmaster@localhost
  DocumentRoot /home/dev/lfz

  <Directory /home/dev/lfz/>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
  </Directory>

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
