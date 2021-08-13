# Ansible role '*avaloq.acpr-storage-nfs*'

Set-up Network File System (NFS) storage.

This includes:
* Create one NFS share on the NFS server for each persistent volume 
  defined by the variable `acpr_pv_definitions`
* Export the NFS shares, so that PV objects, which act as NFS clients,  
  can access the NFS shares

Optionally:
*  Delete data on existing PVs without destroying the PV or PVC

## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

None.

## Role variables

| Parameter                          | Description                                                    | Default    |
|------------------------------------|----------------------------------------------------------------|------------|
| *`acpr_nfs_shares_directory_path`* | Directory path where NFS shares are saved                       | _/srv/nfs_ |
| *`acpr_pv_definitions`*            | List of PV definitions defined via the ACPR configuration file |            |
| *`nfs_purge_data`*                 | If Ansible is allowed to delete content of PVs                 | _false_    |
*See [https://docs.avaloq.com/acpr]() under the *ACPR OpenShift configuration and installation* topic.

## Usage examples

Usage within a playbook:

The following snippet describes how to create and export NFS shares:

```yaml
- hosts: nfs
  become: yes
  gather_facts: no
  roles:
  - role: avaloq.acpr-storage-nfs
```

The following snippet describes how to remove all data in existing persistent volume claim without removing the persistent volume itself:

```yaml
- name: Purge data on persistent nfs volume
  hosts: localhost
  become: false
  gather_facts: false
  vars:
    nfs_purge_data: true
    grafana_pvs:
      - name: grafana-lib-pvc
        namespace: acpr-monitoring
  tasks:
      - include_role:
          name: avaloq.acpr-storage-nfs
          tasks_from: nfs_share_purge_data.yml
        loop: '{{ grafana_pvs }}'
```
