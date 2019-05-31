windows_home="$(echo $(wslpath $(/mnt/c/Windows/System32/cmd.exe /C "echo %USERPROFILE%")) | tr -d '\r')"
desktop_path="$windows_home/Desktop"

sleep 1

echo -e "\nGetting things started. This may take a while!"

apt-get -qq update && \
apt-get install -y --reinstall \
  locales \
  nano \
  bash-completion \
  sudo > $desktop_path/lfz-dev-install.log 2>&1 && \
  echo "dev ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/dev && \
  chmod 440 /etc/sudoers.d/dev

cat << EOF >> /home/dev/.bashrc

export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_ALL='en_US.UTF-8'

EOF

mkdir -p $windows_home/lfz
ln -s $windows_home/lfz /home/dev/lfz
ln -s $desktop_path /home/dev/Desktop
cp $desktop_path/lfz-dev/*.php $windows_home/lfz/

mkdir -p /tmp/setup
cp /home/dev/Desktop/lfz-dev/__env__/common/*.bash /tmp/setup

mkdir -p /usr/lib/php/20170718

bash /tmp/setup/install.bash 2>&1 | tee $desktop_path/lfz-dev-install.log

if [ ${PIPESTATUS[0]} -eq 0 ]; then
  echo -e '\nDone!\nDevelopment environment setup succeeded!\n'
  exit 0
fi

echo -e '\nDevelopment environment setup failed :(\n'
exit 1
