# Changelog

All notable changes to the Avaloq Container Platform Reference (ACPR) code-base and documentation project
will be documented in this file.

Refer to the online [https://docs.avaloq.com/acpr]() for more information.

>**NOTE**: Review the online documentation _Release notes, upgrades, and migration
>guides_ for announcements, breaking changes, upgrade, and migration procedures.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [5.7.0] - 2021-08-03
### Added
- Documentation: *Manage Avaloq Container Platform - Node Labels* section
  *ACPR labels for Ingress and Egress*
- Documentation: 'Certificates redeployment': Nodes certificates replacement procedure
- Documentation: 'Tech Req.': Removed NFS storage requirement for Avaloq Prometheus Rule
  Provisioner operator
- AvaloqParameter in '*openshift-logging-operator*' and '*openshift-logging*'
  constellations to set a specific version of the operator
- Support for OpenShift v4.6.38
- Support for OpenShift version 3.11.465
- ENV variable `PROCESS_RULE_TYPES` used in Prometheus Rule Provisioner for checks and
  post-processing rule attributes
- AvaloqParameter to suppress deployment of Secrets in '*avaloq-acpr-monitoring*'
  constellation to support Sealed Secret
- Prometheus volume size alerts in '*avaloq-acpr-monitoring* constellation
### Changed
- Variable `cust_operatorhub_operators` to set specific version of operators
- Remove dependency on NFS storage mode _Read Write Many_ (RWX) of Avaloq Prometheus
  Rule Provisioner (Installator-based configuration only)
- Use Prometheus Rule Provisioner operator v0.2.2 in '*avaloq-acpr-monitoring*'
  constellation
- Default value of _cust_egress_node_label_ set to _acpr.avaloq.com/egress-node_ 
  on OpenShift 4.x
- Consolidated the use of Ansible variable `acpr_machineconfig_defaults`
- Use Prometheus Rule Provisioner operator v0.2.4 in '*avaloq-acpr-monitoring*'
  constellation
- Remove dependency on label _app_ in Ansible playbook
  '*acpr-ocp4-230-openshift-monitoring.yml*' for OpenShift 4.8 compatibility
### Fixed
- ACPR Monitoring installation failure on OpenShift 3.11 when Ansible deployment method 
  is used
- OpenShift 4.x installation takes into account Ansible variable `cust_os_version`
- Ansible role '*acpr-ocp4-420-prismacloud.yml*' fails with unauthorized error message
- Ansible task 'Logout from the cluster' fails when OAuth operator is in degraded state
- Add 2 infra nodes to ACPR-cicd02
- Ansible task 'Remove {{ wdir }}' when a variable avq_clusteradmin_available is not set

## [5.6.0] - 2021-07-21
### Added
- Documentation: *Architecture - Cluster internals* section *OLM*
- AvaloqParameter to suppress deployment of secrets in '*avaloq-acpr-monitoring*'
  constellation to support sealed secrets
- AvaloqParameter to suppress deployment of PersitentVolumeClaims in
  '*avaloq-acpr-monitoring* constellation to support local storage
- Ansible playbooks '*acpr-420-prismacloud.yml*' and '*acpr-ocp4-420-prismacloud.yml*'
  to deploy Prisma Cloud (formerly Twistlock)
- Add 'shared-cluster' example file for cluster admin
- Variable `cust_imagepruner` to configure OpenShift ImagePruner behavior using Ansible
  playbook '*acpr-ocp4-210-openshift-configure-cluster.yml*'
- Readiness probes to Alertmanager and Prometheus in
  '*avaloq-acpr-monitoring*' constellation
- Support locally installed GPG key for signature verification
- ACPR-example files for _connected_ and _disconnected_ OpenShift 4.x clusters
- ACPR-example configuration files for _connected_ and _disconnected_ OpenShift 4.x
  clusters
### Changed
- Documentation: Update Grafana Dashboard Provisioner requirements for dashboard definitions
- Ansible Kubernetes modules do not verify certificates by default
- Use Grafana Dashboard Provisioner operator v0.6.4 in
  '*avaloq-acpr-monitoring*' constellation
- Move 'rsync' installation from constellation deployment in the administration host preparation
### Fixed
- API and Ingress certificates are stored in wrong secret type _Opaque_ instead
  of _kubernetes.io/tls_

## [5.5.0] - 2021-07-06
### Added
- Possibility to exclude objects in Ansible role '*avaloq.constellation-deployment*'
- Support for OpenShift v4.7.18
### Changed
- Documentation: *Release notes, upgrades, and migration guides* align formatting of
  _Breaking changes_ section
- Grafana dashboard *Topic: OpenShift Fluentd* showing name of underlying OpenShift node
  instead of fluentd pod name
- Prometheus alerts PAM48, PAM70- PAM73 showing name of underlying OpenShift node instead
  of fluentd pod name
- New default value of AvaloqParameter `OPENSHIFT_LOGGING_SUBSCRIPTION_SOURCE` in
  '*openshift-logging*' constellation
- Ansible playbook '*acpr-ocp4-970-add-node.yml*' retries until all nodes are added with
  a timeout of 1 hour
- Use Grafana Dashboard Provisioner operator v0.6.3 in
  '*avaloq-acpr-monitoring*' constellation
### Fixed
- Documentation: *Application Deployment - Avaloq ACPR Monitoring* example code snippet
  wrongly refers to 'openshift_monitoring_acpr-monitoring_password' instead of
  'openshift_monitoring_acpr-monitoring_secret'
- Logout from OpenShift 4 cluster when using username and password
- Ansible playbook '*acpr-ocp4-210-openshift-configure-cluster.yml*' when
  `cust_cluster_credentials` variable is not set
- Grafana dashboard *Topic: OpenShift Fluentd* wrongly showing number of unavailable
  fluentd instances over time instead of current value
- Ansible playbook 'acpr-ocp4-610-deploy-operator-strimzi' fails when run as root (become)

## [5.4.0] - 2021-06-22
### Added
- Add new parameters `AVALOQ_PROMETHEUS_RULE_PROVISIONER_LOGGING_LEVELS` and
  `AVALOQ_GRAFANA_DASHBOARD_PROVISIONER_LOGGING_LEVELS` for custom logging level in
  Prometheus Rule Provisioner and Grafana Dashboard Provisioner operators
- Ansible option `any_errors_fatal` to playbooks to abort execution on the first error
### Changed
- Support for Avaloq Installator v1.10.0
- Increase HAProxy timeout to 600 seconds in Prometheus route
- Set  HAProxy timeout in Grafana route
- Use Prometheus Rule Provisioner operator v0.2.1 in
  '*avaloq-acpr-monitoring*' constellation
- Use Grafana Dashboard Provisioner operator v0.6.2 in
  '*avaloq-acpr-monitoring*' constellation

## [5.3.0] - 2021-06-08
### Added
- Add MachineConfig verification to Ansible playbook
  '*acpr-ocp4-230-deploy-monitoring.yml*'
- Support for OpenShift version 3.11.439
- Ansible playbook '*acpr-ocp4-241-openshift-logging-management-state.yml*' uses new
  constellation '*openshift-logging-fluentd*' in order to allow detailed fluentd buffer
  configuration
- Ansible variable `cust_kubeletconfig` to configure allocated resources for nodes
- Support for OpenShift v4.6.29
- Explicit API version to OpeShift objects
### Changed
- Support ignition 3.1.0 in ACPR provided MachineConfig objects
- Use Prometheus Rule Provisioner operator v0.2.0 in
  '*avaloq-acpr-monitoring*' constellation
- Remove sensitive data from Prometheus Rule Provisioner operator environment variables
### Fixed
- Pods stuck in _ContainerCreating_ on OpenShift 4.6

## [5.2.0] - 2021-05-25
### Added
- Ansible variable `cust_cluster_credentials` sanity checks
### Changed
- Use Avaloq OauthClient operator v0.1.3
- ACPR Monitoring Prometheus drops label 'prometheus_replica' from all metrics coming from
  Prometheus in 'openshift-monitoring' namespace

## [5.1.1] - 2021-05-17
### Fixed
- Support for Avaloq Installator v1.9.2 (provides few important fixes)
- Ansible role '*avaloq.constellation-deployment*' fails if `AVALOQ_INSTALLATOR_OPTS`
  Installator environment variable is empty
- Avaloq Installator-based configuration pattern for '*avaloq-database-operator*'
  deployment is not available

## [5.1.0] - 2021-05-11
### Added
- Support for OpenShift v4.6.26
- Support for OpenShift version 3.11.420
- Ansible variable `acd_inst_opts` to configure Avaloq Installator environment variable
  `AVALOQ_INSTALLATOR_OPTS`
- Creation on _inventory_ and _inventory/group_vars_ folders
### Changed
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning* removed
  section about Amazon Web Services (AWS)
- Documentation: *Release notes, upgrades, and migration guides* topics newly summarize
  previous announcements, known issues and breaking changes
- Avaloq Database operator is configured and deployed to OpenShift 4 clusters by default
  with the Installator pattern
- Use '*avaloq/avaloq-grafana-dashboard-provisioner:0.6.1*' to address vulnerabilities
- Increase 'wait_timeout' to 2 minutes in Ansible task 'Scale up Grafana Deployment' in
  Ansible playbook '*acpr-ocp4-230-openshift-monitoring.yml*'
- De-released Ansible roles '*avaloq.acpr-aws-static-provision*',
  '*avaloq.acpr-aws-provision*' and '*avaloq.acpr-aws-configuration*' and corresponding
  playbooks for provisioning ACPR infrastructure on Amazon Web Services (AWS)
- Update Avaloq Database operator default CPU request to `150m` according to normal
  operations observation
- Replace openshift api to kubernetes api references in 'ClusterRole' and
  'ClusterRoleBinding' objects
### Fixed
- Documentation: *Application Deployment - Avaloq Database Operator* refers to Oracle
  database object `V$PARAMETER` instead of `V_$PARAMETER`
- Avaloq Installator marks '*avaloq-acpr-monitoring*' deployment as different when
  'storageClass' in PersistentVolumeClaims or 'host' in Route is not set
- Default OpenShift project template is not applied when `cust_projecttemplate` is not set

## [5.0.0] - 2021-04-28
### Added
- Support for Avaloq Installator v1.9.1
- Label `avaloq.com/zone` to all ACPR deployments
### Changed
- ACPR configuration file location moved to _avaloq-acpr/src/acpr/_ folder
- Use Avaloq Grafana Dashboard Provisioner operator v0.6.1 in '*avaloq-acpr-monitoring*'
- Use Avaloq Database operator v0.7.1

## [4.12.0] - 2021-04-27
### Added
- Documentation: *Application Deployment - Avaloq ACPR Monitoring* minimal installation
  tutorial and installation on a shared cluster
- Ansible playbook '*acpr-ocp4-241-openshift-logging-management-state.yml*' to set
  'openshift-logging' stack to Unmanaged mode for enabling JSON log parsing
- Ansible playbook '*acpr-171-additional-fluentd-daemonset.yml*' and Ansible variable
  `cust_additional_fluentd_daemonset` to deploy additional fluentd DaemonSets on
  OpenShift 3.11
- Support for OpenShift version 3.11.404
### Changed
- Remove MachineConfig verification from Ansible playbook
  '*acpr-ocp4-230-deploy-monitoring.yml*'
### Fixed
- JSON log entries are not parsed properly
- AvaloqPatch 'retentionpolicy-audit-maxage' and 'retentionpolicy-infra-maxage' are not
  processed properly

## [4.11.0] - 2021-04-14
### Added
- New variable in '*openshift-logging*' constellation to set Elasticsearch redundancy
  policy
- Monitoring and Logging links to OpenShift 4.x console application menu
- Ansible variable `cust_console_links` to customize application and help menu items in
  OpenShift 4.x console
- Ansible variable `cust_console_notifications` to configure OpenShift 4.x UI notification
- Ansible variable `cust_console_motd` to configure OpenShift 4.x CLI Message of the day
- Ansible role '*avaloq.acpr-ocp4-haproxy*' to optionally install and configure load balancer for
  OpenShift 4.x cluster
- Label _app.kubernetes.io/managed-by=avaloq-acpr_ to identify resources created or
  updated by ACPR
### Changed
- Documentation: *Application Deployment - Requirements - Avaloq Database Operator* to
  list newly required permissions on Oracle for the `DBOP_ADM` user required by the
  _Avaloq Database Operator_
- Ansible playbook '*acpr-992-destroy-storage.yml*' is compatible with OpenShift 4
- Ansible playbook '*acpr-ocp4-970-add-node.yml*' verifies new joining nodes against
  in `cust_cluster_nodes`
- Avaloq Database operator deployment uses Ansible only
### Fixed
- Ansible variable `cust_pull_secret` does not enable image signature verification in
  OpenShift 4
- Worker ignition file's certificate update during Ansible playbook
  '*acpr-ocp4-970-add-node.yml*' execution

## [4.10.0] - 2021-03-30
### Added
- Support for OpenShift v3.11.394
### Changed
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration - OpenShift configuration* `cust_operatorhub_catalogsources`: List with
  unusable resource names
- Increase HAProxy timeout in 'prometheus' route in '*avaloq-acpr-monitoring*'
- Ansible role '*avaloq.acpr-ocp4-ignition-files*' backups _install-config.yaml_ file
- Prometheus in 'acpr-monitoring' namespace scrapes some metrics from Prometheus in
### Fixed
- Using reserved _Catalogsource_ names
- SDN services IP allocation in OpenShift 4.x
- Secret creation when HTPasswd identity provider is used
- Multiple identity providers configuration
- Failing Prometheus start in OpenShift 4.x due to missing etcd certificate volume

## [4.9.0] - 2021-03-16
### Added
- Documentation: *Avaloq products - Container images* topic: vulnerability package name
  and version information
- Support for OpenShift v4.6.19
- Ansible variable `cust_os_channel` to select OpenShift 4 upgrade channel
- Ansible variable `cust_container_images_mirrors` to configure additional mirrored
  container registries in OpenShift 4 clusters
- Add new parameter `CONSTELLATION_FILE_PATH` to Avaloq constellation deployment Jenkins
  pipeline (*Jenkinsfile*)
- Ansible playbook '*acpr-ocp4-710-validate-cluster.yml*' to validate OpenShift 4.x
- Ansible playbook '*acpr-ocp4-740-installator-lint.yml*' to validate OpenShift 4.x
### Changed
- Subscription channel of openshft-logging operator to _4.6_
- Ansible role '*avaloq.acpr-ocp4-upgrade-cluster*' to support OpenShift upgrade of
  connected clusters
- Default value of `cust_registry_location` removed
- Set openshift-cluster-samples-operator to Removed
### Fixed
- Documentation: *Avaloq products - Container images* topic: some empty security report
- _Channel_ value must be a string in Ansible role '*avaloq.acpr-ocp4-manage-operators*'
- Variable `cust_self_provisioners` is not properly templated
- Ansible playbook '*acpr-ocp4-973-egress.yml*' fails with unknown certificate
- Import of task _update_kubeconfig_ca.yml_ in Ansible role
  '*avaloq.acpr-ocp4-configure-cluster*' when Ansible tags are in use

## [4.8.0] - 2021-03-03
### Added
- Documentation: OpenShift 4.x support (see Release Notes)
- Documentation: *Architecture*: OpenShift 4.x communications diagram
- Documentation: *ACPR OpenShift installation - Infrastructure prerequisites*:
  OpenShift 4.x sections review (Firewall, DNS, Load balancer)
- Documentation: *ACPR OpenShift installation - Configuration*: overview diagram
- Documentation: *Manage Avaloq Container Platform - Networking and egress - Manage
  egress*
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration - OpenShift configuration* `cust_pull_secret` parameter
- Support for OpenShift v4.6.8
- Support for OpenShift v3.11.380
- Ansible playbook '*acpr-ocp4-250-openshift-install-operators.yml*' and corresponding
  role '*avaloq.acpr-ocp4-manage-operators*' to install OperatorHub operators
- Ansible playbook '*acpr-ocp4-830-upgrade-cluster.yml*' with corresponding Ansible role
  '*avaloq.acpr-ocp4-upgrade-cluster*' to upgrade OpenShift 4.x cluster
- _IngressController_ object configuration via Ansible role
  '*avaloq.acpr-ocp4-configure-cluster*' to control router pods placement
- Ansible variable `cust_webserver` to manage Administration host webserver deployment
- Ansible variable `cust_webserver_ignition_file_path` to set user defined Administration
  host ignition file generation location
- Ansible variable `cust_self_provisioners` to allow namespace (aka project) creation by
  authenticated users
- Ansible variable `cust_redhat_disconnected` to disable Red Hat cluster registration
- Ansible variable `cust_operatorhub_catalogsources` to manage OperatorHub catalog
  resources (incl. air gapped cluster configuration)
### Changed
- Closed _beta_ phase for OpenShift 4.x support
- Documentation: *Architecture - Cluster internals* subtopics: sections review
- Documentation: ACPR OpenShift 4.x abd 3.11.x example configuration review
- Documentation: *Manage Avaloq Container Platform - Add Custom CA Certificate - Add
  trusted root certificates to Linux servers* section
- Documentation: Term 'Constellator' is renamed to 'Delivery tool'
- Documentation: *Manage Avaloq Container Platform - Networking and egress -
  Troubleshooting* moved to *Troubleshooting*
- Updated '*avaloq-database-operator*' image version from 0.6.0 to 0.7.0
- Increase time in Prometheus rule '_FluentdRecordsCountsHigh _' (`PAM70`) to 10 minutes
- De- release inadvertently released Ansible playbook
  '*acpr-650-deploy-operator-elasticsearch.yml*' and role
  '*avaloq.acpr-operator-elasticsearch*'
- Add delay to Prometheus alerts '_NodeExporterIsNotReachable_' (`PAM47`) and
  '_ElasticSearchTooManyIndexFailures_' (`PAM43`)
### Fixed
- Ansible role '*avaloq.acpr-ocp4-backup*' fails when proxy variables are not set
- Deploying API certificates breaks _kubeconfig_ authentication
- Ansible role '*avaloq.acpr-backup*' fails with 'MemoryError'
- 'avaloq-acpr' and 'avaloq-database-operator' Installator pattern configuration folders
  contain files on the wrong directory level

## [4.7.0] - 2021-02-16
### Added
- Verification of machine-config-pool status for master nodes within critical Ansible
  playbooks
- Ansible variable `cust_machineconfig` to skip machineconfigpool validation
- Ansible playbook '*acpr-ocp4-973-egress.yml*' to manage egress IP addresses
  configuration
- Documentation: *Application Deployment - Requirements - Avaloq Database Operator* to
  list newly required permissions regarding JSON handling on Oracle for the `DBOP_ADM`
  user required by the _Avaloq Database Operator_
- Ansible playbook '*acpr-ocp4-150-storage-nfs.yml*' to configure NFS server for
  OpenShift 4 clusters
- Ansible playbook '*acpr-ocp4-220-deploy-storage-classes.yml*' to configure storage
  classes in OpenShift 4 clusters
- Ansible playbook '*acpr-ocp4-221-deploy-persistent-volumes.yml*' to deploy persistent
  volumes to OpenShift 4 clusters
- User type to `cust_cluster_credentials` variable
- Ansible role '*avaloq.acpr-ocp4-auth*' to handle OpenShift 4 authentication
### Changed
- Ansible task `Fetch must-gather image-stream` is idempotent
- Version verification check for _python2-urllib3_ in Ansible
  role '*avaloq.acpr-inventory*' includes fixed version
- Renamed Ansible playbook '*acpr-ocp4-220-openshift-configure-cluster.yml*' to
  '*acpr-ocp4-210-openshift-configure-cluster.yml*'
- Make use of Ansible role '*avaloq.acpr-ocp4-auth*' in all OpenShift 4 Ansible
  roles and playbooks
- Renamed Ansible playbook '*acpr-ocp4-210-label-nodes.yml*' to
  '*acpr-ocp4-940-label-nodes.yml*'
### Fixed
- Fixed ClusterRole `strimzi-cluster-operator`
- Secret creation for OpenID Connect identity provider
- Default container registry configuration file gets overwritten when adding
  _unqualified search registries_

## [4.6.0] - 2021-02-03
### Added
- Documentation: *Frequently asked questions (FAQ)* topic: new item about NFS use instead
  of block storage
- Documentation: Ansible command line examples for OpenShift 4 clusters
- Support for Avaloq Installator version 1.6.0
- PersistentVolumeClaims access modes in Avaloq ACPR Monitoring constellation are
  configurable by AvaloqParameters
- Support log forwarding configuration in *OpenShift Logging* deployment
- Strimzi Operator cluster-wide configuration for
  - Strimzi 0.18.0 / AMQ 7.7 / AMQ Streams 1.5
  - Strimzi 0.20.0 / AMQ 2020.Q4 / AMQ Streams 1.6
- Version verification check for _python2-urllib3_ package in Ansible
  role '*avaloq.acpr-inventory*'
### Changed
- Upgraded Sealed Secrets Operator to version 0.13.1
- Task description of Ansible role '*avaloq.acpr-ocp4-configure-cluster*' to its README.md
- Group _system:authenticated_ to see *avaloq-database-operator* logs per default in
  Ansible role '*avaloq.acpr-operator-database*'
- OpenShift version independent playbooks to reflect version compatibility
- Resources related variables in Avaloq ACPR monitoring constellation can contain an
  empty value
- Following ACPR components are by default deployed as an Installator pattern to
  OpenShift 4 clusters
  - *Avaloq ACPR Monitoring*
  - *Kafka Strimzi Operator*
  - *Avaloq OAuthClient Operator*
  - *Avaloq Sealed Secrets Operator*
  - *Elasticsearch operator*
### Fixed
- Previously ignored parameter _acd_inst_loc_ in Ansible role
  '*avaloq.constellation-deployment*'
- Namespace configuration in Ansible playbooks '*acpr-610-deploy-operator-strimzi.yml*'
  and '*acpr-650-deploy-operator-elasticsearch.yml*'
- Kernel parameter _vm.max_map_count_ configuration is not propagated to new cluster nodes
- Backup of Sealed secret master doesn't run on administration host
- Ansible playbook '*acpr-ocp4-240-openshift-logging.yml*' with undefined resources
  variable

## [4.5.0] - 2021-01-19
### Added
- Documentation: *Getting started - Features catalog* to mention general requirement of
  parsing JSON log entries for support purposes
- Documentation: *Avaloq application deployment* topics covering new Avaloq
  Installator-based configuration pattern:
  - *Avaloq OAuthClient Operator*
  - *Avaloq Sealed Secrets Operator*
  - *Kafka Strimzi Operator Configuration*
  - *OpenShift Logging*
- Documentation: *Application Deployment - Requirements - Avaloq Database Operator* to
  list newly required permissions regarding Oracle Row-Level Security (RLS) for the
  `DBOP_ADM` user required by the _Avaloq Database Operator_
- '*avaloq-acpr-monitoring*' support for OpenShift 4
- Support for OpenShift version 4.6.8
- Additional CA trust bundle distribution for OpenShift 4
### Changed
- Ansible role '*avaloq.constellation-deployment*' uses _shell_ module
- Renamed ACPR example configuration files for OpenShift 3
### Fixed
- '_acprinfo_ not tracked' is only shown when *cluster-admin* privileges are unavailable
- '*acd_namespace*' verification check in Ansible
  playbook '*acpr-650-deploy-operator-elasticsearch.yml*'
- OpenShift logging constellation contains resources (CPU & memory) configuration for
  Elasticsearch and it's affiliated components
- Ansible playbook '*acpr-ocp4-210-label-nodes*' fails because of undefined variable
- Ansible role '*avaloq.acpr-ocp4-backup*' fails with _MemoryError_ error

## [4.4.0] - 2021-01-05
### Added
- Verification of OpenShift major version compatibility within all Ansible playbooks
- Checksum evaluation in Ansible role '*avaloq.acpr-ocp4-configure-cluster*' for
  OpenShift release image verification
- Support for ignition file generation for OpenShift 4.6
- OperatorHub disconnected mode configuration
- Import of RedHat Support container image '*openshift4/must-gather*' within its
  _imagestream_ for disconnected installation
- CoreOS _journald_ configuration (increased `RateLimitBurst` and `RateLimitInterval`)
  for all cluster nodes
- CoreOS Kernel parameter `vm.max_map_count` value _262144_ to all cluster nodes for
  ElasticSearch
- Suspend and resume _MachineConfigPool_ auto-reboot upon cluster configuration via
  Ansible role '*avaloq.acpr-ocp4-configure-cluster*'
### Changed
- Documentation: *Getting started - ACPR OpenShift releases and roadmap* topic:
  - OpenShift 3.11.x will be supported by Avaloq until EOY 2021
  - OpenShift 4.x will be productively supported by Avaloq starting from EOM January 2021
- Task import instead of inclusion to leverage tag inheritance in Ansible role
  '*avaloq.acpr-ocp4-configure-cluster*'
- Ansible playbook '*acpr-ocp4-240-openshift-logging*' sets OpenShift 4 openshift-logging
  to unmanaged mode and enables JSON logging processing
- Increase delay for checking _fluentd_ DaemonSet existence in Ansible playbook
  '*acpr-ocp4-240-openshift-logging.yml*'
- Increase delay between execution of OpenShift commands in Ansible role
  '*avaloq.constellation-deployment*'
- Ansible role '*avaloq.constellation-deployment*' to skip objects requiring
  *cluster-admin* privileges if current user is not admin
- CRD '_acprinfo_' is only to be updated if *cluster-admin* privileges are available
- Ansible role '*avaloq.constellation-deployment*' doesn't remove temporary files unless
  *cluster-admin* privileges are provided
### Fixed
- Ignition file clean up in Ansible role '*avaloq.acpr-ocp4-ignition-files*'
- Ignition file generation failed when parent directory was inexistent
- Ansible playbooks fail when deploying to OpenShift 4 due to version incompatibility
- Delegation of Ansible tasks to localhost when using Ansible 2.9
- Wrong delegation of tasks in Ansible role '*avaloq.acpr-status*'

## [4.3.0] - 2020-12-07
### Added
- Support for OpenShift version 3.11.318
- Ansible playbook '*acpr-121-avaloq-configure-administration-host.yml*' for OpenShift 3
  administration host preparation
- Ansible playbook '*acpr-ocp4-910-backup-ocp.yml*' for OpenShift 4 backup
### Changed
- Ansible playbook '*acpr-120-prepare-environments.yml*' to include new administration
  host preparation playbook '*acpr-121-avaloq-configure-administration-host.yml*'
### Fixed
- Documentation: *Install Avaloq Container Platform - ACPR configuration and cluster
  installation - Administration host preparation and ACPR OpenShift cluster installation*
  OpenShift cluster installation verification
- Ansible role '*avaloq.acpr-docker*' fails when pointing to multiple Avaloq's registries
- Ansible role '*avaloq.acpr-validate-cluster*' fails if container registries don't require
  authentication

## [4.2.0] - 2020-11-25
### Added
- Documentation: *Manage Avaloq Container Platform - Ansible codebase* topics
  - *avaloq.acpr-ocp4-configure-administration-host*
  - *avaloq.acpr-ocp4-configure-cluster*
  - *avaloq.acpr-ocp4-ignition-files*
  - *avaloq.acpr-ocp4-webserver*
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Installation prerequisites - OpenShift host prerequisites* and *OpenShift
  configuration* topics to mention that Ansible user requires root privileges
- Expose health checks of Prometheus, Alertmanager and Grafana in '*avaloq-acpr-monitoring*'
- Basic access authentication to Grafana proxy in '*avaloq-acpr-monitoring*'
- OpenShift Monitoring configuration constellation and Ansible playbook
  '*acpr-ocp4-230-openshift-monitoring.yml*'
- OpenShift Logging configuration constellation and Ansible playbook
  '*acpr-ocp4-240-openshift-logging.yml*'
- Ansible variable `cust_cluster_remove_kubeadmin` to remove initial kubeadmin user
- Support for Avaloq Installator version 1.5.0
- _htpasswd_ identity provider support for OpenShift 4
- Possibility to set API & Ingress certificates in OpenShift 4
- Dynamic _kubeconfig_ directory location for multi-session thread-safe CLI command
  executions
- _OpenID Connect_ identity provider support for OpenShift 3.11 and OpenShift 4
### Changed
- Name _include_tasks_ task in Ansible role '*avaloq.acpr-ocp4-configure-cluster*'
- All constellations provided by ACPR require at least version 1.5.0 of Avaloq
  Installator
- Ansible variable `cust_invt_file` default value of the location of the generated
  inventory file moved from a temporary location under _/tmp_ to
  _./inventory/ansible-hosts_ (within the repository) for easier change tracking
- Default location of groupvars file to  _./inventory/group_vars/all.yml_
### Fixed
- _kubeconfig_ environment variable in Ansible role
  '*avaloq.constellation-deployment*' is missing
- Ansible role '*avaloq.acpr-utils*' shows passwords in the console output in plaintext
- LDAP checks in Ansible role '*avaloq.acpr-prepare-environments*' are executed on all
  nodes instead of on only the _master_ nodes

## [4.1.0] - 2020-11-09
### Added
- AvaloqParameter `AVALOQ_GRAFANA_DASHBOARD_PROVISIONER_ADDITIONAL_DASHBOARD_TYPES`
  and AvaloqFile `grafana-configuration/additional-dashboard-provisioning.yaml`
  in '*avaloq-acpr-monitoring*' constellation to configure additional Grafana
  folders/providers
### Changed
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* topic: updated DNS information for OpenShift 4.x
- Increased version to 0.5.0 of Grafana dashboard provisioner in
  '*avaloq-acpr-monitoring*' constellation
- ACPR codebase supports Ansible 2.9 or greater only
- Removed Ansible 2.6 and 2.8 RPM repositories
### Fixed
- Default label linting rule in Ansible role '*avaloq.acpr-installator-lint*'
- Ansible 2.9 requires not to use _connection: local_ for _localhost_ task executions
- Ansible role '*avaloq.constellation-deployment*' fails if commands.txt file is missing

## [4.0.0] - 2020-10-29
### Added
- Support for OpenShift version 3.11.306
- Documentation: *Technical requirements* topic: ACPR OpenShift 4.x (beta) technical
  requirements
- Documentation: *Technical requirements* topic: ACPR OpenShift 3.11.x _all-in-one_
  installation support and sizing example
- Documentation: *Technical requirements* topic: Minimum worker node size reduced from
  4vCPU/16GB to 2vCPU/8GB
- Documentation: *Getting started - Releases and roadmap - ACPR OpenShift roadmap* topic
- Documentation: *Getting started - Features catalog* information for OpenShift 4.x
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* DNS information for OpenShift 4.x
### Changed
- Documentation: *Getting started - Getting ready for OpenShift 4* renamed to *Getting
  started with OpenShift 4*
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration and installation - ACPR OpenShift cluster installation* topic renamed to
  *Administration host preparation and ACPR OpenShift cluster installation*
- Prepare ACPR release v4.0.0
- OpenShift 4.x support moved from _alpha_ to _beta_
- Support of Ansible 2.9

## [3.13.0] - 2020-10-26
### Added
- Custom domain configuration for ingress controller (OpenShift 4.x)
- Avaloq RPM repository with Ansible 2.9
- OpenShift 4 Installer and OpenShift 4 CLI installation in Ansible role
  '*avaloq.acpr-ocp4-configure-administration-host*'
- Ansible playbook '*acpr-ocp4-130-avaloq-ingnition-files*' and Ansible role
  '*avaloq.acpr-ocp4-ignition-files*' to manage Openshift 4 ignition files
- Ansible variable `cust_cluster_nodes` to support node labeling in OpenShift 4
- Namespace 'default' in OpenShift 4 contains `network.openshift.io/policy-group: ingress`
  label
- OpenShift 4 configure administration host phase installs '*avaloq-installator*'
  by default
- OpenShift '*default*' namespace has to also contain
  `network.openshift.io/policy-group=ingress` label
- Ansible playbook '*acpr-ocp4-970-add-node*" to add a node to Openshift 4
### Changed
- Documentation: *Technical requirements* topic: Update ACPR Monitoring sizing
  requirements for HA set-up
- API version in '*avaloq-database-operator*' constellation
- API version and namespace kind '*avaloq-oauthclient-operator*' constellation
- Align objects' labels with constellation name and namespace kind
  in '*avaloq-sealed-secrets-operator*' constellation
- Remove `creationTimestamp` field from OpenShift 4 project template
- Ansible OpenShift 4 variable `cust_ssh_publickey` is not mandatory
- Ansible role '*avaloq.acpr-ocp4-configure-cluster*' is compatible with Jinja2 version
  <= 1.8
- OpenShift 4 Ansible playbook '*acpr-ocp4-120-avaloq-configure-administration-host*'
  requires root privileges
- Ansible playbook '*acpr-ocp4-120-avaloq-configure-administration-host*' has a dedicated
  role '*avaloq.acpr-ocp4-configure-administration-host*'
- Registries from Ansible variable 'cust_pull_secret' are considered and deployed by
  OpenShift MachineConfig
- The following applications NetworkPolicies use the new ingress label
  - '*acpr-monitoring*' (incl. constellation deployment)
  - '*openshift-logging*'
  - '*Twistlock*'
### Fixed
- Path to the constellations in the following Ansible playbooks
  - '*acpr-610-deploy-operator-strimzi.yml*'
  - '*acpr-620-deploy-operator-database.yml*'
  - '*acpr-630-deploy-operator-oauthclient.yml*'
  - '*acpr-640-deploy-operator-sealed-secrets.yml*'
  - '*acpr-650-deploy-operator-elasticsearch.yml*'
- Login to OpenShift cluster using token in Ansible role
  '*avaloq.constellation-deployment*'
- Ansible proxy related variables are not considered in Ansible task
  'Get openshift-installer'
- Conditional checks in acpr_use_constellations when an Ansible variable
  `cust_use_constellations` is not set

## [3.12.0] - 2020-10-12
### Added
- Set of Ansible tasks to '*avaloq.acpr-ocp4-configure-cluster*' Ansible role to verify
  current status of 'MachineConfigPool' objects
- OpenShift 4.x Administration host requires Ansible 2.9 or greater
- Ansible variable `cust_ntp_servers` to configure and related templates in
  '*avaloq.acpr-ocp4-configure-cluster*' Ansible role
- Renamed Ansible playbook '*acpr-ocp4-140-openshift-configure-cluster.yml*' to
  '*acpr-ocp4-210-openshift-configure-cluster.yml*'
### Changed
- Update licensing information from 'Avaloq Licence AG' to 'Avaloq Evolution AG'
- Align `avaloq.com/app` label value for Strimzi cluster-wide CRDs and CRs to
  `strimzi-operator-definitions`
- Update Fluentd related Prometheus rules
- Rename OpenShift 4 MachineConfig objects with avaloq prefix
- Removed Prometheus label `ruletype=infrastructure` from alert rules
  '_AvaloqApplicationsPodNotReady_' (`PAM74` and `PAM75`)
### Fixed
- Ansible role '*avaloq.acpr-auth*' shows password in the console output on error
- Volume name in Prometheus StatefulSet and Prometheus Rule provisioner deployment
  in Avaloq ACPR Monitoring constellation

## [3.11.0] - 2020-10-01
### Added
- Announcement: *Release notes, upgrades, and migration guides - Transitioning to
  Installator-based configuration*: ACPR newly uses Avaloq Installator pattern to
  configure selected ACPR components
- Documentation: *Avaloq application deployment* topics covering new Aaloq
  Installator-based configuration pattern:
  - *ACPR Monitoring*
- Documentation: *Manage Avaloq Container Platform - ACPR compliance verification -
  Linting rules* topic: ACPR cluster compliancy rule description
- Ansible variable `cust_use_constellations` to specify which ACPR applications are
  deployed using the Avaloq Installator-based configuration pattern
- Support for OpenShift version 3.11.286
- Support for Avaloq Installator version 1.3.1
- Ignition files generation to include container image registry configuration (OpenShift
  v4.x)
- Ansible playbook '*acpr-ocp4-120-configure-administration-host.yml*' to configure
  OpenShift v4.x administration host
- Ansible playbook '*acpr-ocp4-140-configure-cluster.yml*' and Ansible role
  '*avaloq.acpr-ocp4-configure-cluster*' to configure OpenShift v4.x cluster:
  - Container registries configuration
  - Images signature verification
  - _etcd_ encryption
  - LDAP (Identity provider) configuration
  - Project template customization
### Changed
- Documentation: topic *ACPR OpenShift cluster configuration and installation* renamed to
  *ACPR configuration and OpenShift cluster installation*
- Documentation structure: topic *Install Avaloq Container Platform - ACPR configuration
  and OpenShift cluster installation* has been restructured and parts of the sections in
  *ACPR OpenShift cluster configuration - OpenShift configuration* moved to *Install
  Avaloq Container Platform* as an independent section named *ACPR applications
  configuration and deployment*
- Documentation structure: removed unnecessary *Avaloq application deployment -
  Requirements* topic and moved its content to parent topic
- Minimum Avaloq Installator version 1.3.1
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) uses by default Avaloq
  Installator version 1.3.1
