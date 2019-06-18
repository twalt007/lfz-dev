windows_home="$(wslpath "$(/mnt/c/Windows/System32/cmd.exe /C "echo %USERPROFILE%")" | tr -d '\r')"
desktop_path="$windows_home/Desktop"

sleep 1

echo -e "\nGetting things started. This may take a while!\n"

sleep 1

apt-get -qq update && \
apt-get install -y --reinstall \
  locales \
  nano \
  bash-completion \
  sudo 2>&1 | tee "$desktop_path/lfz-dev-install.log"

if [ ${PIPESTATUS[0]} -ne 0 ]; then
  echo -e '\nDevelopment environment setup failed :(\n'
  exit 1
fi

echo "dev ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/dev
chmod 440 /etc/sudoers.d/dev

cat << EOF >> /home/dev/.bashrc

export LANG='en_US.UTF-8'
export LANGUAGE='en_US:en'
export LC_ALL='en_US.UTF-8'

EOF

mkdir -p "$windows_home/lfz"
chown -R dev:dev "$windows_home/lfz"
ln -sf "$windows_home/lfz" /home/dev/lfz
ln -sf "$desktop_path" /home/dev/Desktop
cp /home/dev/Desktop/lfz-dev/*.php "$windows_home/lfz/"

mkdir -p /tmp/setup
cp /home/dev/Desktop/lfz-dev/__env__/common/*.bash /tmp/setup

bash /tmp/setup/install.bash 2>&1 | tee -a "$desktop_path/lfz-dev-install.log"

if [ ${PIPESTATUS[0]} -eq 0 ]; then
  mv "$desktop_path/lfz-dev" "$windows_home/lfz/lfz-dev"
  mv "$desktop_path/lfz-dev-install.log" "$windows_home/lfz/lfz-dev-install.log"
  echo -e '\nDone!\nDevelopment environment setup succeeded!\n'
  exit 0
fi

echo -e '\nDevelopment environment setup failed :(\n'
exit 1
