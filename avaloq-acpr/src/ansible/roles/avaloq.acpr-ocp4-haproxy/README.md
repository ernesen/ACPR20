# Ansible role '*avaloq.acpr-ocp4-haproxy*'

Install and configure HAProxy as load balancer for OpenShift 4 cluster

## Requirements

* Ansible > 2.9

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

## Role variables

Below is a list of all currently supported variables.

### Required variables

|ACPR configuration variable       |Role variable name                 |Description               |Default  |
|----------------------------------|-----------------------------------|--------------------------|-------- |
|`cust_cluster_nodes`              |`acpr_cluster_nodes`               |List of all cluster nodes |         |
|`cust_lb_host`                    |                                   |Destination host          |         |

## Usage examples

Usage within a playbook:

```yaml
- name: Do some stuff
  hosts: lb
  become: true
  gather_facts: yes
  roles:
  - role: avaloq.acpr-ocp4-haproxy
```
