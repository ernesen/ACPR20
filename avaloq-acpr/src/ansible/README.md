# Avaloq Container Platform Reference (ACPR) Ansible code

Ansible code to provision, install and manage an ACPR OpenShift cluster.

## Content overview

```
ansible
├── playbooks       // Ansible playbooks
|   ├── group_vars
|   ├── library
|   └── vars
└── roles           // Ansible roles
```

### Ansible playbooks

Following Ansible playbooks are provided:

#### Installation (100)

- *[acpr-110-generate-inventory.yml](playbooks/acpr-110-generate-inventory.yml)* -
  ACPR inventory and configuration generation for OpenShift 3.11.x clusters
- *[acpr-ocp4-110-generate-inventory.yml](playbooks/acpr-ocp4-110-generate-inventory.yml)* -
  ACPR inventory and configuration generation for OpenShift 4.x clusters
- *[acpr-120-prepare-environment.yml](playbooks/acpr-120-prepare-environment.yml)* -
  OpenShift 3.11.x ACPR repositories and prerequisites setup
- *[acpr-121-avaloq-configure-administration-host.yml](playbooks/acpr-121-avaloq-configure-administration-host.yml)* -
  OpenShift 3.11.x ACPR administration host repositories and prerequisites configuration
- *[acpr-ocp4-120-avaloq-configure-administration-host.yml](playbooks/acpr-ocp4-120-avaloq-configure-administration-host.yml)* -
  OpenShift 4.x ACPR administration host configuration
- *[acpr-ocp4-121-haproxy.yml](playbooks/acpr-ocp4-121-haproxy.yml)* -
  OpenShift 4.x HAProxy load balancer installation and configuration
- *[acpr-130-install.yml](playbooks/acpr-130-install.yml)* -
  OpenShift 3.11.x installation
- *[acpr-ocp4-120-avaloq-configure-administration-host](playbooks/acpr-ocp4-120-avaloq-configure-administration-host)* -
  OpenShift 4.x configure administration host
- *[acpr-ocp4-130-openshift-install-cluster.yml](playbooks/acpr-ocp4-130-openshift-install-cluster.yml)* -
  OpenShift 4.x installation
- *[acpr-140-post-install.yml](playbooks/acpr-140-post-install.yml)* -
  OpenShift 3.11.x post- installation
- *[acpr-150-storage-nfs.yml](playbooks/acpr-150-storage-nfs.yml)* -
  ACPR Network File System (NFS) storage setup for OpenShift 3.11.x clusters
- *[acpr-ocp4-150-storage-nfs.yml](playbooks/acpr-ocp4-150-storage-nfs.yml)* -
  ACPR Network File System (NFS) storage setup for OpenShift 4.x clusters
- *[acpr-160-hardening.yml](playbooks/acpr-160-hardening.yml)* -
  OpenShift 3.11.x ACPR OpenShift hardening
- *[acpr-170-install-logging.yml](playbooks/acpr-170-install-logging.yml)* -
  OpenShift 3.11.x logging stack installation
- *[acpr-171-additional-fluentd-daemonset.yml](playbooks/acpr-171-additional-fluentd-daemonset.yml)* -
  Optional additional fluentd DaemonSets configuration

#### Configuration and Deployment (200)

- *[acpr-ocp4-210-openshift-configure-cluster.yml](playbooks/acpr-ocp4-210-openshift-configure-cluster.yml)* -
  OpenShift 4.x cluster configuration
- *[acpr-210-deploy-storage-classes.yml](playbooks/acpr-210-deploy-storage-classes.yml)* -
  ACPR Storage Class objects setup in OpenShift 3.11.x clusters
- *[acpr-ocp4-220-deploy-storage-classes.yml](playbooks/acpr-210-deploy-storage-classes.yml)* -
  ACPR Storage Class objects setup OpenShift 4.x clusters
- *[acpr-220-deploy-persistent-volumes.yml](playbooks/acpr-220-deploy-persistent-volumes.yml)* -
  ACPR Persistent Volumes setup in OpenShift 3.11.x clusters
- *[acpr-ocp4-221-deploy-persistent-volumes.yml](playbooks/acpr-ocp4-221-deploy-persistent-volumes.yml)* -
  ACPR Persistent Volumes setup in OpenShift 4.x clusters
- *[acpr-230-deploy-monitoring.yml](playbooks/acpr-230-deploy-monitoring.yml)* -
  ACPR Monitoring setup
- *[acpr-ocp4-230-openshift-monitoring.yml](playbooks/acpr-ocp4-230-openshift-monitoring.yml)* -
  OpenShift Monitoring setup
- *[acpr-240-configure-logging.yml](playbooks/acpr-240-configure-logging.yml)* -
  OpenShift logging stack configuration
