# Ansible role '*avaloq.acpr-operator-database*'

Deploys the Avaloq Database Operator.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

## Role variables

The following variables related to this role must be defined via the ACPR configuration
file *avaloq-acpr/src/acpr/<cust_cluster_name>.yml*:

| Parameter                                    |  Description
|----------------------------------------------|------------------------------------------------------------------|
| `acpr_database_operator_credentials`         | Dictionary containing database credentials (see example below)   |
| `acpr_database_operator_env`                 | Container environment variables to inject                        |
| `acpr_database_operator_image`               | Container image of Avaloq Database operator                      |
| `acpr_database_operator_logaccess_groupname` | User group which will get access to database operator logs       |
| `acpr_database_operator_oracle_templates`    | Dictionary containing custom Oracle templates                    |

## Usage examples

Usage within a playbook:

```yaml
- name: ACPR | Avaloq Database Operator deployment
  hosts: localhost
  become: false
  gather_facts: false
  vars:
    acpr_database_operator_env:
      DB_OPERATOR_DROP_SCHEMA_ON_DELETE: false
    acpr_database_operator_credentials:
      adai-guests-dba:
        username: k
        password: k
      uat-dba:
        username: dba-user
        password: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          61313533313161353131363739376631356436636130363264666434623834363162616335353564
          3461303263393531313632393434323237313331623337610a613532323837653436333931323430
          39313862373764363232643966653431376337313561316232663466363631386161646133653337
          3664643764636133320a346530336431393362313936646536643265383931386165356338613861
          6566
    acpr_database_operator_oracle_templates:
      createTablespace.template: | 
        create bigfile tablespace $tablespace.name
  roles:
    - role: avaloq.acpr-operator-database
```

>**NOTE**: In order to protect sensitive data such as passwords or keys refer to Ansible
>Vault documentation.
