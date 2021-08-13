# Ansible role '*avaloq.acpr-ocp4-configure-administration-host*'

Configure OpenShift4 administration host, initial version.
## Requirements

* Ansible > 2.9

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

* Ansible role '*avaloq.acpr-repository*'
* Ansible role '*avaloq.acpr-ocp4-webserver*'

## Role variables

Below is a list of all currently supported variables.

### Required variables

None.

### Optional variables

|ACPR configuration variable       |Role variable name                 |Description                                                                                                                 |Default                                                                                                        |
|----------------------------------|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
|`cust_openshift_client_manage`    |`acpr_openshift_client_manage`     |Set to true if you want to download and use the OpenShift client from the given `cust_openshift_client_url` variable        |_False_                                                                                                        |
|`cust_openshift_client_url`       |`acpr_openshift_client_url`        |URL to the OpenShift Client archive file                                                                                    |https://mirror.openshift.com/pub/openshift-v4/clients/ocp/{{ cust_os_version }}/openshift-client-linux.tar.gz  |
|`cust_openshift_installer_manage` |`acpr_openshift_installer_manage`  |Set to true if you want to download and use the OpenShift installer from the given `cust_openshift_installer_url` variable  |_False_                                                                                                        |
|`cust_openshift_installer_url`    |`acpr_openshift_installer_url`     |URL to the OpenShift installer archive                                                                                      |https://mirror.openshift.com/pub/openshift-v4/clients/ocp/{{ cust_os_version }}/openshift-install-linux.tar.gz |
|`cust_serve_ignition_files`       |`acpr_serve_ignition_files`        |If set to true, a web server is automatically installed to serve the ignition files                                         |_False_                                                                                                        |


## Usage examples

Usage within a playbook:

```yaml
- name: Do some stuff
  hosts: localhost
  become: true
  roles:
  - role: avaloq.acpr-ocp4-configure-administration-host
```
