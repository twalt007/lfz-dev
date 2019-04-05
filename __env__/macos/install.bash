desktop_path="/Users/$(whoami)/Desktop"
lfz_path="$desktop_path/lfz"
setup_path="$desktop_path/student-dev-env"
docker_compose_path="$lfz_path/__env__/docker/lfz/docker-compose.yml"
local_bin="/Users/$(whoami)/.local/bin"

cp -R $setup_path/__env__ $lfz_path/__env__ && \
cp $setup_path/*.php $lfz_path/ && \
mkdir -p $local_bin && \
echo "docker-compose -f $docker_compose_path up -d && docker-compose -f $docker_compose_path exec dev /bin/bash" > $local_bin/lfz-dev && \
chmod +x $local_bin/lfz-dev && \
docker-compose -f $docker_compose_path build > $desktop_path/lfz_dev_install.log
