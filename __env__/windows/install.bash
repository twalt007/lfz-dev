windows_home="$(wslpath "$(/mnt/c/Windows/System32/cmd.exe /C "echo %USERPROFILE%")" | tr -d '\r')"
desktop_path="$windows_home/Desktop"
lfz_dev_path="$desktop_path/lfz-dev"

if [ ! -d $desktop_path ]; then
  desktop_path="$windows_home/OneDrive/Desktop"
  lfz_dev_path="$desktop_path/lfz-dev"
fi

cp /etc/skel/.bashrc .bashrc
cat << EOF >> /home/dev/.bashrc

export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_ALL='en_US.UTF-8'

EOF

mkdir -p "$windows_home/lfz"
rm -f /home/dev/lfz
ln -sf "$windows_home/lfz" /home/dev/lfz
rm -f /home/dev/Desktop
ln -sf "$desktop_path" /home/dev/Desktop
cp /home/dev/Desktop/lfz-dev/*.php /home/dev/lfz
cp /home/dev/Desktop/lfz-dev/*.html /home/dev/lfz
mkdir -p /tmp/setup
cp /home/dev/Desktop/lfz-dev/__env__/common/*.bash /tmp/setup

sleep 1

desktop_path=/home/dev/Desktop

sudo echo -e "\nGetting things started. This may take a while!\n"

sleep 1

sudo apt-get -qq update && \
sudo apt-get -y install --reinstall \
  locales \
  nano \
  bash-completion \
  sudo 2>&1 | tee "$desktop_path/lfz-dev-install.log" && \
sudo apt-get -y autoremove

if [ ${PIPESTATUS[0]} -ne 0 ]; then
  echo -e '\nDevelopment environment setup failed :(\n'
  exit 1
fi

sudo -u root bash -c "echo 'dev ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/dev" && \
sudo chmod 440 /etc/sudoers.d/dev

sudo bash /tmp/setup/install.bash 2>&1 | tee -a "$desktop_path/lfz-dev-install.log"

if [ ${PIPESTATUS[0]} -eq 0 ]; then
  echo -e '\nDone!\nDevelopment environment setup succeeded!\n'
  exit 0
fi

echo -e '\nDevelopment environment setup failed :(\n'
exit 1
