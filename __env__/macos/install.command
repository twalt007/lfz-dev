echo -e "\n\n\n\n\n\n\n"
lfz_path="/Users/$(whoami)/Desktop/lfz"
setup_path="/Users/$(whoami)/Desktop/student-dev-env"

cp -R $setup_path/. $lfz_path/

docker_compose_path="$lfz_path/__env__/docker/lfz/docker-compose.yml"
local="/Users/$(whoami)/.local"

mkdir -p $local
echo "docker-compose -f $docker_compose_path up -d && docker-compose -f $docker_compose_path exec dev /bin/bash" > $local/bin/lfz-dev
chmod +x $local/bin/lfz-dev
docker-compose -f $docker_compose_path build
