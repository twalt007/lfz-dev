#!/bin/bash

compose_file_path="$HOME/Desktop/lfz/__env__/docker/lfz/docker-compose.yml"

docker-compose -f $compose_file_path up -d &&
docker-compose -f $compose_file_path exec dev /bin/bash -l