- Aligned structure in Ansible playbooks '*acpr-150-storage-nfs.yml*',
  '*acpr-150-storage-nfs.yml*' and '*acpr-220-deploy-persistent-volumes.yml*'
- Remove 'spec.storageClassName' path in PersistentVolumeClaims definitions if related
  variables are not set
- Execute OpenShift commands one by one in '*avaloq.constellation-deployment*' Ansible
  role
- Split OpenShift v4.x ignition file generation from webserver installation and
  configuration
- Ansible variable `cust_master_identity_providers` accepts OpenShift v4.x identity
  provider format
- Align Installator-pattern configuration components names to Avaloq Microservices
  Chassis guidelines
- Updated Avaloq OAuthClient Operator to version 0.1.2 for compatibility with OpenShift
  v4.x

## [3.10.0] - 2020-09-15
### Fixed
- Source file end of lines (EOL) are not used consistently across the repository

## [3.9.1] - 2020-09-08
### Added
- Support for OpenShift version 3.11.272
- Extended version of the Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*)
  for development that supports preparing an ADAI guest (e.g. to clone an ACP image), see
  `src/jenkins/development/avaloq-development-environment-deployment`
### Changed
- Avaloq '*acpr-monitoring*' constellation objects label values moved from `app`
  to `avaloq.com/app` key
