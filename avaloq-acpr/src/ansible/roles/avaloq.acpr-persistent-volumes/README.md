# Ansible role '*avaloq.acpr-persistent-volumes*'

Generate and deploy Persistent Volume (PV) objects in ACPR OpenShift.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation
* Provisioned storage mount points (ex. using '*avaloq.acpr-storage-nfs*' Ansible role)

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

None.

## Role variables

| Parameter                          | Description                                                    | Default         |
|------------------------------------|----------------------------------------------------------------|-----------------|
| *`acpr_nfs_shares_directory_path`* | Directory path where NFS shares are saved                      | _/srv/nfs_      |
| `acpr_pv_definitions` *            | List of PV definitions defined via the ACPR configuration file |                 |
| `pv_mount_options` *               | List of mount options for NFS based persistent storage         | _['hard','rw']_ |

*See [https://docs.avaloq.com/acpr]() under the *ACPR OpenShift configuration and installation* topic.

## Overriding the default mount options

Use the *--extra-vars* command line option of *ansible-playbook* to override the default NFS mount options.
For example, to specify soft mount and read-only:
```bash
 ansible-playbook -e '{ "pv_mount_options": ["soft", "ro"]}'  playbooks/acpr-220-deploy-persistent-volumes.yml
```

## Usage examples

Usage within a playbook:

```yaml
- hosts: localhost
  become: no
  gather_facts: no
  roles:
  - role: avaloq.acpr-persistent-volumes
```