- *[acpr-ocp4-240-openshift-logging.yml](playbooks/acpr-ocp4-240-openshift-logging.yml)* -
  OpenShift 4.x logging stack configuration
- *[acpr-ocp4-241-openshift-logging-management-state.yml](playbooks/acpr-ocp4-241-openshift-logging-management-state.yml)* -
  OpenShift 4.x logging set to Unmanaged
- *[acpr-ocp4-250-install-operators.yml](playbooks/acpr-ocp4-250-install-operators.yml)* -
  Install Operators provided by OperatorHub on OpenShift 4.x
#### Third-party deployments (400)

- *[acpr-410-deploy-twistlock.yml](playbooks/acpr-410-deploy-twistlock.yml)* -
  Twistlock deployment
- *[acpr-420-prismacloud.yml](playbooks/acpr-420-prismacloud.yml)* -
  Prisma Cloud deployment on OpenShift 3.11.x
- *[acpr-ocp4-420-prismacloud.yml](playbooks/acpr-ocp4-420-prismacloud.yml)* -
  Prisma Cloud deployment on OpenShift 4.x

#### Application deployments (600)

- *[acpr-610-deploy-operator-strimzi.yml](playbooks/acpr-610-deploy-operator-strimzi.yml)* -
  Kafka Strimzi Operator deployment on OpenShift 3.11.x
- *[acpr-ocp4-610-deploy-operator-strimzi.yml](playbooks/acpr-ocp4-610-deploy-operator-strimzi.yml)* -
  Kafka Strimzi Operator deployment on OpenShift 4.x
- *[acpr-620-deploy-operator-database.yml](playbooks/acpr-620-deploy-operator-database.yml)* -
  Avaloq Database Operator deployment on OpenShift 3.11.x
- *[acpr-ocp4-620-deploy-operator-database.yml](playbooks/acpr-ocp4-620-deploy-operator-database.yml)* -
  Avaloq Database Operator deployment on OpenShift 4.x
- *[acpr-630-deploy-operator-oauthclient.yml](playbooks/acpr-630-deploy-operator-oauthclient.yml)* -
  Avaloq OAuthClient Operator deployment on OpenShift 3.11.x
- *[acpr-ocp4-630-deploy-operator-oauthclient.yml](playbooks/acpr-ocp4-630-deploy-operator-oauthclient.yml)* -
  Avaloq OAuthClient Operator deployment on OpenShift 4.x
- *[acpr-640-deploy-operator-sealed-secrets.yml](playbooks/acpr-640-deploy-operator-sealed-secrets.yml)* -
  Sealed Secrets Operator deployment on OpenShift 3.11.x
- *[acpr-ocp4-640-deploy-operator-sealed-secrets.yml](playbooks/acpr-ocp4-640-deploy-operator-sealed-secrets.yml)* -
  Sealed Secrets Operator deployment on OpenShift 4.x

#### Reporting (700)

- *[acpr-710-validate-cluster.yml](playbooks/acpr-710-validate-cluster.yml)* -
  ACPR OpenShift ACPR compliant check playbook
- *[acpr-710-validate-cluster.yml](acpr-ocp4-710-validate-cluster.yml)* -
  ACPR OpenShift ACPR compliant check playbook
- *[acpr-711-validate-images-existence.yml](playbooks/acpr-711-validate-images-existence.yml)*
  Registry images existence check
- *[acpr-720-report-certificate-expiration.yml](playbooks/acpr-720-report-certificate-expiration.yml)* -
  ACPR OpenShift certificate expiration report
- *[acpr-730-acpr-status.yml](playbooks/acpr-730-acpr-status.yml)* -
  OpenShift ACPR status
- *[acpr-740-installator-lint.yml](playbooks/acpr-740-installator-lint.yml)* -
  OpenShift ACPR-compliancy check (Avaloq Installator-based)
- *[acpr-740-installator-lint.yml](acpr-ocp4-740-installator-lint.yml)* -
  OpenShift ACPR-compliancy check (Avaloq Installator-based)

#### Utilities (800)

- *[acpr-810-upgrade-system.yml](playbooks/acpr-810-upgrade-system.yml)* -
  Upgrade Red Hat Enterprise Linux (RHEL)
- *[acpr-820-upgrade-ose-prerequisites.yml](playbooks/acpr-820-upgrade-ose-prerequisites.yml)* -
  OpenShift upgrade prerequisites preparation
- *[acpr-821-storage-migr.yml](playbooks/acpr-821-storage-migr.yml)* -
  OpenShift storage migration (*etcd*)
- *[acpr-830-upgrade-ose.yml](playbooks/acpr-830-upgrade-ose.yml)* -
  OpenShift 3.11.x cluster upgrade
- *[acpr-830-ocp4-upgrade-ocp.yml](playbooks/acpr-ocp4-830-upgrade-ocp.yml)* -
  OpenShift 4.x cluster upgrade