### Fixed
- Avaloq '*acpr-monitoring*' constellation objects labels not compatible with Avaloq
  Installator 1.3.0

## [3.9.0] - 2020-09-01
### Fixed
- Indentation of some keys in '*acpr-monitoring*' constellation

## [3.8.0] - 2020-08-17
### Added
- Ansible playbook role '*avaloq.acpr-operator-elasticsearch*' to deploy cluster-wide Elastic Operator
  configuration (CRDs and Cluster Roles).
### Changed
- Proxy settings in Ansible  role '*avaloq.constellation-deployment*' now defaults to
  shell proxy environment if not specified explicitly
### Fixed
- Parameter validation in Ansible role '*avaloq.constellation-deployment*' failed when
  `acd_secrets_key_file_path` was _None_
- Namespace name in Ansible playbook '*acpr-630-deploy-operator-oauthclient*'

## [3.7.0] - 2020-08-03
### Added
- Ansible variable `acd_secrets_key_file_path` in role
- Prepare environment file in Ansible role '*avaloq.constellation-deployment*'
- Pass monitoring lint checks when installing 'acpr-monitoring' using Avaloq Installator
- Support for OpenShift version 3.11.248
- Preview release of '*acpr-monitoring*' with Avaloq Installator configuration and
  deployment
### Changed
- Documentation: *Getting started - Obtaining and managing ACPR codebase* renamed to
  *Getting started - ACPR deliveries* and split in multiple topics:
  - *Getting started - ACPR Documentation* topic
  - *Getting started - ACPR codebase* topic
  - *ACPR codebase on-premises integration and update* topic
- Documentation: *Getting started - ACPR deliveries* review and improvements
- Ansible playbook '*acpr-610-deploy-operator-strimzi*' now requires Installator 1.1.1

## [3.6.0] - 2020-07-20
### Added
- Documentation: *Troubleshooting - Egress* topic
- Support for OpenShift version 3.11.232
- Ansible variable `cust_logging_nodeselector` to place OpenShift Logging on predefined
  nodes
### Changed
- Documentation: OpenShift 4 release and support information in topic *Getting started -
  ACPR OpenShift releases and roadmap*
- Ansible role '*avaloq.acpr-installator-lint*' and Avaloq constellation deployment
  Jenkins pipeline (*Jenkinsfile*) use Avaloq Installator 1.1.0
- Run OpenShift Storage migration only before and after the upgrade procedure
### Fixed
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* container images table
- Ansible role '*avaloq.constellation-deployment*' variable `acd_signature_existence` has
  a missing default value (_True_)
- OpenShift token based login in Ansible role '*avaloq.constellation-deployment*'
- Removed ACPR unsupported OpenShift 3.11 errata versions
- Ansible 2.6 deprecation check

## [3.5.0] - 2020-07-07
### Added
- Documentation: *Getting started - Getting ready for OpenShift 4* added subtopic
  *Configuration and installation (ACPR OpenShift 4 _alpha_)*
- Documentation: *Manage Avaloq Container Platform - Logging* added subtopic Data
  forwarding
- Ansible variable `cust_monitoring_cluster_name` to distinguish multiple Prometheus
  instances in case of federation
- Ansible variable `acd_installator_min_version` in role
  '*avaloq.constellation-deployment*' to declare minimum required Installator version
- Ansible variables `cust_default_node_selector` and `cust_router_selector` to configure
  a node selector for application and router pods
- Parameter `cust_acpr_database_operator_logaccess_groupname` in Ansible role
  '*avaloq.acpr-database-operator*' to grant access to logs to a certain OpenShift group
