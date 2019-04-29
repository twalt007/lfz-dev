windows_home="$(echo $(wslpath $(/mnt/c/Windows/System32/cmd.exe /C "echo %USERPROFILE%")) | tr -d '\r')"

sleep 1

echo -e "\nGetting things started. This may take a while!"

apt-get -qq update && \
apt-get install -y --reinstall \
  locales \
  nano \
  sudo \
  telnet > $windows_home/Desktop/lfz-dev-install.log 2>&1 && \
  echo "dev ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/dev && \
  chmod 440 /etc/sudoers.d/dev

cat << EOF >> /home/dev/.bashrc

export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_ALL='en_US.UTF-8'

EOF

mkdir -p $windows_home/lfz
ln -s $windows_home/lfz /home/dev/lfz
ln -s $windows_home/Desktop /home/dev/Desktop
cp $windows_home/Desktop/lfz-dev/*.php $windows_home/lfz/

mkdir -p /tmp/setup
cp /home/dev/Desktop/lfz-dev/__env__/common/*.bash /tmp/setup
cp /home/dev/Desktop/lfz-dev/__env__/common/mcrypt.so /tmp/setup

mkdir -p /usr/lib/php/20170718
mv /tmp/setup/mcrypt.so /usr/lib/php/20170718/mcrypt.so

bash /tmp/setup/install.bash >> $windows_home/Desktop/lfz-dev-install.log 2>&1 && \
echo -e '\nDone!'