- *[acpr-831-upgrade-efk.yml](playbooks/acpr-831-upgrade-efk.yml)* -
  EFK Logging stack upgrade
- *[acpr-850-apply-objects.yml](playbooks/acpr-850-apply-objects.yml)* -
  Apply OpenShift objects to an OpenShift 3.11.x cluster
- *[acpr-ocp4-850-apply-objects.yml](playbooks/acpr-ocp4-850-apply-objects.yml)* -
  Apply OpenShift objects to an OpenShift 4.x cluster
- *[acpr-860-configuration-branding.yml](playbooks/acpr-860-configuration-branding.yml)* -
  ACPR Web console custom configuration
- *[acpr-890-cluster-state.yml](playbooks/acpr-890-cluster-state.yml)* -
  ACPR Cluster health verification
- *[acpr-891-efk-state.yml](playbooks/acpr-891-efk-state.yml)* -
  EFK Logging stack health verification

#### Administration (900)

- *[acpr-910-backup-ose.yml](playbooks/acpr-910-backup-ose.yml)* -
  ACPR OpenShift backup and restore
- *[acpr-920-login.yml](playbooks/acpr-920-login.yml)* -
  Login to a cluster
- *[acpr-921-logout.yml](playbooks/acpr-921-logout.yml)* -
  Logout from a cluster
- *[acpr-930-reconfigure-docker.yml](playbooks/acpr-930-reconfigure-docker.yml)* -
  Deploy *docker* configuration
- *[acpr-940-label-nodes.yml](playbooks/acpr-940-label-nodes.yml)* -
  Add labels to OpenShift 3.11.x cluster nodes
- *[acpr-ocp4-940-label-nodes.yml](playbooks/acpr-ocp4-940-label-nodes.yml)* -
  Add labels to OpenShift 4.x cluster nodes
- *[acpr-950-prepull-and-sign-images.yml](playbooks/acpr-950-prepull-and-sign-images.yml)* -
  Pre-pull and sign images from remote registry
- *[acpr-960-cleanup-container-image-cache.yml](playbooks/acpr-960-cleanup-container-image-cache.yml)* -
  Cleanup container image cache
- *[acpr-970-add-node.yml](playbooks/acpr-970-add-node.yml)* -
  ACPR Add infrastructure or application node to cluster
- *[acpr-971-add-master-node.yml](playbooks/acpr-971-add-master-node.yml)* -
  ACPR Add master node to cluster
- *[acpr-972-transition-registry.yml](playbooks/acpr-972-transition-registry.yml)* -
  Transition container image registry
- *[acpr-973-add-egress.yml](playbooks/acpr-973-add-egress.yml)* -
  Add egress IP to an OpenShift 3.11.x cluster
- *[acpr-ocp4-973-egress.yml](playbooks/acpr-ocp4-973-egress.yml)* -
  Add egress IP to an OpenShift 4.x cluster
- *[acpr-980-reconfigure-auth.yml](playbooks/acpr-980-reconfigure-auth.yml)* -
  ACPR Add/Modify OpenShift authentication providers
- *[acpr-990-destroy-prep.yml](playbooks/acpr-990-destroy-prep.yml)* -
  ACPR uninstall preparation steps
- *[acpr-991-destroy.yml](playbooks/acpr-991-destroy.yml)* -
  ACPR uninstall
- *[acpr-992-destroy-storage.yml](playbooks/acpr-992-destroy-storage.yml)* -
  ACPR uninstall storage (delete data)


### Ansible roles

Following Ansible roles are provided (alphabetical order, consumed by playbooks):

#### Provisioning

* *[avaloq.acpr-ocp4-webserver](roles/avaloq.acpr-ocp4-webserver/README.md)* -
  Web-server setup to provide CoreOS ignition files (OpenShift 4.x)

#### Installation and configuration

* *[avaloq.acpr-docker](roles/avaloq.acpr-docker/README.md)* -
  ACPR docker build host
* *[avaloq.acpr-etcd](roles/avaloq.acpr-etcd/README.md)* -
  ACPR *etcd* configuration
* *[avaloq.acpr-inventory](roles/avaloq.acpr-inventory/README.md)* -
  ACPR OpenShift inventory generation
* *[avaloq.acpr-storage-nfs](roles/avaloq.acpr-storage-nfs/README.md)* -
  ACPR Network File System (NFS) storage
* *[avaloq.acpr-prepare-environments](roles/avaloq.acpr-prepare-environments/README.md)* -
  ACPR installation prerequisites
* *[avaloq.acpr-repository](roles/avaloq.acpr-repository/README.md)* -
  ACPR OpenShift repositories setup
