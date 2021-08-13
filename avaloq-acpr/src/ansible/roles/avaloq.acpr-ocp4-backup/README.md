# Ansible role '*avaloq.acpr-ocp4-backup*'

Creates a backup of the current configuration and state of an ACPR compliant OpenShift
4 cluster.

Namely backup of:
- etcd snapshot
- static pods resources, including etcd encryption keys

From the backup it is possible to recover from:
- The loss of *etcd* data

Backup is stored in the form of _tar_ archives in the Administration host.

> **NOTE**: The role does not backup any data managed by running containers.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift 4 installation

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

None.

## Role variables

|ACPR configuration variable |Role variable name              |Description                                                                               | Default                                      |
|----------------------------|--------------------------------|------------------------------------------------------------------------------------------|----------------------------------------------|
|cust_backup_node_ssh_key    |`acpr_backup_node_ssh_key`      | Private key of core user                                                                 |                                              |
|                            |`acpr_backup_node_ssh_key_path` | Path to private key of core user                                                         | *~/.ssh/core.id_rsa*                         |
|                            |`backup_dir`                    | Backup destination and base folder name on the Administraion host                        | *{{ home_folder }}/acpr-backup/acpr-backup-* |
|                            |`retention_days`                | Number of days older backups will be kept (*-1*: unlimited)                              | *-1*                                         |
|                            |`temp_backup_dir`               | Base name of the temporary backup directory                                              | */tmp/{{ ansible_nodename }}-*               |

## Usage examples

Usage within a playbook to backup the entire OpenShift platform state:

```yaml
- name: ACPR | Backup OpenShift platform
  hosts: all
  roles:
    - role: avaloq.acpr-ocp4-backup
```

Usage within a playbook to backup the entire OpenShift platform state and remove backups
older than 3 days:

```yaml
- name: ACPR | Backup OpenShift platform
  hosts: all
  vars:
    retention_days: 3
  roles:
    - role: avaloq.acpr-ocp4-backup
```
