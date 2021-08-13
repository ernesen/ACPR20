# Ansible role '*avaloq.acpr-storage-classes*'

Create the Storage Class objects:
- *avaloq-file*

## *avaloq-file* Storage Class object

The *avaloq-file* storage class abstracts a file system that backs a persistent volume.

After the storage class *avaloq-file* is created, it can be used to provision persistent
storage for applications as follows:
* The OpenShift cluster manager creates persistent volumes (PVs) that belong to the
  storage class *avaloq-file*
* Then an application can specify a persistent volume claim (PVc) that requests a volume
  from the storage class avaloq-file;
  The PVC will be bound automatically to a PV with the requested properties (capacity,
  access mode), if such PV exists.
  
## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

None.

## Usage examples

Usage within a playbook:

```yaml
- hosts: localhost
  become: no
  gather_facts: no
  roles:
  - role: avaloq.acpr-storage-classes
```
