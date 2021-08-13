# Ansible role '*avaloq.acpr-prepare-environments*'

Check and ensure prerequisites are met to successfully install ACPR OpenShift.

Tasks that check:
* The system is running the required Red Hat Enterprise Linux version
* DNS entries (A & PTR record) of a host are present
* The system is synchronizing time from an NTP server

Tasks that ensure:
* Package `NetworkManager` is present and service `NetworkManager.service` is running
* Service `firewalld.service` is stopped if present
* Virtual network devices are blacklisted in the NetworkManager configuration
* SELinux is `enforcing` the `targeted` policy
* Ensure that SELinux boolean parameter `virt_use_nfs` is set to true (allows pods to access NFS volumes)
* Set kernel parameter `vm.max_map_count` to 262144 according to Elasticsearch recommendations

## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

None.

## Role variables

Below is a list of all currently supported variables.

### Required variables

Relies on Ansible inventory file.

### Optional variables

| Parameter              | Description                                            | Default |
|------------------------|--------------------------------------------------------|---------|
| `acpr_trusted_cacerts` |List of trusted Certificate Authority (CA) certificates |         |

## Usage examples

Usage within a playbook:

```yaml
- name: Test host pre-requisites
  hosts: nodes
  become: true
  roles:
    - avaloq.acpr-prepare-environments
```