* *[avaloq.acpr-storage-classes](roles/avaloq.acpr-storage-classes/README.md)* -
  ACPR OpenShift Storage Class objects
* *[avaloq.acpr-ocp4-configure-administration-host](roles/avaloq.acpr-ocp4-configure-administration-host/README.md)* -
  OpenShift 4.x administration host configuration
* *[avaloq.acpr-ocp4-configure-cluster](roles/avaloq.acpr-ocp4-configure-cluster/README.md)* -
  OpenShift 4.x cluster configuration
* *[avaloq.acpr-ocp4-haproxy](roles/avaloq.acpr-ocp4-haproxy/README.md)* -
  OpenShift 4.x HAProxy load balancer installation and configuration
* *[avaloq.acpr-ocp4-manage-operators](roles/avaloq.acpr-ocp4-manage-operators/README.md)* -
  OpenShift 4.x OperatorHub operators installation

#### Deployments

* *[avaloq.acpr-logging](roles/avaloq.acpr-logging/README.md)* -
  ACPR Logging setup
* *[avaloq.acpr-monitoring](roles/avaloq.acpr-monitoring/README.md)* -
  ACPR Monitoring setup
* *[avaloq.acpr-persistent-volumes](roles/avaloq.acpr-persistent-volumes/README.md)* -
  ACPR Persistent Volumes

#### Application deployments

* *[avaloq.acpr-operator-strimzi](roles/avaloq.acpr-operator-strimzi/README.md)* -
  ACPR Kafka Strimzi Operator deployment
* *[avaloq.acpr-operator-database](roles/avaloq.acpr-operator-database/README.md)* -
  ACPR Avaloq Database Operator deployment
* *[avaloq.acpr-operator-oauthclient](roles/avaloq.acpr-operator-oauthclient/README.md)* -
  ACPR Avaloq OAuthCLient Operator deployment
* *[avaloq.constellation-deployment](roles/avaloq.constellation-deployment/README.md)* -
  ACPR Avaloq Constellation deployment
  
#### Third-party application deployments

* *[avaloq.acpr-twistlock](roles/avaloq.acpr-twistlock/README.md)* -
  Twistlock deployment
* *[avaloq.acpr-prismacloud](roles/avaloq.acpr-prismacloud/README.md)* -
  Prisma Cloud deployment
* *[avaloq.acpr-operator-sealed-secrets](roles/avaloq.acpr-operator-sealed-secrets)* -
  Sealed Secrets Operator deployment

#### Reporting

* *[avaloq.acpr-hardening](roles/avaloq.acpr-hardening/README.md)* -
  ACPR OpenShift hardening
* *[avaloq.acpr-status](roles/avaloq.acpr-status/README.md)* -
  OpenShift ACPR status
* *[avaloq.acpr-validate-cluster](roles/avaloq.acpr-validate-cluster/README.md)* -
  OpenShift ACPR-compliancy check
* *[avaloq.acpr-installator-lint](roles/avaloq.acpr-installator-lint/README.md)* -
  OpenShift ACPR-compliancy check (Avaloq Installator-based)

#### Utilities

* *[avaloq.acpr-auth](roles/avaloq.acpr-auth/README.md)* -
  ACPR technical login/logout functionality for OpenShift 3.11.x clusters
* *[avaloq.acpr-ocp4-auth](roles/avaloq.acpr-ocp4-auth/README.md)* -
  ACPR technical login/logout functionality for OpenShift 4.x clusters

#### Administration

* *[avaloq.acpr-utils](roles/avaloq.acpr-utils/README.md)* -
  ACPR utils role for OpenShift 3.11.x clusters
* *[avaloq.acpr-ocp4-utils](roles/avaloq.acpr-ocp4-utils/README.md)* -
  ACPR utils role for OpenShift 4.x clusters
* *[avaloq.acpr-backup](roles/avaloq.acpr-backup/README.md)* -
  ACPR OpenShift backup and restore
* *[avaloq.acpr-ocp4-upgrade-cluster](roles/avaloq.acpr-ocp4-upgrade-cluster/README.md)* -
  OpenShift 4.x cluster upgrade

### Handling sensitive data with Ansible Vault

In order to protect sensitive data such as passwords or keys refer to the following
resources:

* [ACPR Ansible Vault documentation](https://docs.avaloq.com/tools/avaloqcontainerplatform/050_InstallAvaloqContainerPlatform/020_AcprConfigurationAndOpenShiftClusterInstallation/010_AcprConfiguration/020_AnsibleVault.html)
* [Ansible Vault documentation](https://docs.ansible.com/ansible/latest/user_guide/vault.html)


## Getting Started

Refer to the documentation [https://docs.avaloq.com/acpr](https://docs.avaloq.com/acpr).

## Built with

* [Ansible](https://www.ansible.com/) - Red Hat agentless IT automation tool
