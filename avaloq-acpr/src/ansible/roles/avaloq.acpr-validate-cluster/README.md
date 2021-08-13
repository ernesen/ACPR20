# Ansible role '*avaloq.acpr-validate-cluster*'

Check if the cluster is ACPR compliant.

## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

## Example playbook

```yaml
- name: ACPR | Check OpenShift cluster
  hosts: localhost
  become: false
  roles:
    - role: avaloq.acpr-validate-cluster
```
