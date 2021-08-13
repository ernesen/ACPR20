#!/usr/bin/bash
# Copyright 2019 Avaloq Licence AG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -euo pipefail

main() {

cat << EOF > /etc/yum.repos.d/acpr.repo 
[AcprRhel7Ansible26]
baseurl = ${BASEURL}/remote-rpms-acpr-rhel-7-server-ansible-2.6
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
name = ACPR Red Hat Ansible Engine 2.6 (RPMs) for RHEL7
password = $PASSWORD
username = $USERNAME
proxy = ${PROXY}
proxy_username = ${PROXY_USERNAME}
proxy_password = ${PROXY_PASSWORD}

[AcprOpenShift311]
baseurl = ${BASEURL}/remote-rpms-acpr-rhel-7-server-ose-3.11
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
name = ACPR Red Hat OpenShift Container Platform 3.11 (RPMs)
password = ${PASSWORD}
username = ${USERNAME}
proxy = ${PROXY}
proxy_username = ${PROXY_USERNAME}
proxy_password = ${PROXY_PASSWORD}

[AcprRhel7Server]
baseurl = ${BASEURL}/remote-rpms-acpr-rhel-7-server
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
name = ACPR Red Hat Enterprise Linux 7 Server (RPMs)
password = ${PASSWORD}
username = ${USERNAME}
proxy = ${PROXY}
proxy_username = ${PROXY_USERNAME}
proxy_password = ${PROXY_PASSWORD}

[AcprRhel7ServerExtras]
baseurl = ${BASEURL}/remote-rpms-acpr-rhel-7-server-extras
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
name = ACPR Red Hat Enterprise Linux 7 Server - Extras (RPMs)
password = ${PASSWORD}
username = ${USERNAME}
proxy = ${PROXY}
proxy_username = ${PROXY_USERNAME}
proxy_password = ${PROXY_PASSWORD}
EOF

yum clean all
yum --disablerepo="*" --enablerepo="Acpr*" check-update
yum --disablerepo="*" --enablerepo="Acpr*" -y install ansible
}

usage() {
    echo -e "Usage: $0 [OPTION]..."
    echo -e "\t  -h\t\t\tShow this help"
    echo -e "\t  -u, --user\t\tUsername to use for basic authentication to the repo (default: None)"
    echo -e "\t  -p, --password\tPassword to use with the username for basic authentication (default: None)"
    echo -e "\t      --baseurl\t\tBaseurl of the repository (default: https://repository.service.avaloq.com/rpm)"
    echo -e "\t      --proxy\t\tUse http proxy (default: None)"
    echo -e "\t      --proxy-user\tUsername to use for proxy authentication (default: None)"
    echo -e "\t      --proxy-password\tPassword to use with proxy-user for proxy authentication (default: None)"
}

# main script
BASEURL='https://repository.service.avaloq.com/rpm'
USERNAME=''
PASSWORD=''
PROXY='_none_'
PROXY_USERNAME=''
PROXY_PASSWORD=''

TEMP=$(getopt -o hu:p:b --long help,user:,password:,baseurl:,proxy:,proxy-user:,proxy-password: -- "$@")

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

eval set -- "$TEMP"

while true ; do 
  case "$1" in
    -h|--help) usage ; shift ;;
    -u|--user) USERNAME=$2 ; shift 2;;
    -p|--password) PASSWORD=$2 ; shift 2;;
    --baseurl) BASEURL=$2 ; shift 2;;
    --proxy) PROXY=$2 ; shift 2;;
    --proxy-user) PROXY_USERNAME=$2 ; shift 2;;
    --proxy-password) PROXY_PASSWORD=$2 ; shift 2;;
    --) shift ; break ;;
    ?) usage ; shift;;
  esac
done

main
