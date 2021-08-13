# Ansible role '*avaloq.acpr-auth*'

Provide OpenShift Command Line Interface (aka CLI or *oc* binary) and two Ansible tasks:
* *login* - to locally login to an OpenShift cluster
* *logout* - to locally logout from an OpenShift cluster

>**NOTE**: To prevent unauthorized or accidental access to an OpenShift cluster, make
>sure to always execute the *logout* task.

## Execution overview

* Login task (_login.yaml_):
  1. Read login configuration and credentials if defined in `acpr_cluster_credentials`,
     and execute `oc login` to initialize local environment.  
     Otherwise copy cluster-admin login configuration and credentials from first master
     host to local environment.

* Logout task (_logout.yaml_)
  1. Remove login configuration and credentials from local environment

## Requirements

* Ansible >= 2.6
* OpenShift CLI (*oc*) binary compatible with cluster OpenShift version

### Privilege escalation

This Ansible role may require privilege escalation. Refer to the following table for
further details:

|Task file   |Block/Task name                                         |Condition                                        |Description                                                            |
|------------|--------------------------------------------------------|-------------------------------------------------|-----------------------------------------------------------------------|
|_login.yml_ |`Copy admin.kubeconfig from first master host [become]` |If `acpr_cluster_credentials` is **not** defined |Copies admin configuration and credentials stored in first master host |

### Dependencies

None.

## Variables

The following variables related to this role must be defined via the ACPR configuration
file *avaloq-acpr/src/acpr/<cust_cluster_name>.yml* and the inventory file generated:

| ACPR parameter                 | Role variable              | Description                               |
|--------------------------------|----------------------------|-------------------------------------------|
| `cust_cluster_credentials`     | `acpr_cluster_credentials` | Dictionary containing cluster credentials |

## Usage examples

Login to ACPR within an Ansible playbook:

```yaml
- name: Login to OpenShift cluster
  include_role:
    name: avaloq.acpr-auth
    tasks_from: login
```

Logout from ACPR within an Ansible playbook:

```yaml
- name: Logout from OpenShift cluster
  include_role:
    name: avaloq.acpr-auth
    tasks_from: logout
```
