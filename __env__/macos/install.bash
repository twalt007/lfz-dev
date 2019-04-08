desktop_path="/Users/$(whoami)/Desktop"
lfz_path="$desktop_path/lfz"
setup_path="$desktop_path/student-dev-env"
docker_compose_path="$lfz_path/__env__/docker/lfz/docker-compose.yml"
local_bin="/Users/$(whoami)/.local/bin"

if [ ! -d $lfz_path ]; then
  echo -e "\nNo lfz folder found on your Desktop!"
  echo -e "Be sure to it exists before trying again."
  echo -e "Aborting..."
  exit 1
fi

command -v docker-compose >/dev/null 2>&1 || {
  echo -e "\nCould not find the required Docker commands."
  echo -e "Be sure to install Docker before trying again."
  echo -e "Aborting..."
  exit 1
}

cp -R $setup_path/__env__ $lfz_path/__env__ && \
cp $setup_path/*.php $lfz_path/ && \
mkdir -p $local_bin && \
echo "docker-compose -f $docker_compose_path up -d && docker-compose -f $docker_compose_path exec dev /bin/bash -l" > $local_bin/lfz-dev && \
chmod +x $local_bin/lfz-dev && \
echo -e '\nexport $PATH=$HOME/.local/bin:$PATH' >> /Users/$(whoami)/.bash_profile && \
sleep 1 && \
echo -e "\nGetting things started. This may take a while!" && \
sleep 1 && \
docker-compose -f $docker_compose_path build > $desktop_path/lfz_dev_install.log && \
echo -e '\nDone!'
