# Ansible role '*avaloq.acpr-ocp4-upgrade-cluster*'

Upgrade OpenShift4 cluster.

Tasks that:
* Set correct upgrade channel
* Verify release checksum existence (disconnected only)
* Initiate cluster upgrade

## Requirements

* Ansible > 2.9

## Role variables

|ACPR configuration variable          |Role variable name             |Description                                    |Default       |
|-------------------------------------|-------------------------------|-----------------------------------------------|--------------|
|`cust_os_channel`                    |`acpr_os_channel`              |OpenShift upgrade channel                      |_stable_      |
|`cust_os_release`                    |`acpr_os_release`              |OpenShift version                              |              |
|`cust_redhat_disconnected`           |`acpr_redhat_disconnected`     |If cluster is disconnected from Red Hat        |_true__       |
|`cust_registry_location`             |`acpr_registry_location`       |Primary OpenShift 4 registry location          |              |
