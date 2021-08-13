# Ansible role '*avaloq.acpr-twistlock*'

Deploy Twistlock Console and Twistlock Defender within specified OpenShift project.
Additionally monitoring resources are deployed to Alertmanager and Grafana.

ACPR uses for Twistlock Defender deployment Daemonsets and defenders are provisioned
only on nodes with a tag *twistlock-defender=true*.

## Requirements

* Twistlock license
* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

### Storage

|Persistent Volume Claim name |Mode  |Description                          |
|-----------------------------|------|-------------------------------------|
|`twistlock-console`          |_RWO_ |Twistlock database and logs location |


## Role variables

|ACPR configuration variable          | Description                                                | Default                                 |
|-------------------------------------|------------------------------------------------------------|-----------------------------------------|
|`cust_twistlock_namespace`           | Namespace where to install Twistlock                       | _twistlock_                             |
|`cust_twistlock_console_hostname` \* | Twistlock Console hostname                                 | Calculated by OpenShip                  |
|`cust_twistlock_console_pvc_size`    | Size of PVC required by Twistlock console                  | _5Gi_                                   |
|`cust_twistlock_license_key`         | Twistlock license key                                      |                                         |
|`cust_twistlock_console_image`       | Twistlock Console image                                    | _twistlock/console:console_19_07_353_   |
|`cust_twistlock_defender_image`      | Twistlock Defender image                                   | _twistlock/defender:defender_19_07_353_ |
|`cust_twistlock_prometheus_user`     | Twistlock username to be used by Prometheus (min. 8 chars) |                                         |
|`cust_twistlock_prometheus_password` | Password for `twistlock_prometheus_user` (min. 8 chars)    |                                         |
|`cust_twistlock_user`                | Twistlock user with admin privileges                       | _admin_                                 |
|`cust_twistlock_password` \*         | Password for `cust_twistlock_user` user account            | Randomly generated                      |

\* If empty, value will be automatically generated during deployment

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
