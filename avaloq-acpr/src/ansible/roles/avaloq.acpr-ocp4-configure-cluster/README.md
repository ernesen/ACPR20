# Ansible role '*avaloq.acpr-ocp4-configure-cluster*'

Configure OpenShift4 cluster.

Tasks that ensure:
* Add OpenShift release checksum to cluster (Ansible tag _release_checksum_)
* Configure container image registries (Ansible tag _container_registry_)
* Configure container image registry mirrors  (Ansible tag _container_registry_)
* Configure image signature verification (Ansible tag _image_signature_)
* Disable Red Hat OperatorHub sources and configure local OperatorHub sources (Ansible tag _operatorhub_)
* Configure Identity providers LDAP, OpenID Connect and Htpasswd (Ansible tag _identity_provider_)
* Set `nodeSelector` for ingress router pods
* Remove default cluster-admin user _kubeadmin_ (Ansible tag _cluster_admin_)
* NTP configuration (Ansible tag _ntp_configuration_)
* Install and configure OpenShift Logging (Ansible tag _openshift_logging_)
  * Increase _journald_ rate limits parameters values (`RateLimitBurst` and
    `RateLimitInterval`) according to
    [Red Hat recommendations](https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-systemd.html)
  * Set kernel parameter `vm.max_map_count` value to _262144_ according to
    [Elasticsearch recommendations](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)
* Deploy OpenShift project template (Ansible tag _project_template_)
* Configure _etcd_ encryption (Ansible tag _etcd_encryption_)
* Configure cluster certificates (Ansible tag _cluster_certificate_)
  * Cluster API and Ingress certificates
  * Additional Trusted CA certificates
* Label _default_ namespace to support NetworkPolicies for ingress traffic (Ansible tag _label_namespace_)
* Import Red Hat support image _must-gather_ (Ansible tag _import_support_image_)
* Control project self-provisioning (enable or disable)

Note: This role pauses the MachineConfigOperator (MCO) from rebooting nodes while applying settings

## Requirements

* Ansible > 2.9

## Role variables

|ACPR configuration variable                    |Role variable name                             |Description                                                |Default                                                       |
|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------------|
|`cust_cluster_certificates`                    |`acpr_cluster_certificates`                    |Certificates for API, Ingress and additional trust bundle  |See `acpr_cluster_certificates` variable section below        |
|`cust_cluster_credentials`                     |`acpr_cluster_credentials`                     |Dictionary containing cluster credentials                  |See `acpr_cluster_credentials` variable section below         |
|`cust_cluster_remove_kubeadmin`                |`acpr_cluster_remove_kubeadmin`                |Remove initial kubeadmin user after installation           |_true__                                                       |
|`cust_cluster_nodes`                           |`acpr_cluster_nodes`                           |List of nodes belong to the cluster                        |See `acpr_cluster_nodes` variable section below               |
|`cust_container_images_mirrors`                |`acpr_container_images_mirrors`                |ACPR dictionary of container registry mirrors              |See `acpr_container_images_mirrors` variable section below    |
|`cust_container_images_registries`             |`acpr_container_images_registries`             |ACPR dictionary of container registries configuration      |See `acpr_container_images_registries` variable section below |
|`cust_container_images_signature_verification` |`acpr_container_images_signature_verification` |Enable or disable container signature verification         |_false_                                                       |
|`cust_default_cluster_admins`                  |`acpr_default_cluster_admins`                  |A list of user with cluster admins privileges              |                                                              |
|`cust_imagepruner`                             |`acpr_imagepruner`                             |OpenShift image-pruner             configuration             |See `acpr_imagepruner` variable section below               |
|`cust_master_htpasswd_file`                    |`acpr_master_htpasswd_file`                    |Custom htpasswd location for OpenShift authentication      |                                                              |
|`cust_master_identity_providers`               |`acpr_master_identity_providers`               |Identity providers  (LDAP, OpenID and htpasswd)            |See `acpr_master_identity_providers` variable section below   |
|`cust_ntp_servers`                             |`acpr_ntp_servers`                             |List of NTP servers                                        |                                                              |  
|`cust_operatorhub_catalogsources`              |`acpr_operatorhub_catalogsources`              |Custom OpenShift Catalog sources                           |                                                              |
|`cust_operatorhub_operators`                   |`acpr_operatorhub_operators`                   |Operators to install from OperatorHub                      |                                                              |
|`cust_projecttemplate`                         |`acpr_projecttemplate`                         |Custom OpenShift project template definition               |See `acpr_projecttemplate` variable section below             |
|`cust_self_provisioners`                       |`acpr_self_provisioners`                       |Allow projects creation by any authenticated user          |_false_                                                       |


