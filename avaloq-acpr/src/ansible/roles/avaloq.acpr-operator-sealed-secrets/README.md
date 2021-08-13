# avaloq.acpr-operator-sealed-secrets

Setup the Sealed Secrets Operator cluster-wide configurations
([Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets)).

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role requires privilege escalation

## Dependencies

* Ansible role '*avaloq.acpr-auth*'

## Role variables

|ACPR configuration variable    |Role variable name             |Description                                          |Default                                            |
|-------------------------------|-------------------------------|-----------------------------------------------------|---------------------------------------------------|
|`acpr_sealed_secrets_operator` |`acpr_sealed_secrets_operator` |ACPR dictionary to configure Sealed secrets operator |See `acpr_rpm_repositories` variable section below |


### `acpr_sealed_secrets_operator` variable

|Parameter        |Description                                                           |Default                                                                              |
|-----------------|----------------------------------------------------------------------|-------------------------------------------------------------------------------------|
|`image`          |Container image used to deploy the operator                           | `acpr_docker_registry_location`/avaloq/avaloq-sealed-secrets:0.1.0-controller0.12.1 |

## Example playbook

```yaml
- name: ACPR | Sealed Secrets Operator deployment
  hosts: localhost
  become: false
  gather_facts: false
  roles:
    - role: avaloq.acpr-operator-sealed-secrets
```
