announce() {
  echo -e "\n\n\n\n\n"
  echo $1
  echo -e "\n\n\n\n\n"
  sleep 2;
}

mkdir -p /home/dev/.local

dir=$(dirname $BASH_SOURCE)

announce "Installing HTTP clients..."
source $dir/install-network-tools.bash

announce "Installing Git..."
source $dir/install-git.bash

announce "Installing MySQL..."
source $dir/install-mysql.bash

announce "Installing Apache and phpMyAdmin..."
source $dir/install-phpmyadmin.bash

announce "Installing Node.js..."
source $dir/install-node.bash

chown -R dev:dev /home/dev
