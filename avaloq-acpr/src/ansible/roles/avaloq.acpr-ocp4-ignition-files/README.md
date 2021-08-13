# Ansible role '*avaloq.acpr-ocp4-configure-administration-host*'

Manage OpenShift4 ignition files, initial version.

## Requirements

* Ansible > 2.9

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

## Role variables

Below is a list of all currently supported variables.

### Required variables

|ACPR configuration variable       |Role variable name                 |Description                                                                                                              |Default  |
|----------------------------------|-----------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------- |
|`cust_os_cluster_name`            |`os_cluster_name`                  |Fully Qualified Domain Name (FQDN) where the cluster will be externally available for console and API communication      |         |                                                                                       |
|`cust_os_def_subdomain`           |`acpr_os_def_subdomain`            |Domain where routes are exposed                                                                                          |         |      
|`cust_pull_secret`                |`acpr_pull_secret`                 |OpenShift official secret used to pull images                                                                            |         |
|`cust_ssh_publickey`              |`acpr_ssh_publickey`               |SSH key for initial login                                                                                                |         |

### Optional variables

|ACPR configuration variable       |Role variable name                 |Description                                                               |Default       |
|----------------------------------|-----------------------------------|--------------------------------------------------------------------------|--------------|
|`cust_serve_ignition_files`       |`acpr_serve_ignition_files`        |If set to true, ignition files are served by webserver                    |_False_       |
|`cust_http_proxy`                 |`acpr_docker_http_proxy`           |HTTP proxy server                                                         |              |
|`cust_https_proxy`                |`acpr_docker_https_proxy`          |HTTPS proxy server                                                        |              |
|`cust_no_proxy`                   |`acpr_docker_no_proxy`             |List of systems, domains, IPs which will not use the defined proxy server |              |
|`cust_cluster_nodes`              |`acpr_cluster_nodes`               |List of nodes belong to the cluster                                       |              |
|`cust_clus_net_cidr`              |`acpr_clus_net_cidr`               |CIDR block the Software Defined Network (SDN) will use.                   |10.224.0.0/16 |
|`cust_clus_subnet_length`         |`acpr_clus_subnet_length`          |Size of the Software Defined Network (SDN) subnet assigned to each host   |9             |
|`cust_registry_location`          |`acpr_registry_location`           |OpenShift container images registry URL used for OpenShift                |              |

## Usage examples

Usage within a playbook:

```yaml
- name: Do some stuff
  hosts: localhost
  become: true
  roles:
  - role: avaloq.acpr-ocp4-ignition-files
```
