docker_compose_path="/Users/$(whoami)/Desktop/lfz/__env__/docker/lfz/docker-compose.yml"
local="/Users/$(whoami)/.local"

echo -e "\n\n\n\n\n\n"
mkdir -p $local
echo "docker-compose -f $docker_compose_path up -d && docker-compose -f $docker_compose_path exec dev /bin/bash" > $local/bin/lfz-dev
chmod +x $local/bin/lfz-dev
docker-compose -f $docker_compose_path build
