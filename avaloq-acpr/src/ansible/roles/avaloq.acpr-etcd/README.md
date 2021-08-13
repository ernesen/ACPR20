# Ansible role '*avaloq.acpr-etcd*'

Enable *etcd* encryption of Secret objects at rest.

>**NOTE**: Already existing secrets are encrypted as well.

Distritube *etcd* CA from primary master to all others.

>**NOTE**: *master API* and *controller* services are restarted.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

None.

## Usage examples

Usage within a playbook to encrypt *etcd*:

```yaml
- hosts: masters
  become: yes
  roles:
    - avaloq.acpr-etcd
```
