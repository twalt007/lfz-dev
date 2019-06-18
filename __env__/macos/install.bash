command -v docker-compose > /dev/null 2>&1 || {
  echo -e "\nCould not find the required Docker commands."
  echo -e "Be sure to install Docker before trying again."
  echo -e "Aborting..."
  exit 1
}

lfz_path="$HOME/lfz"
local_bin_path="$HOME/.local/bin"
bash_profile_path="$HOME/.bash_profile"

touch $bash_profile_path
mkdir -p $local_bin_path
mkdir -p $lfz_path

if [ $(grep -c 'export PATH="\$PATH:\$HOME/.local/bin"' $bash_profile_path) -eq "0" ]; then
  echo -e '\nexport PATH="$PATH:$HOME/.local/bin"' >> $bash_profile_path
fi

desktop_path="$HOME/Desktop"
lfz_dev_path="$desktop_path/lfz-dev"

cp -R $lfz_dev_path/__env__ $lfz_dev_path/*.php $lfz_path/

compose_file_path="$lfz_path/__env__/docker/lfz/docker-compose.yml"

cat $(dirname $BASH_SOURCE)/lfz-dev.bash > $local_bin_path/lfz-dev
cat $(dirname $BASH_SOURCE)/lfz-dev-stop.bash > $local_bin_path/lfz-dev-stop
cat $(dirname $BASH_SOURCE)/lfz-dev-uninstall.bash > $local_bin_path/lfz-dev-uninstall
chmod +x $local_bin_path/lfz-dev*

cat << EOF > $HOME/lfz/__env__/docker/lfz/docker-compose.yml

version: '3.7'

services:
  dev:
    build:
      context: ../../
      dockerfile: docker/lfz/Dockerfile
    container_name: dev
    stdin_open: true
    tty: true
    hostname: localhost
    ports:
      - 80:80
      - 443:443
      - 3000:3000
      - 3001:3001
    volumes:
      - dev_home:/home/dev/
      - dev_data:/var/lib/mysql/
      - dev_web:/etc/apache2/
      - dev_php:/etc/php/
      - $HOME/Desktop:/home/dev/Desktop
      - $HOME/lfz:/home/dev/lfz
    command: ["tail", "-f", "/dev/null"]

volumes:
  dev_web:
  dev_php:
  dev_data:
  dev_home:

EOF

sleep 1

echo -e '\n\n\n\n\n'
echo "Getting things started. This may take a while!"
echo -e '\n\n\n\n\n'

sleep 2

docker-compose -f $compose_file_path build 2>&1 | tee $desktop_path/lfz-dev-install.log

if [ ${PIPESTATUS[0]} -eq 0 ]; then
  mv "$lfz_dev_path" "$lfz_path/lfz-dev"
  mv "$desktop_path/lfz-dev-install.log" "$lfz_path/lfz-dev-install.log"
  echo -e '\nDone!\nDevelopment environment setup succeeded!\n'
  exit 0
fi

echo -e '\nDevelopment environment setup failed :(\n'
exit 1