### Changed
- Documentation: Moved *Avaloq application deployment - Requirements - Avaloq Strimzi*
  topic content to the new dedicated online Avaloq Strimzi documentation
  (https://docs.avaloq.com/tools/AvaloqStrimzi)
- Documentation: *Application deployment - Requirements - Avaloq Database Operator* to
  list newly required permission on `V$PARAMETER` for the `DBOP_ADM` user required by the
  _Avaloq Database Operator_
- Bump *etcd* version to 3.2.28 for OpenShift version 3.11.219 and higher
### Fixed
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* missing _curator5_ image details
- Ansible role '*avaloq.acpr-backup*' failed if `acpr-sealed-secrets `namespace was absent
- Automatic refresh interval of ACPR provided Grafana dashboards which led to dashboards
  not loading

## [3.4.0] - 2020-06-22
### Added
- Support for OpenShift version 3.11.219
- Prometheus Alertmanager high availability (HA) support
- Ansible variable `cust_alertmanager_additional_auth` and
  `cust_prometheus_additional_auth` to additionally configure _service account_ tokens
  and _htpasswd_ authentications in Alertmanager and Prometheus for OpenShift namespace
  '*acpr-monitoring*'
- OpenShift role '*monitoring-operator*' to configure Alertmanager access for users and
  service accounts, and to configure Prometheus for service accounts only
- Avaloq Installator linting step in Ansible role '*avaloq.constellation-deployment*'
### Changed
- Documentation: Service Request Management (SRM) Portal replaces the Issue Tool for
  requesting support for products in the Avaloq Tools domain
- Documentation: *Technical requirements - Avaloq infrastructure*: Avaloq Master Data
  Management (MDM) role '_ACPR - Container Delivery Access_' has been renamed to '_Avaloq
  Community Registry and Repositories Access_'
- Grafana connects directly to Prometheus (not via the Prometheus Proxy)
- Removed automatic refresh interval of the following Grafana dashboards:
  - *Topic: Host*
  - *Topic: NFS Server*
  - *Topic: OpenShift Cluster*
  - *Topic: OpenShift Elasticsearch*
  - *Topic: OpenShift etcd Cluster*
  - *Topic: OpenShift Node*
  - *Topic: OpenShift Project*
### Fixed
- Ansible role '*avaloq.acpr-prepare-environments*' may leak LDAP provider passwords due
  to missing _no_log_ attribute
- Ansible role '*avaloq.acpr-operator-strimzi*' does not use default YAML file extension
  (`.yml`)

## [3.3.0] - 2020-06-08
### Added
- Documentation: *Manage Avaloq Container Platform - ACPR compliance verification* topic
- Documentation: *Getting started - Getting ready for OpenShift 4* added subtopics:
  - *Technical Requirements (ACPR OpenShift 4 _alpha_)*
  - *Features catalog (ACPR OpenShift 4 _alpha_)*
  - *Infrastructure provisioning and prerequisites (ACPR OpenShift 4 _alpha_)*
- Documentation: *Technical Requirements* added indicative disk size indication to also
  cover OpenShift 4 requirements
- Documentation: *Manage Avaloq Container Platform - Ansible codebase* topic
  *avaloq.acpr-validate-cluster*
### Changed
- Replace deprecated package installation loop with list
- Remove *Ansible* from cluster nodes during post installation to prevent future
  compatibility issues between Ansible controller and cluster nodes
- Replace deprecated RPM '*python-docker-py*' with '*python-docker*'
- Use '*avaloq/avaloq-grafana-dashboard-provisioner:0.5.0*' image (was 0.4.0)
  providing robustness improvements (supports identically named dashboards and
  disables automatic dashboard refreshes) and increased default parameter values for
  resource requests and limits
### Fixed
- Ansible role '*avaloq.acpr-utils*' executes the configuration multiple times and fails
- Ansible role '*avaloq.acpr-docker*' may leak passwords into logs because of missing
  _no_log_ attribute upon docker command execution
- Ansible role '*avaloq.acpr-inventory*' leaks authentication provider password because
  of missing _no_log_ attribute
- Broken internal table references in the ACPR online documentation
- EFK logging stack upgrade fails if *hostPath* is used

## [3.2.0] - 2020-05-25
### Added
- Documentation: *Getting started - Features catalog - Unsupported features* mention
  about unsupported _NodePort_ feature for incoming cluster traffic
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration - OpenShift configuration* description and examples for Ansible variable
  `cust_sc_definitions`
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) variable
  `REMOVE_AGAIN` to remove all Kubernetes objects from the namespace again after
  deploying (meant for verification builds)
- Support for OpenShift version 3.11.216
- Ansible helper playbook *rollout-default-haproxy-router.yml* (included in upgrade ose
  playbook) to update default router pods after upgrade images to version 3.11.216
- Kubernetes Custom Resource _acprinfo_ to *acpr-sealed-secrets* deployment to identify
  ACPR version used in clusters
- Ansible 2.6 deprecation message in Ansible role '*avaloq.acpr-inventory*'
- Support custom _oc_ CLI download URLs in OpenShift About page
- OpenShift RPMs to excluded packages in _/etc/yum.conf_ file to prevent unintentional
  upgrades
- Include Sealed Secrets master key backup in Ansible role '*avaloq.acpr-backup*'
- Prometheus alert rules '_AvaloqApplicationsPodNotReady_' (`PAM74` and `PAM75`) to
  monitor Avaloq applications Pods availability
### Changed
- Documentation: *Application deployment - Requirements - Avaloq Database Operator* to
  better explain in which situations finalizers from `DatabaseSchema` resources
  may be manually removed with updated patch command
- Renamed Ansible role '*avaloq.constallation-deployment*' to
  '*avaloq.constellation-deployment*' (typo)
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) to use Avaloq
  Installator version 1.0.0 by default as fallback if not specified in constellation
- Ansible role '*avaloq.constellation-deployment*' role uses Installator 1.0.0 and local
  constellation components
- Ansible role '*avaloq.acpr-installator-lint*' uses Avaloq Installator 1.0.1
- Prometheus alert rule '_KubePodNotReady_' (`PAM7`) duration from 1h to 15m
### Fixed
- Documentation: *Avaloq Container Platform security - Container image signature and
  verification* topic needs to clearly mention that Avaloq does not advise to use and
  does not support third-party opensource container images (e.g. _Strimzi_ obtained from
  Docker Hub)
- Documentation: *Manage Avaloq Container Platform - Backup and restore* topic mentions
  Ansible playbook '*ose-backup.yml*' instead of '*acpr-910-backup-ose.yml*'
- Execution of Installator-generated commands in Avaloq constellation deployment
  Jenkins pipeline (*Jenkinsfile*) for Installator 1.0.1
- Fixed missing roles for managing Sealed Secrets objects by users in their own namespace
- Fixed calculation for '_KubeClientCertificateExpiration_' (`PAM10`, `PAM11`)

## [3.1.0] - 2020-05-11
**Important information:** Legacy container image registries and _RPM_/_m2_ repositories
are planned to be decommissioned on the 30<sup>th</sup> of June 2020.
Refer to the *Technical Requirements - Avaloq Infrastructure* documentation topic for
more information.

### Added
- Documentation: *Technical requirements - Storage* links and additional data to the
  section
- Documentation: *Architecture - Monitoring, alerting, and logging - Storage sizing
  considerations* section
- Documentation: *Manage Avaloq Container Platform - Monitoring and alerting -
  Grafana dashboards* table describing provided Grafana dashboards
- Documentation: *Avaloq Application deployment - Twistlock deployment* Twistlock
  monitoring configuration
- Documentation: *Manage Avaloq Container Platform - Ansible codebase* topic
  *avaloq.acpr-twistlock*
- Kubernetes Custom Resource _acprinfo_ to identify ACPR version used in clusters
- Prometheus Alerts rules to monitor Fluentd buffer size
- Grafana dashboard '*Dashboard: Cluster CPU Load*' to analyze and correlate Node CPU
  load with overall cluster API activity and load
- Ansible playbook '*acpr-640-deploy-operator-sealed-secrets.yml*' (and corresponding role
  '*avaloq.acpr-operator-sealed-secrets*') to deploy the Sealed Secrets Controller within
  the *acpr-sealed-secrets* cluster namespace
### Changed
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* DNS records and wildcard explanation
- Legacy container image registries and _RPM_/_m2_ repositories are planned to be
  decommissioned on the planned to be decommissioned on the 30<sup>th</sup> of June 2020
- Documentation: *Getting started - Releases and roadmap*:
  - OpenShift 3.11 Red Hat Full support extended to June 2021
  - ACPR OpenShift v3.11.200 as '_in preparation_'
- Ansible role '*avaloq.acpr-installator-lint*' uses Avaloq Installator 1.0.0
- Minimum kernel check to support RHEL versions from 7.8 onwards
- Ansible playbook '*acpr-410-deploy-twistlock.yml*' `cust_twistlock_prometheus_user`
  parameter to configure Twistlock monitoring (Alertmanager rules and Grafana dashboard)
### Fixed
- Documentation on storage does not provide enough details to get started
- Some microservices failing when 'ca-bundle.crt' file contains comments
- Prometheus custom metrics permissions on nodes added by Ansible playbook
  '*acpr-970-add-node.yml*'
- Failing *openshift-logging* upgrade process when not using *hostPath* as a storage
  for Elasticsearch
- Folder within ACPR distribution zip file does not follow the pattern _$product-$version_
- Broken internal page anchors in the ACPR online documentation

## [3.0.0] - 2020-04-27
### Added
- Option to use PersistentVolumeClaim instead of *hostPath* in Elasticsearch deployments
  of *openshift-logging* project via Ansible role '*avaloq.acpr-logging*'
### Changed
- Documentation: *Getting started - Technical requirements*: only Ansible 2.8 is
  supported
- Installator commands in Ansible role '*avaloq.constallation-deployment*' to support
  Installator version 0.15.11
### Fixed
- Filename in image existence check in Ansible role '*avaloq.constallation-deployment*'

## [2.13.1] - 2020-04-15
### Fixed
- New installation failing with 'Permission denied' when retrieving existing master
  configurations and validating

## [2.13.0] - 2020-04-14
### Added
- Documentation: *Release notes, upgrades, and migration guides - Enable new feature:
  container image signature verification*
- Documentation: *Manage Avaloq Container Platform - Ansible codebase* topic
  *avaloq.constallation-deployment*
- Documentation: *Avaloq products - Container images* topic: container image sizes
- Storage class provisioner and parameters configuration in 'avaloq.acpr-storage-classes'
  Ansible role
- LDAP pre-check in Ansible '*avaloq.acpr-prepare-environments*'
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) variable
  `JENKINS_CREDENTIALS` to allow providing OpenShift token as Jenkins Credentials
   of type Secret Text
- Optional variables to configure OpenShift namespace '*acpr-monitoring*' in more detail:
  - `cust_prometheus_password`
  - `cust_prometheus_pvc_access_modes_data`
  - `cust_prometheus_pvc_storage_class_name_data`
  - `cust_prometheus_pvc_storage_class_name_rule`
  - `cust_grafana_pvc_storage_class_name_log`
  - `cust_grafana_pvc_storage_class_name_library`
  - `cust_grafana_pvc_storage_class_name_dashboard`
- Variable `cust_logging_es_ops_sc_name` to define StorageClass name for Elasticsearch
  Ops PVC
- Image signature existence check in Ansible playbook
  '*acpr-711-validate-images-existence.yml*'
### Changed
- Documentation: *Manage Avaloq Container Platform - Container image registries -
  Container image signature verification* topic improvements
- API version from _v1beta1_ to _v1_ for Daemonsets, Statefulsets and RBAC objects
- Moved installation of *openshift-logging* from Ansible playbook '*acpr-130-install.yml*'
  to '*acpr-170-install-logging.yml*' for allowing storage set-up prior installation
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) default tools versions
  to latest stable Avaloq Installator 0.15.9 and OpenShift CLI 3.11.154
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) to parse Installator
  version from constellation's _configuration.yml_ and variable `FORCE_VERSION` to
  overwrite
- It is not required to set `cust_ansible_become` variable anymore
### Fixed
- Prometheus Alerts labels in OpenShift namespace `openshift-logging`
- Variable `ansible_become` can be arbitrarily set but OpenShift installation requires it
  to be set to `true`
- Fixed typo in Strimzi Operator CRD labels for version 0.17.0
- Indentation of `acpr_logging_fluentd_secure_forward` variable in Fluentd
  configuration

## [2.12.0] - 2020-04-01
### Added
- Documentation: *Release notes, upgrades, and migration guides - Transitioning container
  registry* topic for instructions on how to transition cluster container image registry
- Documentation: *Manage Avaloq Container Platform - Container image registries* new
  topics:
  - *Container image existence verification*
  - *Container images registry pre-pull*
  - *Transition deployments container image registry*
- Documentation: *Avaloq products - Container images* topic listing container images
  available via _<span>https:</span>//registry.service.avaloq.com_
- Documentation: *Manage Avaloq Container Platform - Ansible codebase* topics:
  - *roles/avaloq.acpr-backup*
  - *roles/avaloq.acpr-etcd*
  - *roles/avaloq.acpr-inventory*
- Strimzi Operator cluster-wide configuration for
  version 0.17.0 / AMQ 7.6 / AMQ Streams 1.4
- Ansible playbook '*acpr-740-installator-lint.yml*' (and corresponding role
  '*avaloq.acpr-installator-lint*') to validate cluster ACPR compliance
- Linting rule to check if all image references use full registry URL
- `avaloq.com/app: avaloq-oauthclient-operator` and `app.kubernetes.io/component` labels
  to OpenShift objects created by ACPR
- Variable `cust_administration_container_images_registries` to set container registries
  on administration host
### Changed
- Updated '*avaloq-grafana-dashboard-provisioner*' image version from 0.3.2 to 0.4.0
- Ansible playbook '*acpr-972-migrate-registry.yml*' renamed to
  '*acpr-972-transition-registry.yml*'
- Ansible role '*avaloq.acpr-inventory*' to select _etcd_ image version based on
  OpenShift version
- Increase 'gather_timeout' in Ansible configuration
- Type of '*acpr-monitoring*' OpenShift project
- Improved Ansible roles README.md:
  - '*avaloq.acpr-backup*'
  - '*avaloq.acpr-etcd*'
  - '*avaloq.acpr-inventory*'
- Improved generated YAML indentation in Prometheus additional jobs section
### Fixed
- Warnings in '*acpr-monitoring*' namespace about 'kube-state-metrics' Pod not able to
  access ConfigMap and Secret objects
- Check does not correctly validate port number in container image registry URL
- OpenShift version verification in inventory generation

## [2.11.1] - 2020-03-23
### Added
- Optional deployment of legacy OpenShift Prometheus metrics, rules, and jobs (existing
  in '*openshift-monitoring*' project) via Ansible role '*avaloq.acpr-monitoring*'

## [2.11.0] - 2020-03-16
### Added
- Documentation: *Manage Avaloq Container Platform - Add Custom CA Certificate* topic
- Documentation: *Manage Avaloq Container Platform - Container image signature and
  verification*: running playbook '*acpr-710-validate-cluster.yml*' as a prerequisite
  before transitioning registry
- Documentation: *Getting started - Getting ready for OpenShift 4* initial document
- Documentation: Notes about configurations that will not be supported in Red Hat
  OpenShift 4
- Support for OpenShift version 3.11.170
- Variable `cust_registry_location` sanity check
- Ansible role '*avaloq.constallation-deployment*' to check prior to constellation
  deployment/upgrade for required container images existence in registry
- Ansible playbook '*acpr-711-validate-images-existence.yml*' to check for existence of
  list of container images in registry
- Support for labels, LimitRange, and ServiceAccount objects in custom OpenShift project
  template
### Changed
- Ansible role '*avaloq.constallation-deployment*' supports Avaloq Installator v0.15 and
  greater
### Fixed
- Documentation: Broken images in the ACPR online documentation
- Make registry login task in Ansible role '*avaloq.acpr-docker*' idempotent to allow the
  change of credentials

## [2.10.0] - 2020-03-02
### Added
- Documentation: *Getting started - Features catalog* pulling from container image
  registries URL with one or more path segments is not supported
- Documentation: *Application deployment - Requirements - Kafka Strimzi Operators -
  Shared usage of Kafka with 3rd party products* section
- Documentation: *Getting started - Releases and roadmap*: added OpenShift v3.11.170 as
  '_in preparation_'
- Documentation: *Manage Avaloq Container Platform - Restore _etcd_ cluster* topic
- Ansible playbook '*acpr-973-add-egress.yml* to manage egress IP addresses configuration
### Changed
- Documentation: *Getting started - Releases and roadmap*: improved ACPR/OpenShift
  compatibility tables
