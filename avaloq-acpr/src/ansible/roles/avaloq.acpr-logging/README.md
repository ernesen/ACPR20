# Ansible role '*avaloq.acpr-logging*'

Configure '*openshift-logging*' OpenShift project persistent storage.
Enable *master API* audit logging.

The execution interacts with the '*openshift-logging*' OpenShift project and executes the
following steps:
1. Label logging *es-ops* and *es* infrastructure nodes to bind Elasticserach deployments
   Note: two Elasticserach stacks are installed in OpenShift (one for cluster-, and the
   other the application-logging purposes)
2. Deploy NetworkPolicy objects
3. Stop (scale-down) Elasticserach
4. Configure Elasticserach storage
5. Start (scale-up) Elasticserach
6. Enable *master API* audit logging

>**NOTE**: Each time this role is executed, the ElasticSearch cluster is restarted

>**NOTE**: No data is migrated from a previous storage location.

>**NOTE**: By default Kubernetes *hostPath* plugin is used as storage backend. This is ok
for a test installation but it is not recommended in a productive set-up, and a block
storage backed must be provided.

>**NOTE**: Support for defining block storage configuration is under development and will
be available in a future ACPR release.

## Requirements

* Ansible >= 2.6
* Block storage Persistent Volume (PV) objects (if a productive cluster)
* Successful ACPR compliant OpenShift installation (includes `openshift-logging` project)

### Privilege escalation

This Ansible role requires privilege escalation.

| Task file       | Task name              | Description                                                                |
|-----------------|------------------------|----------------------------------------------------------------------------|
|`label_node.yml` | create hostPath volume | Creates directory for local *hostPath*- volume and sets correct permission |

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

## Role variables

| Parameter                               | Description                                                                                   | Default                              |
|-----------------------------------------|-----------------------------------------------------------------------------------------------|--------------------------------------|
| `acpr_logging_curator_retention`        | Dictionary containing OpenShift namespaces and their log retention                            |                                      |
| `acpr_logging_fluentd_image`            | Container image of Fluentd container                                                          | *openshift3/ose-logging-fluentd*     |
| `acpr_logging_fluentd_secure_forward`   | Configuration of the fluentds *secure_forward* plugin                                         |                                      |
| `acpr_logging_hostpath_dir`             | Path where to place local Elasticsearch data                                                  | */var/lib/origin/es-storage*         |
| `acpr_logging_masterapi_audit_feed_efk` | If *master API* audit logs should sent to elasticsearch                                       | *true*                               |
| `acpr_logging_node_selector`            | Node selector for the openshift-logging project                                               | *node-role.kubernetes.io/infra=true* |
| `acpr_logging_pv_use_hostpath`          | If Elasticsearch pods in openshift-logging project should use local storage (e.g. *hostPath*) | *true*                               |

## Usage examples

Usage within a playbook:

```yaml
- name: ACPR | Deploy logging infrastructure
  hosts: localhost
  become: false
  vars:
    acpr_logging_curator_retention:
      acpr-monitoring:
        weeks: 4
      acpr-database-operator:
        months: 6
      acpr-test:
        days: 2
  roles:
    - role: avaloq.acpr-logging
```

### Example secure forward configuration
The variable `acpr_logging_fluentd_secure_forward` can be used to configure fluentd's *secure_forward* plugin.

```yaml
acpr_logging_fluentd_secure_forward: |
    <store>
    @type secure_forward

    self_hostname "#{ENV['HOSTNAME']}"
    shared_key ocpaggregatedloggingsharedkey (1)

    secure yes
    # enable_strict_verification yes

    ca_cert_path /etc/fluent/keys/external_ca_cert.pem (2)
    ca_private_key_path /etc/fluent/keys/external_ca_key.pem (3)
    ca_private_key_passphrase ocpsecureforward (4)

    <server>
      host 10.9.49.72 (5)
      port 24284 (6)
    </server>
    </store>
```
