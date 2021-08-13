#!/usr/bin/env bash

##################################################
## Copyright 2019 Avaloq Evolution AG
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## https://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##################################################

# Stop running containers
for runcon in $(docker ps --filter status=running -q)
do
  [[ $(($(date '+%s') - $(date --date=$(docker inspect -f {{.State.StartedAt}} $runcon) +"%s"))) -gt 43200 ]] && docker stop $runcon 2>&1 >/dev/null
done

# Cleanup 
docker rm $(docker ps -aq 2>/dev/null) 2>/dev/null
docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
docker rmi $(docker images --digests 2>/dev/null | grep -E " (years|months|days|weeks|[1-9][0-9] hours) ago" | awk '{ print $1 "@" $3}') 2>/dev/null
docker rmi $(docker images --digests 2>/dev/null | grep -E " (years|months|days|weeks|[1-9][0-9] hours) ago" | awk '{ print $1 ":" $2}') 2>/dev/null
docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
docker volume rm $(docker volume ls -qf dangling=true 2>/dev/null) 2>/dev/null

exit 0
