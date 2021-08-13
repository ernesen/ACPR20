# Ansible role '*avaloq.acpr-operator-strimzi*'

Setup the Strimzi Operators cluster-wide configurations
([strimzi.io](https://strimzi.io/)).

This includes:
* Increase the base access level for all users with *Edit* and/or *Admin* access on a namespace
* Create the cluster operator roles
* Create the entity operator roles
* Create the Custom Resource Definitions

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

## Usage examples

Usage within a playbook:

```yaml
- name: ACPR | Kafka Strimzi Operator deployment
  hosts: localhost
  become: false
  gather_facts: false
  roles:
    - role: avaloq.acpr-operator-strimzi
```
