# Ansible role '*avaloq.acpr-operator-oauthclient*'

Deploys the Avaloq OAuthClient Operator.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

## Role variables

The following variables related to this role may be defined via the ACPR configuration
file *avaloq-acpr/src/acpr/<cust_cluster_name>.yml*:

| Parameter                                    |  Description
|----------------------------------------------|------------------------------------------------------------------|
| `acpr_oauthclient_operator_image`   | Container image of Avaloq OAuthClient Operator                   |

## Usage examples

Usage within a playbook:

```yaml
- name: ACPR | Avaloq OAuthClient Operator deployment
  hosts: localhost
  become: false
  gather_facts: false
  roles:
    - role: avaloq.acpr-operator-oauthclient
```
