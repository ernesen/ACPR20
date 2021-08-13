# Ansible role '*avaloq.acpr-docker*'

Configure _docker_ daemon and container images registries.

This includes:
* Set container image registry location and save all required certificates
* Configure storage device used by docker
* Configure HTTP/ HTTPs proxy settings
* Expose daemon to the network (optional)
* Configure docker (and _atomic_) to use image signatures (default: disabled)
* _docker_ cleanup script to remove unused container images (default: disabled)

The role also contains set of tasks used by the Ansible playbook
'*acpr-950-prepull-and-sign-images.yml*' for pre-pulling and signing container images in
the local caching infrastructure. In order to use this utility functionality the ACPR
configuration variable `cust_prepull_container_registry`  must be set.  

For further information refer to the '_Manage Avaloq Container Platform - Container image
registries and signature verification_' topic in the ACPR documentation.

## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

None.

## Role variables

|ACPR configuration variable        |Role variable name                 |Description                                        |Default                                                       |
|-----------------------------------|-----------------------------------|---------------------------------------------------|--------------------------------------------------------------|
|`cust_container_images_registries` |`acpr_container_images_registries` |ACPR dictionary of docker registries configuration |See `acpr_container_images_registries` variable section below |

Default values can be globally set outside the `acpr_container_images_registries`
dictionary by setting the following variables:

|ACPR configuration variable                    | Role variable name                             | Description                                                                        | Default       |
|-----------------------------------------------|------------------------------------------------|------------------------------------------------------------------------------------|---------------|
|`cust_container_images_signature_verification` | `acpr_container_images_signature_verification` | Enable or disable container images signature verification in OpenShift             | _true_        |
|`cust_container_images_signature_verification` | `acpr_docker_signature_verification`           | Enable or disable container images signature verification in _docker_ configuration| _true_        |
|                                               | `acpr_docker_cleanup_base`                     | Directory where _dockercleanup.sh_ script is located                               | _/opt/avaloq_ |
|                                               | `acpr_docker_cleanup`                          | Determine if _dockercleanup.sh_ script should be deployed                          | _false_       |
|                                               | `acpr_docker_expose`                           | If the _docker_ daemon should listen on the local UNIX socket and on the network   | _false_       |
|`cust_http_proxy`                              | `acpr_docker_http_proxy`                       | HTTP proxy server                                                                  |               |
|`cust_https_proxy`                             | `acpr_docker_https_proxy`                      | HTTPS proxy server                                                                 |               |
|`cust_no_proxy`                                | `acpr_docker_no_proxy`                         | List of systems, domains, IPs which will not use the defined proxy server          |               |
|`cust_registry_cacert`                         | `acpr_docker_registry_cacert`                  | CA Certificate of the primary container image registry                             |               |
|`cust_registry_location`                       | `acpr_docker_registry_location`                | Location of the primary container image registry                                   |               |
|                                               | `acpr_docker_tcp_port`                         | TCP port used to expose the _docker_ daemon in the network                         | _2375_        |
|                                               | `acpr_reconfigure_docker_interactive_mode`     | If user prompt is required                                                         | _true_        |

### `acpr_container_images_registries` variable

Default registry entry name:

* _AvaloqContainerImagesRepository_

Registry entry variables (defaults are the values for entry _AvaloqContainerImagesRepository_):

|Parameter                 |Description                                                                            |Default                                          |
|--------------------------|---------------------------------------------------------------------------------------|-------------------------------------------------|
|`host`                    |Registry location                                                                      |_registry.service.avaloq.com_                    |
|`username`                |Username for authenticating against the registry                                       |                                                 |
|`password`                |Password for authenticating against the registry                                       |                                                 |
|`ca_certificate`          |Certificate authorities certificates                                                   |<Avaloq CA certificates>                         |
|`trust_type`              |Defaut _Atomic_ trust level (_insecureAcceptAnything_\&#124;_reject_&#124;_signedBy_)  |_reject_                                         |
|`sigstore_type`           |Signature store type                                                                   |_web_                                            |
|`sigstore`                |Signature store location                                                               |_https://registry.service.avaloq.com/signatures_ |
|`sigstore_username`       |Username for authenticating against the signature store                                |                                                 |
|`sigstore_password`       |Password for authenticating against the signature store                                |                                                 |
|`pubkeys`                 |Default registry signatures public key                                                 |<Avaloq public keys>                             |
|`namespace_configuration` |List of container image trust configuration per namespace                              |                                                 |

### `namespace_configuration` variable

Namespace entry names for registry _AvaloqContainerImagesRepository_:

* _avaloq_
* _rhel7_
* _openshift3_
* _twistlock_

Entry variables (defaults are the values for namespace entry _avaloq_):

|Parameter    |Description                                                                    |Default    |
|-------------|-------------------------------------------------------------------------------|-----------|
|`name`       |Namespace name                                                                 |_avaloq_   |
|`trust_type` |_Atomic_ trust level (_insecureAcceptAnything_\&#124;_reject_&#124;_signedBy_) |_signedBy_ |
|`pubkeys`    |Signature public key                                                           |`pubkeys`  |

## Usage examples

Ansible playbook for configuring _docker_ daemon and registries:

```yaml
- name: Configure docker daemon and registries
  hosts: nodes
  roles:
    - role: avaloq.acpr-docker
```

Ansible playbook for re-configuring _docker_ daemon and registries:

```yaml
- name: Reconfigure docker daemon and container image registries
  hosts: nodes
  gather_facts: false
  any_errors_fatal: true
  serial: 1
  tasks:
    - include_role:
        name: avaloq.acpr-docker
        tasks_from: docker-reconfigure
```
