desktop_path="/Users/$(whoami)/Desktop"
lfz_path="$desktop_path/lfz"
setup_path="$desktop_path/lfz-dev"
docker_compose_path="$lfz_path/__env__/docker/lfz/docker-compose.yml"
local_bin="/Users/$(whoami)/.local/bin"

if [ ! -d $lfz_path ]; then
  echo -e "\nNo lfz folder found on your Desktop!"
  echo -e "Be sure to it exists before trying again."
  echo -e "Aborting..."
  exit 1
fi