### `acpr_cluster_certificates` variable

This variable has no default values. If is not set OpenShift cluster generates
certificates by itself and sign them by its own CA authority.

```YAML
acpr_cluster_certificates:
  api:
    certificate: |
      -----BEGIN CERTIFICATE-----
      <removed>
    key: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      <removed>
  ingress:
    ca_certificate: |
      -----BEGIN CERTIFICATE-----
      <removed>
    certificate: |
      -----BEGIN CERTIFICATE-----
      <removed>
    key: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      <removed>
  additionalTrustBundle:
    ca_certificate: |
      -----BEGIN CERTIFICATE-----
      <removed>
      -----BEGIN CERTIFICATE-----
      <removed>
```

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


### `acpr_cluster_nodes` variable

This variable has no default values. If one of the node contain label
`acpr.avaloq.com/ingress-node` the role sets _IngressController_ object
to schedule router pods on the node.

```YAML
cust_cluster_nodes:
  - name: master1.example.com
    role: master
  - name: master2.example.com
    role: master
  - name: master3.example.com
    role: master
  - name: worker1.example.com
    role: worker
    labels:
      - acpr.avaloq.com/ingress-node
      - avaloq.com/zone=front-public
  - name: worker2.example.com
    role: worker
    labels:
      - acpr.avaloq.com/ingress-node
      - avaloq.com/zone=front-public
  - name: worker3.example.com
    role: worker
    labels:
      - avaloq.com/zone=core-internal
  - name: worker4.example.com
    role: worker
    labels:
      - avaloq.com/zone=core-internal
```

### `acpr_container_images_mirrors` variable

|Parameter     |Description                                    |Default    |
|--------------|-----------------------------------------------|-----------|
|`source`      |Source location of registry                    |           |
|`mirrors`     |Mirror location of registry                    |           |


```YAML
cust_container_images_mirrors:
  ose-local-storage-operator:
    source: registry.redhat.io/openshift4/ose-local-storage-operator
    mirrors:
      - registry.service.avaloq.com/openshift4/ose-local-storage-operator
```


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
|`keypath`                 |Location of GPG public key on OpenShift Node                                           |                                                 |
|`namespace_configuration` |List of container image trust configuration per namespace                              |                                                 |

### `namespace_configuration` variable

Namespace entry names for registry _AvaloqContainerImagesRepository_:

* _avaloq_
* _rhel7_
* _openshift4_
* _twistlock_

Entry variables (defaults are the values for namespace entry _avaloq_):

