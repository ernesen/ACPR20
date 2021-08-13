# Ansible role '*avaloq.acpr-hardening*'

Check and enforce OpenShift *master API*, *controller*, *scheduler*, *etcd*, and *kubelet*
according to Red Hat and ACPR security guidelines.

ACPR comes with recommended security settings applied by default. The role can be
leveraged to make sure the security relevant settings are applied.

>**NOTE**: This role only configures security settings but does not restart any
OpenShift component.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

* [yedit](https://galaxy.ansible.com/kwoodson/yedit) Ansible role (included)

## Role variables

Below is a list of all currently supported parameters.

| Parameter                                | Description                                                            | Default                                     |
|------------------------------------------|------------------------------------------------------------------------|---------------------------------------------|
| `api_always_pull_images`                 | If *AlwaysPullImages* plugin should be enabled                         | *false*                                     |
| `api_enable_ratelimit`                   | If *EventRateLimit* plugin should be enabled                           | *false*                                     |
| `api_security_context_deny`              | If the *SecurityContextDeny* plugin should be enabled                  | *false*                                     |
| `api_request_timeout`                    | Request timeout for cluster resources                                  | *false*                                     |
| `controller_rotate_kubelet_certificates` | If the *RotateKubeletServerCertificate* feature gate should be enabled | *false*                                     |
| `controller_pod_gc_threshold`            | Value of the pod garbage collector                                     | Default Kubernetes value                    |
| `kubelet_streaming_timeout`              | Idle timeout for stream connections (e.g. port-forward, exec, attach)  | Default Kubernetes value                    |
| `master_config_file`                     | Location of the OpenShift master config file                           | */etc/origin/master/master-config.yaml*     |
| `master_encryption_config`               | Location of the OpenShift encryption config file                       | */etc/origin/master/encryption-config.yaml* |
| `master_env_file`                        | Location of the OpenShift master environment file                      | */etc/origin/master/master.env*             |
| `node_config_file`                       | Location of the OpenShift node config file                             | */etc/origin/node/node-config.yaml*         |


## Usage examples

Usage within a playbook:

```yaml
- name: ACPR | API hardening
  hosts: masters
  become: true
  roles:
    - role: yedit
  tasks:
    - include_role:
        name: avaloq.acpr-hardening
        tasks_from: api-hardening.yml
```
