# Ansible role '*avaloq.constellation-deployment*'

Utility role to deploy an Avaloq _constellation_ using _Avaloq Installator_

Following functionality is included:

* Cluster _namespace_ creation and cleanup
* _Constellation_, _config set_, and _Avaloq Installator_ retrieval (Git, URL, or locally)
* Container images and corresponding signatures existence check (optional)
* _Contellation_ deployment to ACPR cluster

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation
* Installator installed on the system or set to download.

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

None.

## Role variables

### Required variables

|Parameter       |Description                                                         |Default |
|----------------|--------------------------------------------------------------------|--------|
|`acd_const_loc` |_Constellation_ location (_Git_ repository, URL, or directory path) |        |

### Optional

|Parameter                         |Description                                                                                        |Default                       |
|----------------------------------|---------------------------------------------------------------------------------------------------|------------------------------|
|`acd_cfset_git_branch`            |_Config-set_ _Git_ branch (if `acd_cfset_loc` is a _Git_ repository)                               |_master_                      |
|`acd_cfset_loc_pass`              |_Config-set_ location password (if required)                                                       |                              |
|`acd_cfset_loc_user`              |_Config-set_ location username (if required)                                                       |                              |
|`acd_cfset_loc`                   |_Config-set_ location (_Git_ repository, URL, or absolute directory path)                          |                              |
|`acd_cfset`                       |_Config-set_ name                                                                                  |                              |
|`acd_cleanup`                     |Remove temporary working dir in _/tmp_ folder                                                      |_True_                        |
|`acd_clear_namespace`             |Remove objects from namespace                                                                      |_False_                       |
|`acd_const_git_branch`            |_Constellation_ _Git_ branch (if `acd_const_loc` is a _Git_ repository)                            |_master_                      |
|`acd_const_loc_pass`              |_Constellation_ location password (if required)                                                    |                              |
|`acd_const_loc_user`              |_Constellation_ location username (if required)                                                    |                              |
|`acd_http_proxy`                  |HTTP proxy configuration                                                                           |$http_proxy of current Shell  |
|`acd_https_proxy`                 |HTTPS proxy configuration                                                                          |$https_proxy of current Shell |
|`acd_image_existence`             |If _true_ checks if images exist in registry prior deployment                                      |_True_                        |
|`acd_image_file`                  |Path to container images file (if verifying container image and signature verification only)       |                              |
|`acd_inst_kind_exclude`           |_Avaloq Installator_  The object's kind to exclude from deploying to the cluster                   |                              |
|`acd_inst_lint`                   |Enable Linter plugin in _Avaloq Installator_                                                       |_True_                        |
|`acd_inst_loc_pass`               |_Avaloq Installator_ binaries location password (if required and location is an URL)               |                              |
|`acd_inst_loc_user`               |_Avaloq Installator_ binaries location username (if required and location is an URL)               |                              |
|`acd_inst_loc`                    |_Avaloq Installator_ binaries location (URL or path)                                               |                              |
|`acd_inst_opts`                   |_Avaloq Installator_ environment variable `AVALOQ_INSTALLATOR_OPTS`                                |                              |
|`acd_inst_params`                 |_Avaloq Installator_ additional parameters                                                         |                              |
|`acd_inst_ver`                    |_Avaloq Installator_ version  -REQUIRED if acd_inst_loc set to download Installator-               |                              |
|`acd_namespace`                   |Cluster destination _namespace_                                                                    |                              |
|`acd_no_proxy`                    |_no_proxy_ configuration                                                                           |$no_proxy of current Shell    |
|`acd_ose_token`                   |Cluster access token                                                                               |                              |
|`acd_ose_url`                     |Cluster URL                                                                                        |                              |
|`acd_registry_password`           |Container image registry password (if required)                                                    |                              |
|`acd_registry_url`                |Container image registry URL (optional if using full container image URLs)                         |                              |
|`acd_registry_username`           |Container image registry username (if required)                                                    |                              |
|`acd_secrets_key_file_path`       |Path to file which contains password to decrypt secrets                                            |                              |
|`acd_signature_existence`         |If _true_ checks if signature exist in signature store prior deployment                            |_True_                        |
|`acd_signature_pubkeys`           |GPG public keys (list)                                                                             |                              |
|`acd_signature_sigstore_password` |Signature store (_sigstore_) password (if required)                                                |                              |
|`acd_signature_sigstore_username` |Signature store (_sigstore_) username (if required)                                                |                              |
|`acd_signature_sigstore`          |Signature store (_sigstore_) URL                                                                   |                              |

## Usage examples

Command line (where a file is used to store the parameters in _YAML_ or _JSON_ format):

```bash
ansible-playbook -i ${path_to_inventory} playbooks/acpr-711-validate-images-existence.yml \
-e @/path/to/file
```

Ansible playbooks for deploying a _constellation_:

```yaml
---
- hosts: localhost
  vars:
    acd_const_loc: ../../constellations/strimzi-operator-definitions
    acd_namespace: user-namespace
    acd_ose_token: <removed>
    acd_ose_url: https://oc.example.net
  roles:
    - ../roles/avaloq.constellation-deployment
```

```yaml
- hosts: localhost
  vars:
    acd_const_loc: https://svc.example.net/scm/constellation.git
    acd_const_loc_user: username
    acd_const_loc_pass: <removed>
    acd_inst_loc: "https://repository.example.net/avaloq-installator-{{ acd_inst_ver }}-x64_linux.tgz"
    acd_inst_kind_exclude: ConfigMap,Secret,RoleBinding
    acd_namespace: constellation-dev
    acd_ose_token: <removed>
    acd_ose_url: https://oc.example.net
    acd_cfset: dev
    acd_signature_sigstore: https://registry.example.net/signatures
    acd_signature_sigstore_username: username
    acd_signature_sigstore_password: <removed>
    acd_signature_pubkeys:
      - |
        -----BEGIN PGP PUBLIC KEY BLOCK-----
        Version: GnuPG v2.0.22 (GNU/Linux)

        mQENBF1bpO0BCACowmv+pUdNY+4fctf9YqS1zCVvUu7cWbar5HbURDhS6N1guQ5v
        Ed1720o1nn/ZDg+xgnBd5Z+RqfOaFjr4BOJLZ0yUn+a82zQL3wA3RLUswcsxTMWQ
        ...

  roles:
    - avaloq.constellation-deployment
```
