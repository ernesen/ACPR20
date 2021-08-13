# Ansible role '*avaloq.acpr-ocp4-auth*'

Handle OpenShift 4 cluster authentication

## Requirements

* Ansible > 2.9

### Privilege escalation

The role does not require root privileges.

### Dependencies

None.

## Role variables

|ACPR configuration variable                    |Role variable name                             |Description                                                |Default                                                       |
|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------------|
|`cust_cluster_credentials`                     |`acpr_cluster_credentials`                     |Dictionary containing cluster credentials                  |See `acpr_cluster_credentials` variable section below         |


### `acpr_cluster_credentials variable` variable

|Parameter                  |Description                                           |Default |
|---------------------------|------------------------------------------------------|--------|
|`url`                      |Url of the given server                               |        |
|`token`                    |Bearer token for authentication to the API server     |        |
|`username`                 |Username for authentication to the API server         |        |
|`password`                 |Password token for authentication to the API server   |        |
|`role`                     |This variable is not used at the moment               |        |
|`certificateAuthorityPath` |Path to the CA certificate on the administration host |        |
|`certificateAuthority`     |Full content of CA certificate                        |        |
|`insecureSkipTlsVerify`    |Do not check TLS when connecting                      |_False_ |

>**NOTE**: Either `token` or `username` and `password` must be set.


## Usage examples

Login to ACPR within an Ansible playbook:

```yaml
- name: Login to OpenShift cluster
  include_role:
    name: avaloq.acpr-ocp4-auth
    tasks_from: login.yml
```

Logout from ACPR within an Ansible playbook:

```yaml
- name: Logout from OpenShift cluster
  include_role:
    name: avaloq.acpr-ocp4-auth
    tasks_from: logout.yml
```
