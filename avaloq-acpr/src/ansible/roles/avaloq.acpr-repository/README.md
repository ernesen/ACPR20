# Ansible role '*avaloq.acpr-repository*'

Configure ACPR RPM PGP key and ACPR _Yum_ repositories.

## Execution overview

1. Stores ACPR RPM PGP key (_/etc/pki/rpm-gpg/RPM-GPG-KEY-acpr_)
2. Configure ACPR _Yum_ repositories (_/etc/yum.repos.d/acpr.repo_)

## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation:

|Task file  |Block/Task name                                   |
|-----------|--------------------------------------------------|
|_main.yml_ |`Configure ACPR PGP GPG key and Yum repositories` |

### Dependencies

None.

## Role variables

|ACPR configuration variable  |Role variable name      |Description                                        |Default                                            |
|-----------------------------|------------------------|---------------------------------------------------|---------------------------------------------------|
|`cust_acpr_rpm_repositories` |`acpr_rpm_repositories` |ACPR dictionary of _Yum_ repositories to configure |See `acpr_rpm_repositories` variable section below |

Default values can be globally set outside the `acpr_rpm_repositories` dictionary by
setting the following variables:

|ACPR configuration variable           |Role variable name               |Description                                                              |Default                                              |
|--------------------------------------|---------------------------------|-------------------------------------------------------------------------|-----------------------------------------------------|
|`cust_acpr_rpm_gpgcheck`              |`acpr_rpm_gpgcheck`              |Default value for RPM repositories' GPG check switch                     |_yes_                                                |
|`cust_acpr_rpm_gpgkey`                |`acpr_rpm_gpgkey`                |Default location of the RPM repositories' GPG key                        |_file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release_ |
|`cust_acpr_rpm_proxy`                 |`acpr_rpm_proxy`                 |Default RPM repositories' HTTP Proxy value                               |                                                     |
|`cust_acpr_rpm_proxy_password`        |`acpr_rpm_proxy_password`        |Default password for authenticating against RPM repositories' HTTP Proxy |                                                     |
|`cust_acpr_rpm_proxy_username`        |`acpr_rpm_proxy_username`        |Default username for authenticating against RPM repositories' HTTP Proxy |                                                     |
|                                      |`acpr_rpm_repository_defaults`   |Default ACPR dictionary of _Yum_ repositories to configure               |See `acpr_rpm_repositories` variable description     |
|`cust_acpr_rpm_repositories_password` |`acpr_rpm_repositories_password` |Default password for authenticating against RPM Repositories             |                                                     |
|`cust_acpr_rpm_repositories_username` |`acpr_rpm_repositories_username` |Default username for authenticating against RPM Repositories             |                                                     |
|`cust_acpr_rpm_sslcacert`             |`acpr_rpm_sslcacert`             |Default path to the RPM repositories' SSL CA certificate                 |                                                     |
|`cust_acpr_rpm_sslverify`             |`acpr_rpm_sslverify`             |Default value for RPM repositories' SSL certificate check                |_yes_                                                |

### `acpr_rpm_repositories` variable

Default RPM repository entry names:

* _AcprOpenShift311_
* _AcprRhel7Server_
* _AcprRhel7ServerExtras_
* _AcprRhel7Ansible29_
* _AcprTools_

Repository entry variables:

|Parameter        |Description                                          |Default                          |
|-----------------|-----------------------------------------------------|---------------------------------|
|`description`    |RPM repository description                           |                                 |
|`url`            |RPM repository URL                                   |                                 |
|`enabled`        |Switch to enable RPM repository                      |_yes_                            |  
|`gpgcheck`       |If GPG signature of RPMs has to be checked           |_yes_                            |
|`gpgkey`         |Location of the GPG key to verify RPM signatures     |`acpr_rpm_gpgkey`                |
|`password`       |Password for authenticating against RPM Repository   |`acpr_rpm_repositories_password` |
|`proxy`          |HTTP Proxy to use to connect to RPM repository       |`acpr_rpm_proxy`                 |
|`proxy_password` |Password for authenticating against HTTP Proxy       |`acpr_rpm_proxy_password`        |
|`proxy_username` |Username for authenticating against HTTP Proxy       |`acpr_rpm_proxy_username`        |
|`sslcacert`      |Path to the SSL CA certificate to verify repository  |`acpr_rpm_sslcacert`             |
|`sslverify`      |If the repository SSL certificate has to be verified |`acpr_rpm_sslverify`             |
|`username`       |Username for authenticating against RPM Repository   |`acpr_rpm_repositories_username` |

>**NOTE**: Setting `acpr_rpm_repositories : none` inhibits the ACPR PGP key and ACPR Yum
>repositories configuration.

### `acpr_rpm_repository_defaults` variable

```yaml
acpr_rpm_repository_defaults:
  AcprOpenShift311:
    description: ACPR Red Hat OpenShift Container Platform 3.11 (RPMs)
    url: https://repository.service.avaloq.com/rpm/rh-rhel-7-server-ose-3.11
  AcprRhel7Server:
    description: ACPR Red Hat Enterprise Linux 7 Server (RPMs)
    url: https://repository.service.avaloq.com/rpm/rh-rhel-7-server
  AcprRhel7ServerExtras:
    description: ACPR Red Hat Enterprise Linux 7 Server - Extras (RPMs)
    url: https://repository.service.avaloq.com/rpm/rh-rhel-7-server-extras
  AcprRhel7Ansible29:
    description: ACPR Red Hat Ansible Engine 2.9 (RPMs) for RHEL7
    url: https://repository.service.avaloq.com/rpm/rh-rhel-7-server-ansible-2.9
  AcprTools:
    description: ACPR Tools for Red Hat OpenShift Container Platform (RPMS) for RHEL 7
    url: https://repository.service.avaloq.com/rpm/acpr-rhel-7-tools
    gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-acpr
```

## Usage examples

Ansible playbook for configuring ACPR _Yum_ repositories:

```yaml
- name: Configure ACPR PGP key and ACPR Yum repositories
  hosts: all, localhost
  gather_facts: false
  roles:
    - role: avaloq.acpr-repository
```
