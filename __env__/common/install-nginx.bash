function install-nginx() {

  apt-get -y install \
    nginx \
    php7.2-fpm && \

  cat << EOF > /etc/nginx/sites-available/default
server {
  server_name _;
  listen 80 default_server;
  listen [::]:80 default_server;
  root /home/dev/lfz;
  location / {
    try_files \$uri \$uri/ =404;
  }
  location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/run/php/php7.2-fpm.sock;
  }
}

EOF
}