### Fixed
- Disable container signature verification when setting the variable
  `cust_container_images_signature_verification` to _false_
- Add missing permissions to cluster role '*strimzi-kafka-reader*' (defined by Ansible
  role '*avaloq.acpr-operator-strimzi*') that got lost when upgrading the CRs/CRDs for
  Strimzi 0.14.0 / AMQ 7.5 / AMQ Streams 1.3
- Parsing of containers logs continuation lines

## [2.9.0] - 2020-02-20
### Added
- Documentation: *Manage Avaloq Container Platform - Monitoring And Alerting* Strimzi
  alerts
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* topic listing required OpenShift 3.11.161 container
  images
- Documentation: *Manage Avaloq Container Platform - Ansible codebase -
  roles/avaloq.acpr-auth* topic
- Documentation: *Release notes, upgrades, and migration guides* topics updated with
  known issues for each ACPR versions (ACPR v1.19.1 and v2.x)
- Support for OpenShift version 3.11.161
- Variables to configure PersistentVolumeClaim storage requests
  - `cust_twistlock_console_pvc_size`
  - `cust_prometheus_pvc_size_request_data`
  - `cust_prometheus_pvc_size_request_rule`
  - `cust_grafana_pvc_size_request_dashboard`
  - `cust_grafana_pvc_size_request_library`
  - `cust_grafana_pvc_size_request_log`
### Changed
- Documentation: *Install Avaloq Container Platform - Install Avaloq Container Platform -
  OpenShift configuration* improved Ansible variable `cust_acpr_rpm_repositories` and
  `cust_container_images_registries` descriptions
- Updated '*avaloq-prometheus-rule-provisioner*' image to version 0.1.3 which validates
  rulefiles with *promtool* and only deploys valid rules
- Ansible role '*avaloq.acpr-auth*' does not install _atomic-openshift-clients_ anymore
- _become_ directive moved from Ansible playbooks '*acpr-120-prepare-environment.yml*'
  and '*acpr-930-reconfigure-docker.yml*' to roles '*avaloq.acpr-docker*' and
  '*avaloq.acpr-repository*'
- Ansible playbook '*acpr-970-migrate-registry.yml*' renamed to
  '*acpr-972-migrate-registry.yml*'
- Renamed Ansible role '*avaloq.acpr-repository*'
  `cust_reconfigure_docker_interactive_mode` variable to
  `acpr_reconfigure_docker_interactive_mode`
- Improved Ansible roles README.md template
- Remove quotes from Prometheus alerts' description
### Fixed
- Following roles do not explicit _become_ Ansible role '*avaloq.acpr-auth*' does not
  install _atomic-openshift-clients_ anymore
- Ensure newline at EOF in _ca-bundle.crt_ to prevent certain pods from failing during
  startup
- Possibility to specify a registry URL which is servicing images not only from the root
  context
- Apache License 2.0 URL to use _https_ protocol: _https://www.apache.org/licenses/_

## [2.8.0] - 2020-02-03
### Added
- Documentation: *Technical Requirements*: XFS disk filesystem as a requirement
- Documentation: *Getting started - Features catalog* OpenShift out-of-the-box HAProxy
  load balancer is not supported
- Documentation: *Manage Avaloq Container Platform - Ansible codebase -
  roles/avaloq.acpr-docker* topic
- Documentation: *Release notes, upgrades, and migration guides - Upgrade from ACPR
  latest v1.x to v2.7.0* topic for a fast ACPR release v1.x to v2.x upgrade path
- Documentation: *Release notes, upgrades, and migration guides - = Enable new feature:
  container image signature verification* topic
- Documentation: *Avaloq Container Platform security - Container image signing* renamed
  to *Container image signature and verification*
- Documentation: *Avaloq Container Platform security - Container image pre-pull* topic
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration and installation - Ansible Vault* topic describing how use Ansible Vault
  to store passwords in a secure way
- Documentation: *Avaloq application deployment - Requirements - Avaloq Database Operator*
  extended the description on how to use the Avaloq database operator templates
- ACPR Ansible variable `cust_prepull_container_registry` for the container image
  registry pre-pull utility (incl. signing)
- Two new ACPR Ansible variables `cust_logging_es_kibana_hostname` and
  `cust_logging_es_ops_kibana_hostname` to configure Kibana and Kibana Ops hostnames
- Ansible playbook '*acpr-970-migrate-registry.yml*' to transition image references from
  one registry to another
### Changed
- Documentation: *Technical Requirements - Avaloq Infrastructure* renamed container image
  dependencies URL from _registry.service.avaloq.com/m2/definitions_ to
  _registry.service.avaloq.com/definitions/m2_
- Documentation: *Avaloq Container Platform security* topic renamed to *Security*
- Documentation: *Release notes and upgrade guide* topic renamed to *Release notes,
  upgrades, and other guides*
- Ansible playbook '*acpr-950-copy-and-sign-images.yml*' renamed to
  '*acpr-950-prepull-and-sign-images.yml*'
- Reduced `cookie-expire` to 4 hours in `StatefulSet` for Prometheus, Alertmanger
  and Grafana.
- Improvements of ACPR configuration example files
### Fixed
- Handler import in Ansible role '*avaloq.acpr-docker*'
- Permissions in ClusterRole `strimzi-cluster-operator` for
  Strimzi 0.14.0 / AMQ 7.5 / AMQ Streams 1.3

## [2.7.0] - 2020-01-20
### Added
- Documentation: *Technical Requirements - Avaloq Infrastructure* added *AcprTools* and
  *AcprRhel7Ansible28* RPM repositories URLs
- Documentation: *Technical Requirements - Avaloq Infrastructure* added information about
  new consolidated Internet-based services for the Avaloq Community:
  - _registry.service.avaloq.com_: registry, signatures, and container-related artifacts
  - _repository.service.avaloq.com_: other repositories
- Documentation: *Manage Avaloq Container Platform - Container image registries* topic
  describing how to manage and transition from one container image registry to another
- Documentation: *Manage Avaloq Container Platform - Ansible codebase -
  roles/avaloq.acpr-repository* topic
- Documentation: *Avaloq Container Platform security - Container image signing - Avaloq
  provided container images and signatures* section to include new signed container image
  namespaces *amq7* and *strimzi*
- Documentation: *Runbooks* topic for reference routine procedures and operations that
  the system administrator or operator may need to carry out
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration and installation - ACPR OpenShift cluster installation* topic to include
  step to set ACPR variable `cust_cluster_credentials`
- Support for custom *NetworkPolicy* objects in OpenShift project template using in
  Ansible role '*avaloq.acpr-inventory*'
- Ansible role testing with molecule
- Runbook and link for Alertmanager rules
  - '_KubeClientCertificateExpiration_' (`PAM10`, `PAM11`)
  - '_EtcdNoLeader_' (`PAM30`)
- ACPR Ansible variable `cust_cluster_credentials` for administrative cluster login
  credentials
### Changed
- Documentation: *Technical Requirements*: increased Infrastructure and Application nodes
  requirements to 4+ vCPU and 16+ GB memory in order to allow room for fist deployments
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* required *acpr-monitoring* project container images per
  OpenShift version
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Installation prerequisites - OpenShift host prerequisites* to point to correct Ansible
  playbook
- Default value of `cust_registry_location` variable to new registry
  _registry.service.avaloq.com_ (requires MDM authentication)
### Fixed
- Missing container image 'openshift3/ose' in documentation topic *Install Avaloq
  Container Platform - Infrastructure provisioning - Installation prerequisites -
  Infrastructure prerequisites*
- ACPR Ansible variable for container image registries configuration need more details
- RPM repositories' `sslcacert` variable value defaulting causing Ansible role execution
  error
- `cust_acpr_rpm_gpgkey` variable not taken into account when evaluating RPM repositories
  configuration
- OpenShift logging daemonset configuration script is executed each time Ansible role
  'avaloq.acpr-logging' is performed
- Multiple localhost executions of Ansible role '*avaloq.acpr-auth*' within playbook
  '*acpr-940-label-nodes.yml*'

## [2.6.0] - 2020-01-13
### Added
- Avaloq RPM repository *AcprTools* and corresponding PGP key providing ACPR tools
- Support for Ansible latest version 2.8 (incl. RPM repository configuration and only if
  using OpenShift 3.11.141 or greater)
- Strimzi Operator cluster-wide configuration for
  version 0.14.0 / AMQ 7.5 / AMQ Streams 1.3
- `acpr_os_version` (OpenShift version) as Ansible global variable
### Changed
- Reword 'n/a' to '0' in Fluentd Grafana dashboard
- Align example variables file with the current Avaloq's container registry configuration
- Use OpenShift version to get corresponding container images in *acpr-monitoring* project

## [2.5.0] - 2019-12-23
### Added
- Documentation: *Manage Avaloq Container Platform - Ansible codebase* topic with initial
  description of ACPR provided Ansible playbooks and roles
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* topic listing required OpenShift 3.11.157 container
  images
- Section *Privilege Escalation* in all Ansible roles' *README.md* file to clarify
  privilege escalation use
- Prometheus _Node exporter_ availability alert rule '_NodeExporterIsNotReachable_'
  (`PAM47`)
- Detailed information about stored container images on each cluster node (CSV format)
- Cluster role '*strimzi-kafka-reader*' to grant read permission on Kafka-related CRs
  defined by Ansible role '*avaloq.acpr-operator-strimzi*' to users with view role on a
  namespace
- Support for OpenShift version 3.11.157
- Prometheus alert rule '_FluentdTooManyErrors_' (`PAM48`)
### Changed
- Documentation: *Application deployment - Requirements - Avaloq Database Operator* to
  specify additional permissions needed by administrative Oracle user to enable
  Avaloq Database Operator to managing a database schema
- Aligned Avaloq Database Operator administrative Oracle user name from
  `admin`/`db_op_admin` to `dbop_adm`
- Aligned Avaloq Database Operator secret name from `default-dba` to
  `db-operator-admin`
- Increase `scrape_timeout` to 60 seconds in Prometheus job `logging-pods`
- Increase Prometheus global `scrape_timeout` to 20 seconds
- Decrease Prometheus global `scrape_interval` to 30 seconds
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) to latest Avaloq
  Installator version 0.15.7
- Default output directory in Ansible role '*avaloq.acpr-status*' set to _${HOME}/acpr/_
### Fixed
- Documentation: *Application deployment - Requirements - Avaloq Database Operator*
  user name (`dbop_adm`) and secret name (`db-operator-admin`) not aligned with code
- Variable evaluation in Prometheus alert rule '_ElasticSearchRelocationShards_' (`PAM41`)
- Condition when to deploy project template in Ansible playbook
  '*acpr-140-post-install.yml*'

## [2.4.1] - 2019-12-12
### Fixed
- Inventory generation for hostgroup *lb* within Ansible role '*avaloq.acpr-inventory*'

## [2.4.0] - 2019-12-09
### Added
- Documentation: *Getting started - Features catalog* OpenShift
  '*openshift-metrics*', Atomic Host, external _etcd_ nodes, blue-green deployment, and
  docker search functionality implementations not supported
- Documentation: *Manage Avaloq Container Platform - Certificates redeployment* topic
- Documentation: *Application deployment - Requirements - Avaloq OAuthClient Operator*
  topic
- Ansible playbook '*acpr-630-deploy-operator-oauthclient.yml*' (and corresponding role
  '*avaloq.acpr-operator-oauthclient*') to deploy the Avaloq OAuthClient Operator within
  the *avaloq-oauthclient-operator* ACPR cluster namespace
- Prometheus alert rules for Elasticsearch pods within *openshift-logging* project
- Support for OpenShift version 3.11.154
- Label `ruletype` to all Prometheus alert rules
- Option to skip RPM packages management (Ansible variable `cust_acpr_rpm_repositories`)
- _Etcd_ Certificate Authority (CA) distribution in Ansible role *`avaloq.acpr-etcd`*
- Support for custom OpenShift project template using variable `cust_projecttemplate` in
  Ansible role '*avaloq.acpr-inventory*'
- Strimzi labels (`strimzi_io_cluster` and `statefulset_kubernetes_io_pod_name`)
  configuration in Prometheus configuration
### Changed
- Include Avaloq's container registry Certificate Authority (CA) certificate only if
  a registry in domain `*.service.avaloq.com` is used
### Fixed
- Indentation in Prometheus alert rules definitions' YAML file
- Broken hyperlinks in the ACPR online documentation
- Documentation not mentioning that the file _playbooks/group_vars/all.yml_ is also
  generated by the ACPR inventory file generation (Ansible playbook
  '*acpr-110-generate-inventory.yml*')
- Example playbooks *example-openshift3-acpr.yml* and *example-openshift3-aio-acpr.yml* containing incomplete
  and not working custom oracle create template when setting parameter
  `cust_acpr_database_operator_oracle_templates` of Ansible role
  '*avaloq.acpr-operator-database*'

## [2.3.1] - 2019-12-02
### Added
- ACPR configuration variable `cust_acpr_logging_hostpath_dir` to set customer's custom
  Elasticsearch data storage path

## [2.3.0] - 2019-11-25
### Added
- Documentation: *Getting started - Features catalog* topic disclaimers
- Documentation: *Getting started - Licensing and support* Red Hat OpenShift and AMQ
  Enterprise licensing
- Variable `cust_branding_configuration` and Ansible playbook
  '*acpr-860-configuration-branding.yml*' to apply custom OpenShift cluster branding
- Ansible playbook '*acpr-980-reconfigure-auth.yml*' to reconfigure OpenShift
  authentication providers
- Variable `cust_master_identity_admin_users` to assign cluster-admin role to users
- Check if OpenShift CLI version corresponds to the OpenShift cluster minor version
### Changed
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration and installation - ACPR OpenShift cluster configuration* change
  enforcement information
### Fixed
- Documentation: *Getting started - Features catalog* topic listing OpenShift and
  Avaloq requirements for an ACPR-compliant cluster
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* topic listing required OpenShift 3.11.153 container images
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration and installation - ACPR OpenShift cluster configuration* mention how to
  apply a configuration change after a cluster installation (*Change enforcement* column)
- Ansible playbooks '*acpr-970-add-node.yml*' and '*acpr-971-add-master-node.yml*' to
  add nodes to cluster
- Support for OpenShift version 3.11.153
- ACPR configuration to support multiple authentication providers (Ansible variable
  `cust_master_identity_providers`)
- ACPR configuration variable `cust_master_identity_providers` supports YAML format items
- ACPR configuration variable `cust_master_htpasswd_file` to set customer's custom
  *htpasswd* file
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) variable
  `CONSTELLATION_PATH` to allow to store constellation files in a folder other than
  repository, or zip file, root folder

