# Ansible role '*avaloq.acpr-prismacloud*'

Deploy Prisma Cloud Console and Prisma Cloud Defender within specified OpenShift project.
Additionally monitoring resources are deployed to Alertmanager and Grafana.


## Requirements

* Prisma Cloud / Twistlock license
* Ansible >= 2.9
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

### Storage

|Persistent Volume Claim name |Mode  |Description                             |
|-----------------------------|------|----------------------------------------|
|`twistlock-console`          |_RWO_ |Prisma Cloud database and logs location |

## Role variables

```yaml
cust_prismacloud:
  twistlock:
    namespace: prismacloud
    license_key: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      ...
    console:
      username: admin
      password: !vault |
        $ANSIBLE_VAULT;1.1;AES256
        ...
      hostname: <console_hostname_url>
      image: registry.service.avaloq.com/twistlock/console:console_21_04_421
      storageClassName: <storage_class_name>
      prometheus:
        username: twistlock_prometheus
        password: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          ...
    defender:
      image: registry.service.avaloq.com/twistlock/defender:defender_21_04_421
  additional-twistlock-instance:
    namespace: prismacloud-2
    license_key: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      ...
    console:
      username: admin
      password: !vault |
        $ANSIBLE_VAULT;1.1;AES256
        ...
      hostname: <console_hostname_url>
      image: registry.service.avaloq.com/twistlock/console:console_21_04_421
      storageClassName:<storage_class_name>
      prometheus:
        username: twistlock_prometheus
        password: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          ...
    defender:
      image: registry.service.avaloq.com/twistlock/defender:defender_21_04_421
```

## Usage examples

Usage within a playbook:

```yaml
- name: ACPR | Twistlock deployment
  hosts: localhost
  become: false
  gather_facts: false
  roles:
    - role: avaloq.acpr-twistlock
```
