# avaloq.acpr-ocp4-installator-lint

Validate OpenShift (or Kubernetes) cluster if the cluster is ACPR compliant.
 
## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation.

## Dependencies

* Ansible role '*avaloq.acpr-auth*'
* Avaloq Installator >= 1.0.0

## Example playbook

```yaml
- name: ACPR | Installator Lint cluster verification
  hosts: localhost
  become: false
  gather_facts: false
  roles:
    - role: avaloq.acpr-ocp4-installator-lint
```