|Parameter    |Description                                                                    |Default    |
|-------------|-------------------------------------------------------------------------------|-----------|
|`name`       |Namespace name                                                                 |_avaloq_   |
|`trust_type` |_Atomic_ trust level (_insecureAcceptAnything_&#124;_reject_&#124;_signedBy_)  |_signedBy_ |
|`pubkeys`    |Signature public key                                                           |`pubkeys`  |

### `acpr_imagepruner` variable

This parameter configures the cronjob _image-pruner_ provided by the openshift-image-registry cluster operator

|Parameter               |Description                                                               |Default |
|------------------------|--------------------------------------------------------------------------|--------|
|`ignore_invalid_refs`   |OpenShift image pruner to ignore invalide Image references in k8s objects |_false_ |


```YAML
acpr_imagepruner:
  ignore_invalid_refs: false
```

### `acpr_master_identity_providers` variable

OpenShift 3.11 format (1) or OpenShift 4.x format (2) can be used

---
**NOTE**

The Authentication Operator in OpenShift Container Platform requires that the configured OpenID Connect 
identity provider implements the OpenID Connect Discovery specification.
Issuer Identifier described in the OpenID spec. Must use https without query or fragment component.
---

```YAML
acpr_master_identity_providers: (1)
  - name: "ActiveDirectory"
    kind: "LDAPPasswordIdentityProvider"
    url: "ldaps://ldap.example.net:636/ou=Company,dc=example,dc=net?sAMAccountName?sub?(objectClass=user)"
    login: "true"
    challenge: "true"
    attributes:
      email:
        - "mail"
      id:
        - "dn"
      name:
        - "cn"
      preferredUsername:
        - "sAMAccountName"
    bindDN: "USERNAME"
    bindPassword: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      <removed>
  - name: "OpenID"
    kind: "OpenIDIdentityProvider"
    urls:
      authorize: "https://openid.example.net/oauth2"
      token: "https://openid.example.net/oauth2"
    login: "true"
    challenge: "true"
    mappingMethod: "claim"
    ca: |
      -----BEGIN CERTIFICATE-----
      <removed>
      -----END CERTIFICATE-----
    client_id: "clientid"
    client_secret: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      <removed>
    claims:
      id:
        - "sub"
      preferredUsername:
        - "preferred_username"
      name:
        - "name"
      email:
        - "email"
  - name: "htpasswd_auth"
    challenge: "true"
    kind: "HTPasswdPasswordIdentityProvider"
    login: "true"
```

```YAML
acpr_master_identity_providers: (2)
  - ldap:
      attributes:
        email:
          - "mail"
        id:
          - "dn"
        name:
          - "cn"
      bindDN: "USERNAME"
      bindPassword:
        name: ldap-secret
      ca:
        name: ca-config-map
      insecure: false
      url: "ldaps://ldap.example.net:636/ou=Company,dc=example,dc=net?sAMAccountName?sub?(objectClass=user)"
    mappingMethod: claim
    name: "ActiveDirectory"
    type: LDAP
  - openID:
      claims:
        email:
        - "email"
        name:
        - "name"
        preferredUsername:
        - "preferred_username"
      clientID: "client_id"
      clientSecret:
        name: openid-secret
      issuer: "https://openid.example.net/oauth2"
    mappingMethod: claim
    name: "OpenID"
    type: OpenID
  - name: htpasswd_provider 
    mappingMethod: claim 
    type: HTPasswd
    htpasswd:
      fileData:
        name: htpass-secret
```

### `acpr_operatorhub_catalogsources` parameter

If you're running a _connected cluster_ this should be left empty as the OperatorHub will
be connected to Red Hat's CDN.

```YAML
cust_operatorhub_catalogsources:
  acpr-certified-operators:
    displayname: Red Hat Certified Operators
    image: registry.example.com/redhat-operator-index/certified-operator-index:v4.6
  company-community-operators:
    displayname: Community Operators
    image: registry.example.com/redhat/community-operator-index:latest
  acpr-redhat-marketplace:
    displayname: Red Hat Marketplace
    image: registry.example.com/redhat/redhat-marketplace-index:v4.6
  acpr-redhat-operators:
    displayname: Red Hat Operators
    image: registry.example.com/redhat-operator-index/redhat-operator-index:v4.6
```

**Note**: You must ensure the used registry URLs are part of `cust_container_images_registries` parameter.

**Note**: Name of the catalogsource must not be any of 'certified-operators', 'community-operators', 'redhat-marketplace' or 'redhat-operators'

### `acpr_projecttemplate` parameter

```YAML
acpr_projecttemplate:
  labels:
    example.com/label1: value1
    example.com/label2: value2
  serviceaccount:
    - apiVersion: v1
      kind: ServiceAccount
      metadata:
        name: user-one
        namespace: ${PROJECT_NAME}
    - apiVersion: v1
      kind: ServiceAccount
      metadata:
        name: user-two
        namespace: ${PROJECT_NAME}
  resourcequota:
    limits.cpu: '1'
    limits.memory: '8Gi'
    requests.cpu: '1'
    requests.memory: '8Gi'
    pods: 25
  limitrange:
    - type: "Pod"
      max:
        cpu: "2" 
        memory: "1Gi" 
      min:
        cpu: "200m" 
        memory: "6Mi" 
    - type: "Container"
      max:
        cpu: "2" 
        memory: "1Gi" 
      min:
        cpu: "100m" 
        memory: "4Mi" 
      default:
        cpu: "300m" 
        memory: "200Mi" 
      defaultRequest:
        cpu: "200m" 
        memory: "100Mi" 
      maxLimitRequestRatio:
        cpu: "10"  
  rolebinding:
  - apiVersion: rbac.authorization.k8s.io/v1
    kind: RoleBinding
    metadata:
      name: admin
      namespace: ${PROJECT_NAME}
    roleRef:
      apiGroup: rbac.authorization.k8s.io
      kind: ClusterRole
      name: admin
    subjects:
    - kind: User
      name: admin
```
