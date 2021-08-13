#!/bin/bash

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

set -e

usage(){
  echo "$0 [path]"
  echo "  path  The directory where the backup will be stored"
  echo "        /backup/\$(hostname)/\$(date +%Y%m%d) by default"
  echo "Examples:"
  echo "    $0 /my/mountpoint/\$(hostname)"
}

etcdctl3() {
  cmd="ETCDCTL_API=3 etcdctl --cert /etc/etcd/peer.crt --key /etc/etcd/peer.key --cacert /etc/etcd/ca.crt --endpoints https://`hostname`:2379 ${@}"
  if [[ -f /usr/local/bin/master-exec ]]; then
    /usr/local/bin/master-exec etcd etcd /bin/sh -c "$cmd"
  else
    /bin/sh -c "$cmd"
  fi
}

backup_etcd_config() {
  echo "Exporting etcd configuration and certificates ${BACKUPLOCATION}"
  cp -aRp /etc/etcd/  ${BACKUPLOCATION}/etc/
}

backup_etcd_v3(){
  mkdir -p ${BACKUPLOCATION}/etcd_data/
  echo "Exporting etcd (v3) data  ${BACKUPLOCATION}"
  export $(grep ^ETCD_LISTEN_CLIENT_URLS /etc/etcd/etcd.conf )
  etcdctl3 --cert=/etc/etcd/peer.crt --key=/etc/etcd/peer.key --cacert=/etc/etcd/ca.crt \
  --endpoints=${ETCD_LISTEN_CLIENT_URLS} snapshot save /var/lib/etcd/snapshot.db
  mv /var/lib/etcd/snapshot.db ${BACKUPLOCATION}/etcd_data/db
}

if [[ ( $@ == "--help") ||  $@ == "-h" ]]
then
  usage
  exit 0
fi

BACKUPLOCATION=${1:-"/backup/$(hostname)/$(date +%Y%m%d)"}
mkdir -p ${BACKUPLOCATION}

backup_etcd_config
backup_etcd_v3

exit 0
