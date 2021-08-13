# Ansible role '*avaloq.acpr-inventory*'

Generate Avaloq Container Platform Reference (ACPR) OpenShift inventory file.

## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation. Refer to the following table for further
details:

|Task file               |Block/Task name             |Description                                                            |
|------------------------|----------------------------|-----------------------------------------------------------------------|
|_generate-htpasswd.yml_ |_install required packages_ |Installs python dependencies required to generate passwords            |

### Dependencies

* Ansible role '*avaloq.acpr-status*'

## Role variables

Defined via the ACPR configuration file (see https://docs.avaloq.com/acpr under the
*ACPR OpenShift configuration and installation* topic).

|Role variable       |Description                                                                               |Default                                          |
|--------------------|------------------------------------------------------------------------------------------|-------------------------------------------------|
|`cust_cluster_name` |Filename of the ACPR configuration file `avaloq-acpr/src/acpr/$\{cust_cluster_name}.yml`  |                                                 |
|`cust_invt_file`    |Generated inventory destination file path (directory must exist)                          | *{{ playbook_dir }}/../inventory/ansible-hosts* |

## Usage examples

From the command line to generate an ACPR compliant OpenShift Ansible inventory file:

```bash
cd ${path-to-repository-root-folder}/avaloq-acpr/src/ansible <1>
ansible-playbook playbooks/acpr-110-generate-inventory.yml \
  -e cust_cluster_name=${cust_cluster_name} \ <2>
  -e cust_invt_file=${path_to_inventory} <3>
```

1. Working directory
2. The value of the `cust_cluster_name` parameter is the filename of the ACPR
   configuration file `acpr/$\{cust_cluster_name}.yml`.
3. The value of the `path_to_inventory` parameter represents the path to the file where
   the generated ACPR-compliant Ansible inventory file is written. This value is also used
   as parameter for all Ansible playbook executions (that is, `-i ${path_to_inventory}`).
