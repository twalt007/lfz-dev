command -v docker-compose > /dev/null 2>&1 || {
  echo -e "\nCould not find the required Docker commands."
  echo -e "Be sure to install Docker before trying again."
  echo -e "Aborting..."
  exit 1
}

desktop_path="$HOME/Desktop"
lfz_path="$desktop_path/lfz"

if [ ! -d $lfz_path ]; then
  echo -e "\nNo lfz folder found on your Desktop!"
  echo -e "Be sure it exists before trying again."
  echo -e "Aborting..."
  exit 1
fi

local_bin_path="$HOME/.local/bin"
bash_profile_path="$HOME/.bash_profile"

touch $bash_profile_path
mkdir -p $local_bin_path

if [ $(grep -c 'export PATH="\$PATH:\$HOME/.local/bin"' $bash_profile_path) -eq "0" ]; then
  echo -e '\nexport PATH="$PATH:$HOME/.local/bin"' >> $bash_profile_path
fi

lfz_dev_path="$desktop_path/lfz-dev"

cp -R $lfz_dev_path/__env__ $lfz_dev_path/*.php $lfz_path/

compose_file_path="$lfz_path/__env__/docker/lfz/docker-compose.yml"

cat $(dirname $BASH_SOURCE)/lfz-dev.bash > $local_bin_path/lfz-dev
cat $(dirname $BASH_SOURCE)/lfz-dev-stop.bash > $local_bin_path/lfz-dev-stop
chmod +x $local_bin_path/lfz-dev*

sleep 1

echo -e "\nGetting things started. This may take a while!"

sleep 1

docker-compose -f $compose_file_path build > $desktop_path/lfz-dev-install.log && \
echo -e '\nDone!'
