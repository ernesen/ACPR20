# Ansible role '*avaloq.acpr-backup*'

Creates a backup of the current configuration and state of an ACPR compliant OpenShift
cluster.

Namely backup of:
- Relevant master nodes configuration files, including *etcd* configuration files
- OpenShift cluster state snapshot (*etcd* data)

From the backup it is possible to recover from:
- The loss of the master nodes
- The loss of *etcd* data
- The loss of CA and private keys

Backup is stored in the form of _tar_ archives in the Administration host.

> **NOTE**: The role does not backup any data managed by running containers.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation
* *etcdctl* binary on master nodes (part of ACPR installation)

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

None.

## Role variables

|ACPR configuration variable |Role variable name |Description                                                                               | Default                                      |
|----------------------------|-------------------|------------------------------------------------------------------------------------------|----------------------------------------------|
|                            |`backup_dir`       | Backup destination and base folder name on the Administraion host                        | *{{ home_folder }}/acpr-backup/acpr-backup-* |
|                            |`ose_version`      | The major version of the OpenShift cluster. This decides which node backup script to use | *3*                                          |
|                            |`retention_days`   | Number of days older backups will be kept (*-1*: unlimited)                              | *-1*                                         |
|                            |`temp_backup_dir`  | Base name of the temporary backup directory                                              | */tmp/{{ ansible_nodename }}-*               |

## Usage examples

Usage within a playbook to backup the entire OpenShift platform state:

```yaml
- name: ACPR | Backup OpenShift platform
  hosts: all
  roles:
    - role: avaloq.acpr-backup
```

Usage within a playbook to backup the entire OpenShift platform state and remove backups
older than3 days:

```yaml
- name: ACPR | Backup OpenShift platform
  hosts: all
  vars:
    retention_days: 3
  roles:
    - role: avaloq.acpr-backup
```
