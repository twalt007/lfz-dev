#!/bin/bash

compose_file_path="$HOME/lfz/__env__/docker/lfz/docker-compose.yml"

docker-compose -f $compose_file_path down