## [2.2.0] - 2019-11-11
### Added
- Documentation: *Getting started - Features catalog* topic listing OpenShift and
  Avaloq requirements for an ACPR-compliant cluster
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* topic listing required OpenShift 3.11.153 container images
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration and installation - ACPR OpenShift cluster configuration* mention how to
  apply a configuration change after a cluster installation (*Change enforcement* column)
- Ansible playbooks '*acpr-970-add-node.yml*' and '*acpr-971-add-master-node.yml*' to
  add nodes to cluster
- Support for OpenShift version 3.11.153
- ACPR configuration to support multiple authentication providers (Ansible variable
  `cust_master_identity_providers`)
- ACPR configuration variable `cust_master_identity_providers` supports YAML format items
- ACPR configuration variable `cust_master_htpasswd_file` to set customer's custom
  *htpasswd* file
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) variable
  `CONSTELLATION_PATH` to allow to store constellation files in a folder other than
  repository, or zip file, root folder
### Changed
- Removed dependency on the container images registry search functionality by using
  absolute container image URLs
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) to shallow clone the
  git repository and parallelly download artifacts for improved performance
### Fixed
- Documentation: *Manage Avaloq Container Platform - Monitoring and alerting -
  prometheus rules* table formatting
- Documentation: *Avaloq Application deployment - Twistlock deployment - Security
  configuration* links providing recommended rule sets
- Documentation: *Release notes and upgrade guide* review 2.0.0 and 2.1.0
- Image pull failure when container images are referenced with relative URL
- Task *RH-4.9 - RH-4.10 | Maintain the default OpenShift Container Network Interface
  file ownership & permissions* in Ansible role '*avaloq.acpr-hardening*'

## [2.1.0] - 2019-10-28
### Added
- Documentation: *Getting started - Releases and roadmap*: added OpenShift v3.11.153 as
  '_in preparation_'
- Documentation: *Security - Container image signing* topic
- Documentation: *Technical Requirements* added minimum kernel version information
- Documentation: *Technical Requirements* added required RPM repository list
- Documentation: *Technical Requirements - Avaloq Infrastructure* added table containing
  RPM repository URLs
- Documentation: *Manage Avaloq Container Platform - Monitoring and alerting -
  Custom prometheus rules* section
- Documentation: *Manage Avaloq Container Platform - Monitoring and alerting -
  Alertmanager* section
- Ansible playbook '*acpr-960-cleanup-container-image-cache.yml*' to cleanup container
  image cache on all cluster nodes
- Ansible playbook '*acpr-850-apply-objects.yml*' to apply custom OpenShift objects
- Variable `cust_nfs_shares_directory_path` to configure directory path where NFS shares
  are saved
- Custom container registry namespace configuration in `cust_container_images_registries`
  variable
- Check minimum kernel version in Ansible role '*avaloq.acpr-prepare-environments*'
- Modify cluster container registries
### Changed
- Documentation: *Technical Requirements - Avaloq Infrastructure - Avaloq repositories
  and container image registry* section to include additional details about Avaloq
  RPM, registry, and repository URLs.
