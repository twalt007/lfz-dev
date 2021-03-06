__dirname=$(dirname $BASH_SOURCE)
source $__dirname/install-git.bash
source $__dirname/install-network-tools.bash
source $__dirname/install-mysql.bash
source $__dirname/install-phpmyadmin.bash
source $__dirname/install-node.bash
source $__dirname/install-postgres.bash
source $__dirname/install-nginx.bash

function announce() {
  echo -e '\n\n\n\n\n'
  echo "Setting up $1..."
  echo -e '\n\n\n\n\n'
  sleep 2
}

function bail() {
  echo "Failed to set up $1... exiting." 1>&2
  exit 1
}

apt-get -qq update

mkdir -p /home/dev/.local

announce "network tools" && install-network-tools || bail "network tools"

announce "Git" && install-git || bail "Git"

announce "MySQL" && install-mysql || bail "MySQL"

announce "PostgreSQL" && install-postgres || bail "PostgreSQL"

announce "Apache and phpMyAdmin" && install-phpmyadmin || bail "Apache and phpMyAdmin"

announce "Node.js" && install-node || bail "Node.js"

announce "Nginx" && install-nginx || bail "Nginx"

chown -R dev:dev /home/dev
