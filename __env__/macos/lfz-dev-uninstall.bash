#!/bin/bash

desktop_path="$HOME/Desktop"
lfz_path="$desktop_path/lfz"

compose_file_path="$lfz_path/__env__/docker/lfz/docker-compose.yml"

docker-compose -f $compose_file_path down -v --rmi all

rm -rf $lfz_path/__env__ $lfz_path/index.php $lfz_path/info.php

local_bin_path="$HOME/.local/bin"

rm $local_bin_path/lfz*

echo -e "\nlfz-dev has been uninstalled!"
echo -e "You can remove Docker from your Applications now."