- Use *registry.service.avaloq.com/signatures/* instead of
  *registry.service.avaloq.com/containers/sigstore/* as URL for container images
  signatures
- Grafana dashboard *Topic: OpenShift Elasticsearch* plots and descriptions are improved
  and sections better organized
- Disable alerting engine & UI features in Grafana
- Adjust NetworkPolicy rules in *acpr-monitoring* project to be compliant with Kubernetes
  specification regarding combined use of *podSelector* and *namespaceSelector*
### Fixed
- Documentation: *Technical Requirements* inaccurate diagram
- Documentation: _bash_ code snippets do not adhere to standards
- Atomic Management Tool (*atomic*) not honouring flag `verify_signature` when set to
  *false*
- Prometheus alert rule '_AlertmanagerFailedReload_' (`PAM12`) has wrong job name in
  expression
- ACPR Logging and Monitoring deployments fail when subdirectories are used in containers
  registry location
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) ignoring
  `MANUAL_VERIFY` parameter not showing "Execute deploy commands?" dialog but deploying
  in any case
- Some Grafana dashboard *Topic: OpenShift Elasticsearch* plots (particularly KPIs) show
  inaccurate information

## [2.0.0] - 2019-10-14
### Added
- Variable `cust_container_images_registries` to have the Ansible playbooks
  '*acpr-120-prepare-environment.yml*', '*acpr-930-reconfigure-docker.yml*' and
  corresponding role '*avaloq.acpr-docker*' to configure multiple container image
  registries and their container image signature verification policy
- *registry.service.avaloq.com* PGP public key and
  *https://registry.service.avaloq.com/containers/sigstore/* signatures repository in
  Ansible role '*avaloq.acpr-docker*'
- Variable `cust_prepull_container_registry` and Ansible playbook
  '*acpr-950-copy-and-sign-images.yml*' to copy a list of images from a trusted source
  registry, verify the signature with the public PGP key, and push them to a destination
  registry by signing them with a private PGP key
### Changed
- De-released variable `cust_docker_additional_registries` in ACPR configuration
  (replaced by `cust_container_images_registries`)
- Default registry moved from *acpr-repo.service.avaloq.com* to
  *registry.service.avaloq.com*
- ACPR OpenShift installation verifies container images signatures by default
- De-released Ansible roles '*openshift-applier*' and '*make-applier-projects-unique*'
- De-released variable `cust_logging_curator_default_days` in ACPR configuration
- Multiple variables in Ansible role '*avaloq.acpr-repository*' to allow fine grained
  configuration of all RPM repositories
- Set recommended RPM repository parameters (i.e. `acpr_rpm_sslverify`,
  `cust_acpr_rpm_gpgcheck`) in Ansible role '*avaloq.acpr-repository*' as defaults
- Ansible playbook '*acpr-240-deploy-logging.yml*' renamed to
  '*acpr-240-configure-logging.yml*'
- Uniformized Prometheus alert rules annotations provided via the Ansible role
  '*avaloq.acpr-monitoring*' to use only *message* and *description* ones

## [1.19.0] - 2019-10-10
### Added
- Parameter `cust_acpr_logging_curator_retention` in Ansible role '*avaloq.acpr-logging*'
  to configure the log retention per OpenShift project
- Variables `acpr_monitoring_prometheus_rule_provisioner_image` and
  `acpr_monitoring_grafana_dashboard_provisioner_image` to configure Avaloq Prometheus
  rule and Avaloq Grafana dashboard provisioners' images in Ansible role
  '*avaloq.acpr-monitoring*'
- Variable `cust_prometheus_additional_network_policy_namespace_selector` to add
  additional namespaces which have access to the Prometheus pod in OpenShift project
  *acpr-monitoring*
- '*avaloq-database-operator*' support for new `readonly` and `disconnected` modes in
  order to prevent changes to databases. See documentation topic *Application
  deployment - Requirements - Avaloq Database Operator* for more information
- Ansible role '*avaloq.constallation-deployment*' for deploying constellations to ACPR
  cluster using Avaloq Installator
### Changed
- Updated '*avaloq-database-operator*' image version from 0.5.3 to 0.6.0
- Updated '*avaloq-prometheus-rule-provisioner*' image version to 0.1.2
- Pod restart default setting in Ansible role '*avaloq.acpr-monitoring*' changed
  to *false*
- Prepare custom *node_exporter* metrics directory structure only on *nodes*
- Image pull policy in Avaloq Prometheus Rule Provisioner deployment
- Grafana dashboard '*Topic: OpenShift Project*' has been amended, improved and
  reorganized

## [1.18.1] - 2019-10-03
### Added
- Ansible playbook '*acpr-831-upgrade-efk.yml*' to verify EFK state
### Changed
- Documentation: *Release notes and upgrade guides - v1.18.0* updated to v1.18.1 to
  include release fixes
- Increased cluster readiness timeout in Ansible playbook '*acpr-890-cluster-state.yml*'
### Fixed
- Label name in *acpr-monitoring* namespace
- Fixed problem with 'avaloq-prometheus-rule-provisioner' sometimes not storing
  Prometheus rules, updated '*avaloq-prometheus-rule-provisioner*' image version to 0.1.2
- Ansible playbook '*acpr-991-destroy.yml*' when OpenShift v3.11.59 is used
- EFK Logging stack upgrade no longer failures due to Elasticsearch startup crash

## [1.18.0] - 2019-09-26
### Added
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster CI/CD* topic
- Documentation: *Install Avaloq Container Platform - OpenShift installation* topic
  renamed to *ACPR OpenShift configuration and installation*
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift configuration and
  installation* demonstration video
- Documentation: *Getting started - Releases and roadmap*: added *Red Hat OpenShift
  release lifecycle* section
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* list of required container images (OpenShift 3.11.141)
- Grafana dashboard *Topic: OpenShift Fluentd* showing the overall health status of
  *Fluentd* instances
- Variable `cust_acpr_logging_fluentd_secure_forward` within Ansible role
  '*avaloq.acpr-logging*' to configure *Fluentd* *secure_forward* plugin
- Panel descriptions in Grafana dashboards *Topic: OpenShift Node* and
  *Topic: OpenShift Cluster*
- Panel descriptions in Grafana dashboard *Topic: OpenShift etcd cluster*
- Panel descriptions in Grafana dashboard *Topic: Hosts*
- Panel descriptions in Grafana dashboard *Topic: NFS Server*
- *Skopeo* RPM installation on administration host via Ansible playbook
  '*acpr-120-prepare-environment.yml*'
- Variable `cust_docker_additional_registries` to configure additional docker registries
- Custom Prometheus metrics support to Prometheus _Node exporter_, including
  corresponding Prometheus alert rules '_FileWithCustomMetricsIsOld_' (`PAM31`) and
  '_FileWithCustomMetricsCantBeRead_' (`PAM32`)
- Prometheus _Node exporter_ custom metric to count processes waiting for NFS IO
  operations, including corresponding Prometheus alert rule
  '_NfsProcessesAreStuckInIoOperations_' `PAM33`)
- Support for OpenShift version 3.11.141
- Ansible playbook '*acpr-831-upgrade-efk.yml*' to upgrade EFK logging stack
### Changed
- Documentation: *Install Avaloq Container Platform - ACPR OpenShift cluster
  configuration and installation* restructuring
- Documentation: *Release notes* topic renamed to *Release notes and upgrade guide*
- Documentation: *Appendix* topic renamed to *Additional resources*
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) in
  *avaloq-acpr/src/jenkins/avaloq-constellation-deployment* (moved from
  *avaloq-acpr/src/jenkins/deploy/avaloq-installator-fetch-configure-deploy-execute*) to
  deploy Avaloq containerized application with the Avaloq Installator via Jenkins.
- Avaloq constellation deployment Jenkins pipeline (*Jenkinsfile*) uses by default Avaloq
  Installator version 0.13.0
- Renamed Ansible playbook '*acpr-720-certificate-expiry.yml*' to
  '*acpr-720-report-certificate-expiration.yml*'
- RPM package '*openshift-ansible*' version is bound to OpenShift version
- Default OpenShift version from v3.11.59 to v3.11.141
### Fixed
- Documentation: *Technical Requirements* implied requirement about monitoring cluster
  hosts from infrastructure perspective.
- Clashing variable names in Ansible role '*avaloq.acpr-logging*' replaced with
  *hostvars* lookup.
- Fix variable name in *README.md* file in Ansible role '*avaloq.acpr-repository*'
- Replace OpenShift template objects in Ansible role '*avaloq.acpr-logging*' with native
  Kubernetes objects to fix customization of *openshift-logging*
- Role path in Ansible playbook '*acpr-720-report-certificate-expiration.yml*' to use
  absolute path
- Missing *kafkas/status* resource in 'strimzi-cluster-operator' cluster role

## [1.17.0] - 2019-09-13
### Added
- Documentation: *Application deployment - Requirements - Avaloq Database Operator*
  instructions on how to create a administrative user for managing a database (schema)
  through the Avaloq Database Operator
- Documentation: *Frequently asked questions (FAQ)* topic: new items
- Documentation: *Application deployment - Requirements - Twistlock deployment - Security
  configuration* section
- Bash script *install_ansible.sh* to initialize administration host *yum* repositories
  configuration so to install *Ansible* without RHEL subscription
- Optional Ansible variable `cust_twistlock_console_hostname` to specify Twistlock
  Console hostname (address)
- Twistlock recommended runtime protection and compliance rules
- Optional parameter `cust_os_cluster_port` in Ansible role '*avaloq.acpr-inventory*'
  to expose OpenShift API and Console on a dedicated port
- Proxy authentication and SSL verification for ACPR RPM repo definitions in Ansible
  role '*avaloq.acpr-repository*'
- Ansible role '*avaloq.acpr-monitoring*' variables to:
  - Allow to regenerate Prometheus password upon redeployment (default: *false*)
  - Restart all '*acpr-monitoring*' project pods upon redeployment (default: *true*)
  - Define additional Prometheus targets to scrape (*jobs*)
  - Define Prometheus, Alertmanager, and Grafana network hostnames (addresses)
  - Define Prometheus deployment node selector
  - Define Prometheus database data retention period
### Changed
- Prometheus data retention set to 7 days
- Elasticsearch data retention set to 7 days
- Improved Grafana dashboard *Topic: Hosts* (memory and file system panels)
- Removed *Swap* panel from Grafana dashboard *Topic: Hosts*
- All Prometheus rules in Ansible role '*avaloq.acpr-monitoring*' are applied by
  '*avaloq-prometheus-rule-provisioner*'
- Prometheus internal password in Ansible role '*avaloq.acpr-monitoring*' namespace is not
  regenerated with every redeployment
- Removed *custom-ca* volume from Prometheus deployment
- Removed variable `cust_monitoring_reinitialize` from Ansible role
  '*avaloq.acpr-monitoring*' as it is not necessary anymore
- Renamed Ansible role '*avaloq.acpr-monitoring*' Grafana dashboard template folder from
  *grafana-dashboard* to *grafana-dashboards*
### Fixed
- Typo in Ansible role '*avaloq.acpr-inventory*' which lead to retention days not being
  applied to *Curator* configuration
- Node readiness check in Ansible playbook '*acpr-890-cluster-state.yml*' expanded with
  retry/ delay
- Remove *Fluentd* static image tag and image URL in Ansible role '*avaloq.acpr-logging*'
- *etcd* image path evaluation when multiple subdirectories are specified in
  `cust_registry_location` Ansible variable
- Missing block containing OpenShift commands to enforce cluster logout
- Inadvertently added 3.11.117 (not supported)

## [1.16.0] - 2019-08-30
### Added
- Documentation: *Technical Requirements*: table with initial application resource
  requirements
- Documentation: *Technical Requirements - Example of initial empty cluster hosts and
  resource requirements* section
- Documentation: *Technical Requirements - Avaloq Infrastructure - Testing container
  image registry access* section
- Documentation: *Troubleshooting - Common problems and errors during ACPR installation*
  topic
- Documentation: *Manage Avaloq Container Platform - Monitoring and alerting -
  Prometheus - Prometheus rules* extend table with *Severity* column
- Documentation: *Troubleshooting - ACPR repository and connectivity troubleshooting*
  topic
- *Prometheus* job _logging-pods_ for scraping *Elasticsearch* and *Fluentd* metrics
- Parameter `cust_acpr_database_operator_env` within Ansible role
  '*avaloq.acpr-database-operator*' to manage container environment variables
- Parameter `cust_acpr_database_operator_credentials` within Ansible role
  '*avaloq.acpr-operator-database*' to allow custom dba credentials
- Parameter `cust_acpr_database_operator_oracle_templates` within Ansible role
  '*avaloq.acpr-operator-database*' to allow custom oracle templates
- Optional variables `cust_logging_es_cpu_request` and `cust_logging_es_ops_cpu_request`
  for setting Elasticsearch CPU requests
- Strimzi Operator cluster-wide configuration compatibility (_v1beta1_) for version
  0.12.2 / AMQ 7.4 / AMQ Streams 1.2
- Grafana dashboard *Topic: OpenShift Elasticsearch* showing the overall health status of
  Elasticsearch clusters
- Proxy setting for ACPR RPM repo definitions in Ansible role '*avaloq.acpr-repository*'
- Avaloq container image registry check
- Variable `cust_alertmanager_configuration` to configure Prometheus Alertmanager
- Remove network-related directories upon cluster uninstall (destroy)
### Changed
- Regular expression in *Prometheus* job *kubernetes-pods* to ignore missing port numbers
  in address field
- Documentation: *Architecture - Cluster internals - Networking* minor update in network
  port list (i.e. no new ports added but removed unsued ports TCP/443 and TCP/2049)
- Updated '*avaloq-grafana-dashboard-provisioner*' image version from 0.3.0 to 0.3.2
- Updated '*avaloq-prometheus-rule-provisioner*' image version to 0.1.1
- Updated '*avaloq-database-operator*' image version to 0.5.3
- Optional variables `cust_logging_es_cpu_limit` and `cust_logging_es_ops_cpu_limit`
  default value set to 500m
- Uniformization of Alertmanager severity to use either HIGH
  (i.e. requires immediate action) or LOW (i.e. warning)
### Fixed
- Documentation: *Technical Requirements*: explicit 3 infrastructure nodes require to
  provide at least 24GB memory (or 3 infrastructure nodes with 16GB and 3 with 8GB) to
  satisfy Elasticsearch deployments' initial minimum requirements
- Task ordering in Ansible role '*avaloq.acpr-monitoring*' to ensure valid *Grafana*
  configuration generation
- Unspecified Ansible default value measurement unit '_m_' (_millicores_) for
  `cust_logging_es_cpu_limit` and `cust_logging_es_ops_cpu_limit` variables
- Missing resource requests and limits of infrastructure components on worker nodes
- Prometheus rules provided via config maps are considered only if key (file name)
  ends with '.rules'

## [1.15.1] - 2019-08-19
### Changed
- Due to a migration issue in OpenShift 3.11 (Red Hat Bugzilla
  [1741596](https://bugzilla.redhat.com/show_bug.cgi?id=1741596)) Avaloq repositories
  and registry cut over date has been postponed. A new date will be communicated.
### Fixed
- Ansible role '*avaloq.acpr-monitoring*' schedules *node-exporter* pods on all cluster
  nodes again

## [1.15.0] - 2019-08-15
### Added
- Documentation: *Release notes* for ACPR release v1.15.0
- Documentation: *Application deployment - Requirements - Twistlock deployment* topic
- Documentation: *Manage Avaloq Container Platform - Node Labels* topic
- Ansible playbook '*acpr-410-deploy-twistlock.yml*' and Ansible role
  '*avaloq.acpr-twistlock*' to deploy Twistlock
- ACPR Cluster validation check to verify configured network plugin
- Prometheus targets for *Elasticsearch* cluster
- `Always` clause to every block containing OpenShift commands to enforce cluster logout
  even if OpenShift commands failed
- Manage _node labels_ within Ansible playbook '*acpr-940-label-nodes.yml*'
- Prometheus targets for *Elasticsearch* cluster
- ACPR Cluster validation check to verify configured network plugin
- Variable `os_cluster_name` to group_vars file based on `cust_os_cluster_name`
### Changed
- **Breaking change**: New Avaloq repositories and registry set-up (cut over date: 22nd
  August 2019, see Release notes)
- Remove loopback filesystems from Grafana dashboard '*Topic: Host*'
- Unify style of common panels in  Grafana dashboards '*Topic: Host*' and
  '*Topic: OpenShift Node*'
- Made Ansible role '*avaloq.acpr-etcd*' idempotent
- The role '*avaloq.acpr-operator-database*' uses encrypted database user name and
  password
- NFS persistent volume reclaim policy changed to *Retain*
- Ensured all non- Red Hat infrastructure components are scheduled on regular worker
  nodes instead of infra nodes
### Fixed
- Documentation: Playbook names in Release notes
- Duplicate lines may appear in _/etc/exports.d/openshift-pvs.exports_ (Ansible role
  '*avaloq.acpr-storage-nfs*')

## [1.14.1] - 2019-08-05
### Added
- Documentation: OpenShift hardening installation step in *Install Avaloq Container
  Platform - OpenShift installation* topic
- Documentation: *Manage Avaloq Container Platform*: *ACPR continuous deployment* section
- Documentation: *Manage Avaloq Container Platform*: *ACPR compliance checks* section
- Documentation: *Troubleshooting - Inventory file generation discrepancies* on how to
  address Ansible inventory file discrepancies between generation executions
- Ansible playbook '*acpr-710-validate-cluster.yml*' and Ansible role
  '*avaloq.acpr-validate-cluster*' to check if the cluster is ACPR compliant
### Changed
- Documentation: *Release notes* for ACPR release v1.14.1 instead of v1.14.0
- Renamed Ansible playbook '*acpr-710-hardening.yml*' to '*acpr-160-hardening.yml*'
### Fixed
- Documentation: *Technical requirements*: explicit central Git repository requirement
- Documentation: *Technical requirements*: *ACPR compliance* section to explicit ACPR
  compliance requirements and point to instruction and resources
- Ansible playbook '*acpr-930-reconfigure-docker.yml*' to only run on OpenShift
- Missing newline after `openshift_master_public_api_url` parameter in generated Ansible
  inventory

## [1.14.0] - 2019-08-02
### Added
- Documentation: *Release notes* for ACPR releases v1.12.0 and v1.14.0
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning -
  Infrastructure prerequisites* list of required container images (ACPR, OpenShift
  3.11.59)
- Documentation: *Getting started - Releases and roadmap - Upgrade paths* section
- Documentation: *Application deployment - Requirements - Avaloq Database Operator*
  topic
- Documentation: OpenShift Network integration diagram in *Install Avaloq Container
  Platform - OpenShift installation* topic
- Documentation: ACPR default setup remarks, warning, and diagram in *Install Avaloq
  Container Platform - OpenShift installation* topic
- Documentation: *Install Avaloq Container Platform - OpenShift installation - Where to
  go from here* section
- Alertmanager console
- Ansible playbook '*acpr-990-destroy-prep.yml*' to fulfil cluster uninstall (destroy)
  prerequisites
- Kubernetes operator *avaloq-prometheus-rule-provisioner* deployment to
  *acpr-monitoring* project within Ansible role '*avaloq.acpr-monitoring*' to
  automatically provision Prometheus alerting rules
- Variables `cust_os_console_hostname`, `cust_os_console_cert_file`,
  `cust_os_console_key_file`, `cust_os_console_ca_file` for OpenShift console
  configuration
- Variable `cust_docker_storage_device` for docker storage device configuration
- Variable `cust_master_ldap_ca_file` for LDAP server CA certificate file path
- Prometheus alert rules for *etcd* cluster
- Check if `cust_os_version` is an ACPR supported OpenShift version
- Parameter `pv_mount_options` in Ansible role '*avaloq.acpr-persistent-volumes*' to
  specify mount options of NFS based persistent volumes
- Ansible tasks to role '*avaloq.acpr-status*' in order to gather information about which
  container images are cached on each node
### Changed
- **Breaking change**: Removed default value of `cust_os_version` in Ansible role
  '*avaloq.acpr-inventory*'. This newly requires to set `cust_os_version` so to ensure
  that a controlled OpenShift update is executed in future ACPR releases.
- Documentation: updated reference architecture diagram in *Architecture* topic to
  include administration host communications
- Documentation: improved default domain names to represent more realistic network
  architectures (_example.com_ as example domain name for external access, _example.net_
  for management, and _example.local_ for the cluster network)
- Removed '*--openshift-sar*' and '*--openshift-delegate-urls*' startup arguments
  from Grafana and Prometheus deployments
- Made ACPR specific customization of *openshift-logging* re-runnable
- Renamed Ansible playbook '*acpr-990-destroy.yml*' to '*acpr-991-destroy.yml*'
- Renamed Ansible playbook '*acpr-991-destroy-storage.yml*' to
  '*acpr-992-destroy-storage.yml*'
- The tasks from Ansible playbook '*acpr-930-reconfigure-docker.yml*' moved to the
  '*avaloq.acpr-docker*' role
- Default value for *openshift-logging* parameter `cust_logging_es_cpu_limit` set from
  '1' to '500m'
- Made *etcd* monitoring configuration within role '*avaloq.acpr-monitoring*' idempotent
- Remove not recommended parameter 'storage.tsdb.min-block-duration' from Prometheus
  deployment
- Ensured Avaloq Grafana Dashboard Provisioner and Database Operator are scheduled on
  infrastructure nodes
### Fixed
- Documentation: *Technical requirements*: improved PKI requirements
- ACPR all-in-one installation to advertize API/console port 8443 when no load balancer
  is used
- OpenShift Elasticsearch CPU limit and request are now applied (Red Hat Bugzilla
  [1598321](https://bugzilla.redhat.com/show_bug.cgi?id=1598321) - CLOSED WONTFIX)

## [1.12.0] - 2019-07-18
### Added
- Documentation: *Getting started - Obtaining and managing ACPR codebase* topic
- Documentation: *Upgrade Avaloq Container Platform* topic covering both ACPR and
  OpenShift upgrade instructions
- Documentation: *Application deployment - Requirements - Kafka Strimzi Operators -
  Failover* section
- Documentation: initial *Architecture - Monitoring, alerting, and logging* topic
- Documentation: *Manage Avaloq Container Platform - Monitoring and alerting -
  Alertmanager - Alertmanager rules* section
- Alertmanager rule-set in Ansible role '*avaloq.acpr-monitoring*'
- Ansible playbook '*acpr-620-deploy-operator-database.yml*' (and corresponding role
  '*avaloq.acpr-operator-database*') to configure cluster-wide Avaloq Database Operator
- Ansible role '*avaloq.acpr-status*' and playbook '*acpr-730-acpr-status.yml*' to gather
  information for support purposes about the ACPR OpenShift installation and configured
  repositories
- Ansible playbook '*acpr-820-upgrade-ose-prerequisites.yml*' to prepare for
  OpenShift upgrade
- Ansible playbook '*acpr-821-storage-migr.yml*' to execute storage migration (etcd)
- Ansible playbook '*acpr-830-upgrade-ose.yml*' to upgrade OpenShift version
- Ansible playbook '*acpr-890-cluster-state.yml*' to verify cluster health
- CPU utilization panel in Grafana dashboard '*Topic: OpenShift Project*'
- Ansible playbook '*acpr-920-login.yml*' to login to a cluster
- Ansible playbook '*acpr-921-logout.yml*' to logout from a cluster
- Ansible playbook '*acpr-930-reconfigure-docker.yml*' to deploy *docker*
  daemon configuration
- Ansible role '*avaloq.acpr-utils*' which contains additional tasks for ACPR
  installation and day to day operations
- Prometheus relabeling configuration entries in order to show *app* and *avq_app* labels
- Grafana dashboard *Topic: OpenShift Cluster* showing the overall health status of
  the cluster
- UTC timestamp suffix to backups produced by Ansible role '*avaloq.acpr-backup*'
- Ansible role '*avaloq.acpr-backup*' `retention_days` variable to define the number of
  days backups are kept
- Prometheus targets for *etcd* cluster
- Grafana dashboard *Topic: OpenShift etcd Cluster* showing the status of the OpenShift
  *etcd* cluster
### Changed
- Documentation: Release information in topic *Getting started - ACPR OpenShift releases
  and roadmap*
- Layout improvements in Grafana dashboard '*Topic: OpenShift Project*'
- Location (folder *~/acpr*) where the generated *htpasswd* files are stored (when not
  using LDAP configuration)
- Removed job type 'nfs-server' from Grafana dashboard 'NFS Server'
- Increase time Ansible task in '*avaloq.acpr-monitoring*' role waits for Grafana pod to
  to spin up
- Default backup directory in '*avaloq.acpr-backup*' set to *~/acpr-backup*
- Removed NodeTypes groups from all Grafana dashboards
- Minor layout modifications and added refresh interval in Grafana dashboard *Topic:
  OpenShift Project*
- Removed *all* selection and added refresh interval in Grafana dashboard *Topic: Host*
- Removed *all* selection and added refresh interval in Grafana dashboard *Topic: NFS
  Server*
- Removed *all* selection in Grafana dashboard *Topic: OpenShift Node*
- Each Grafana dashboard is applied via an OpenShift ConfigMap
### Fixed
- Install 'libsemanage-python' package in Ansible role
  '*avaloq.acpr-prepare-environments*'
- Value of 'htpasswd_pass' variable in Ansible role '*avaloq.acpr-monitoring*' not being
  correctly consumed
- Install privileges in Ansible role '*avaloq.acpr-auth*'
- Make sure 'python-passlib' package installation in '*avaloq.acpr-inventory*' is a
  privileged task
- Delete *htpasswd* files upon cluster uninstall (destroy) and do not regenerate them if
  they are already existing (eg. when updating the cluster)
- Removed Grafana dashboards *id* field, standardized file names and *uid*

## [1.11.0] - 2019-07-04
### Added
- Ensure that SELinux boolean parameter `virt_use_nfs` is set to true
  (allows pods to access NFS volumes)
- Set kernel parameter `vm.max_map_count` to 262144 according to Elasticsearch
  recommendations
### Changed
- Updated '*avaloq-grafana-dashboard-provisioner*' image version from 0.2.3 to 0.3.0
- Save *htpasswd* used by Prometheus in Secret object (Ansible role
  '*avaloq.acpr-monitoring*')
- Bind OpenShift 3.11 version to ACPR release (current: v3.11.59)
### Fixed
- Ansible role '*avaloq.acpr-prepare-environments*' does not expect that NetworkManager
  profile name is the same as the primary interface name
- Ansible role '*avaloq.acpr-inventory*' now generates *htpasswd* filenames containing the
  clusters FQDN to allow multiple cluster installations from the same bastion
- ACPR logging in all-in-one installation

## [1.10.0] - 2019-06-20
### Added
- Information about the ACPR code being distributed under the *Apache license 2.0*
- Documentation: *Application deployment - Requirements - Kafka Strimzi Operators* topic
- Documentation: *Getting started - Project planning - Roles and skill sets* topic
- Ansible playbook '*acpr-210-deploy-storage-classes.yml*' (and corresponding role
  '*avaloq.acpr-storage-classes*') to deploy the storage classes
- Ansible role '*avaloq.acpr-inventory*' `cust_lb_host` variable to install HAProxy load
  balancer (limited ACPR support)
- Grafana dashboard *Cluster: NFSd metrcis* showing metrics based on Prometheus
  _Node exporter_
- Jenkins pipeline (*Jenkinsfile*)
  *deploy/avaloq-installator-fetch-configure-deploy-execute* to deploy Avaloq
  containerized application with the Avaloq Installator via Jenkins.
### Changed
- Renamed Ansible playbook '*acpr-210-deploy-persistent-volumes.yml*' to
  '*acpr-220-deploy-persistent-volumes.yml*'
- Renamed Ansible playbook '*acpr-220-deploy-monitoring.yml*' to
  '*acpr-230-deploy-monitoring.yml*'
- Renamed Ansible playbook '*acpr-230-deploy-logging.yml*' to
  '*acpr-240-deploy-logging.yml*'
- Restructured Ansible role '*avaloq.acpr-monitoring*' code to use templating-pattern for
  increased maintainability
- Renamed Grafana dashboards names to follow ACPR naming convention
### Fixed
- Documentation: *Technical Requirements*: insecure container image registry
  implementation explicitly not supported
- Remove _openshift-installer_ only when the cluster uninstall (destroy) was successful
- Broken Ansible playbook '*acpr-110-generate-inventory.yml*' execution if proxy settings
  are not defined
- Override of Alertmanager certificates by removing deployment of *ca-bundle-volume*
  volume and *ca-bundle* Secret object from Ansible role '*avaloq.acpr-monitoring*'
- *Disk I/O Utilisation* graph expression in Grafana *Cluster: Hosts metrics* dashboard

## [1.9.0] - 2019-06-07
### Added
- Documentation: *Avaloq application deployment - Requirements - Kafka Strimzi Operator
  configuration* topic
- Ansible playbook '*acpr-610-deploy-operator-strimzi.yml*' (and corresponding role
  '*avaloq.acpr-operator-strimzi*') to deploy cluster-wide Kafka Strimzi Operator
  configuration (_v1alpha1_)
- Ansible role '*avaloq.acpr-monitoring*' `cust_monitoring_reinitialize` variable to
  support monitoring stack redeployment
- Parameter `monitoring_pvs_purge` in '*avaloq.acpr-monitoring*' to purge Grafana PVs
  upon optional monitoring reinitialization
- Option to delete data of NFS based persistent volumes
- Mention usage of Ansible Vault
### Changed
- Documentation: *Technical Requirements*: minimum infrastructure nodes increased from 2
  to 3 nodes because of Elasticsearch minimum requirements
- Updated '*avaloq-grafana-dashboard-provisioner*' image version from 0.2.2 to 0.2.3
- Persistent volume access mode from RWX to RWO for 'grafana-log-pvc' and
  'grafana-lib-pvc' volumes in Ansible role '*avaloq.acpr-monitoring*'
### Fixed
- Add network policy to allow prometheus to scrape avaloq-grafana-dashboard-provisioner
  metrics

## [1.8.0] - 2019-05-23
### Added
- Variable `cust_ansible_become` for managing privilege escalation of Ansible
- Grafana dashboard *Cluster: Hosts metrcis* showing metrics based on Prometheus
  _Node exporter_
### Changed
- Grant cluster-admin privileges to initial *acpr* user
- Install `yum-utils` environment package in Ansible role
  *'avaloq.acpr-prepare-environments'*
### Fixed
- Configure `HTTP_PROXY` and `HTTPS_PROXY` variables in *docker* daemon if OpenShift
  requires a proxy server to connect to the registry

## [1.7.0] - 2019-05-10
### Added
- Documentation: *Architecture - Cluster internals - Storage* topic
- Documentation: *Install Avaloq Container Platform - Infrastructure prerequisites* -
  *Persistent storage* section
- Ansible playbook *'acpr-710-hardening.yml'* to report hardening status
- Possibility to configure GPG keys for particular RPM repositories
- Parameter to use ephemeral or local storage (*hostPath*) for Elasticsearch instances
### Changed
- Documentation and README.md overall review
- Documentation: improved Amazon Web Services (AWS) provisioning instructions
- Moved Amazon Web Services (AWS) provisioning of the *Elastic IP* resources from the
  dynamic-provisioning phase to the static one
- Add more details to Ansible role descriptions
- Updated OpenShift 3.11 required Ansible version from 2.4 to 2.6
- Renamed parameter `cust_aws_nat_gateway_id` to `cust_aws_nat_gateway_eip_id`
- Send OpenShift *master API* audit logs to Elasticsearch as default
### Fixed
- Documentation: *Technical Requirements* - *Avaloq Infrastructure*: added missing Avaloq
  container image registry IP address

## [1.6.0] - 2019-04-25
### Added
- Documentation: *Signing docker images* topic
- Parameters `cust_aws_nat_gateway_id` and `cust_aws_vpc_id` to specify existing
  gateway and VPC on Amazon Web Services (AWS)
- Parameter `cust_storage` to define persistent storage setup
- Ansible playbook to provision static Amazon Web Services (AWS) infrastructure
  *acpr-010-provision-aws-static-infrastructure.yml*
- Ansible playbook '*acpr-150-storage-nfs.yml*' to set-up Network File System (NFS)
  storage
- Ansible playbook '*acpr-210-deploy-persistent-volumes.yml*' to deploy Persistent
  Volume (PV) objects
- Ansible playbook '*acpr-720-certificate-expiry.yml*' to report SSL certificate status
- Ansible playbook '*acpr-990-destroy.yml*' to uninstall (destroy) OpenShift and *docker*
  from all nodes
- Ansible playbook '*acpr-991-destroy-storage.yml*' to delete storage data
- Grafana Java vCPU and memory overview panel
### Changed
- Documentation: Architecture diagram
- *etcd* encryption key generation mechanism
- Renamed playbook *acpr-010-provision-aws-infrastructure* to
  *acpr-020-provision-aws-infrastructure*
- Renamed '*acpr-210-deploy-monitoring.yml*' to '*acpr-220-deploy-monitoring.yml*'
- Renamed '*acpr-220-deploy-logging.yml*' to '*acpr-230-deploy-logging.yml*'
### Fixed
- Install *docker* daemon on all *nodes* and not on *all* hosts (i.e. to exclude NFS
  host)
- Remove registry name from image path in *acpr-monitoring* project
- Remove special characters from ACPR user initial password

## [1.5.0] - 2019-04-11
### Added
- Documentation: *Troubleshooting - Refreshing Prometheus monitoring targets* on how to
  reload Prometheus targets
- Documentation: Technical requirements for *provisioner* host
- Prerequisite check if DNS settings are managed by NetworkManager
- Prerequisite check if IPv4 forwarding is not explicitly disabled
- Prerequisite check if the system requires a reboot due to package updates
- Differentiation between public and private cluster hostnames by introducing the
  variable `cust_os_cluster_internal_name`
- Network File System (NFS) server provisioning on Amazon Web Services (AWS)
  (`cust_aws_nfs_count`)
- Optional variable `cust_nfs_hosts` to specify Network File System nodes
- Parameters to configure *openshift-logging* project resource limits
- Amazon Web Services (AWS) hosts' *NetworkManager* preparation Ansible task in
  '*avaloq.acpr-prepare-environments*' role
- Kuberenetes operator *avaloq-grafana-dashboard-provisioner* deployment to
  *acpr-monitoring* project within Ansible role '*avaloq.acpr-monitoring*' to
  automatically provision Grafana application dashboards
- Parameter `cust_acpr_trusted_cacerts` in '*avaloq.acpr-inventory*' to support the trust
  of additional CA certificates
- Ansible playbook *'acpr-140-post-install.yml'* to run post installation tasks
- Ansible code to add custom router certificates to trusted *ca-bundle* on  master nodes
  (e.g. used by OAuth Proxy)
- Ansible role '*avaloq.acpr-etcd*' to configure *etcd*
- *etcd* Secret objects encryption at rest (*AES-CBC with PKCS#7 padding*)
### Changed
- Documentation: Manually copying installation files to bastion host is newly included
  in the Ansible playbook '*acpr-010-provision-aws-infrastructure.yml*'
- Removed `cust_aws_etcd_count` variable from AWS deployment. Currently ACPR supports
  *etcd* cluster only on master nodes
- Moved hosts' operating system upgrade from Terraform provisioning to new Ansible
  playbook '*acpr-810-upgrade-system.yml*'
- Removed Ansible task *Pre-pull ose-pod image* from role '*avaloq.acpr-docker*'
- Renamed Ansible role '*avaloq.acpr-prereq*' to '*avaloq.acpr-prepare-environments*'
### Fixed
- Removed provisioning privileged user dependency

## [1.4.0] - 2019-03-28
### Added
- Documentation: ACPR OpenShift Amazon Web Services (AWS) technical requirements
- Documentation: Master Data Management (MDM) *ACPR - Container Delivery Access*
  role requirement
- Documentation: *Architecture - Cluster types* topic
- Documentation: *Avaloq Container Platform security - Detailed infrastructure
  security requirements* topic
- Documentation: *Avaloq Container Platform security - Container infrastructure
  security threat model* topic
- Documentation: *Install Avaloq Container Platform - Infrastructure provisioning* topic
- Documentation: *Manage Avaloq Container Platform - Logging* topic
- Ansible playbook '*acpr-220-deploy-logging.yml*' and
  role 'avaloq.acpr-logging' to configure the *openshift-logging* project
- Ansible playbook '*acpr-010-provision-aws-infrastructure.yml*' and
  role 'avaloq.acpr-aws-provision' to provision Amazon Web Services (AWS)
- Ansible role '*avaloq.acpr-auth*' to allow authentication to OpenShift from other tasks
- Ansible role '*avaloq.acpr-docker*' to install and configure the *docker* daemon and
  registry
- Ansible role '*avaloq.acpr-aws-configuration*' to generate ACPR configuration file
- NetworkPolicy rules to *acpr-monitoring* project
- Alertmanager default rules (email)
### Changed
- Documentation: moved and centralized installation documentation in WebHelp Community
  documentation
- Renamed Ansible playbooks for clarity (ordered file list)
  - '*deploy-acpr.yml*' renamed to '*acpr-130-install.yml*'
  - '*deploy-acpr-monitoring.yml*' renamed to '*acpr-210-deploy-monitoring.yml*'
  - '*ose_backup.yml*' renamed to 'acpr-910-backup-ose.yml'
  - '*prepare-acpr-host.yml*' renamed to '*acpr-120-prepare-environment.yml*'
- Merged '*prepare-acpr.yml*' and '*prepare-acpr-hosts.yml*' Ansible playbooks into
  '*acpr-120-prepare-environment.yml*'
- Moved Ansible role '*avaloq.docker-build*' into '*avaloq.acpr-docker*' with
  additional configuration options
- Improved ACPR inventory generator to create a plain OpenShift inventory file and an
  Avaloq specific Ansible variable file ('*acpr-110-generate-inventory.yml*' playbook)
### Fixed
- BASE64 variable assignment in Ansible role '*avaloq.acpr-monitoring*'
- Set `osm_host_subnet_length` OpenShift variable with `cust_osm_host_subnet_length`

## [1.3.0] - 2019-03-14
### Added
- Documentation: ACPR OpenShift backup and restore
- Documentation: RPM and container repository prerequisite setup
- Documentation: HTTP2 or SPDY protocols for load balancer requirements
- Documentation: Automatic static egress IPs for external namespace traffic with CIDR
- Support for custom container image registry
- Ansible role '*avaloq.acpr-monitoring*' to setup monitoring stack
### Changed
- Set ACPR OpenShift SDN plugin to `redhat/openshift-ovs-networkpolicy`
### Fixed
- Set `osm_etcd_image` OpenShift variable

## [1.2.1] - 2019-03-08
### Added
- Missing '*prepare-acpr-host.yml*' playbook
### Changed
- Ansible role '*avaloq.acpr-repository*' name in '*prepare-acpr-host.yml*' playbook
- Removed `openshift_node_kubelet_args` variable from ACPR inventory template
- Wrong order of two Ansible roles in playbook '*prepare-acpr-host.yml*'
- Use Avaloq RPM and container image registry for default ACPR OpenShift installation

## [1.2.0] - 2019-02-28
### Added
- Documentation: ACPR release cycle description
- Documentation: licensing and support process description
- Documentation: ACPR infrastructure and hosts prerequisites
- Documentation: monitoring introduction
- Ansible playbook '*prepare-acpr-hosts.yml*' and
  role '*avaloq.acpr-prereq*' to check ACPR OpenShift infrastructure and host
  prerequisites
- Ansible role '*avaloq.acpr-repository*' for Avaloq repository setup for Red Hat RPMs
- Support for custom master and router certificates in '*acpr-inventory*' Ansible role
### Changed
- Documentation: Updated technical requirements sizing for initial OpenShift installation
  Sizing must be evaluated according to application requirements
- Git *origin* remote must be added so not to throw "git remote add origin throws
  'fatal: remote origin already exists'" (327916)

## [1.1.0] - 2019-02-14
### Added
- Documentation: updated technical requirements (NTP Infrastructure as mandatory external
  component)
- Ansible role '*ose_backup.yml*' for OpenShift cluster backup
- Ansible role '*avaloq.docker-build*' for docker build host maintenance
- Ansible role '*prepare-acpr.yml*' for bastion host configuration
- Ansible role '*deploy-acpr.yml*' for OpenShift installation
- Ansible role '*acpr-inventory*' for ACPR compliant OpenShift inventory generation
- Installation and update instructions of ACPR git repository
### Changed
- Documentation: Technical requirements (NTP Infrastructure as mandatory external
  component)

## [1.0.0] - 2019-01-31
### Added
- Technical requirements and initial ACPR documentation
