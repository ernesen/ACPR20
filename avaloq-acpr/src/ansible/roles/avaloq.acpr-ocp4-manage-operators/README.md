# Ansible role '*avaloq.acpr-ocp4-manage-operators*'

Manage OpenShift4 Operators


## Requirements

* Ansible > 2.9

## Role variables

|ACPR configuration variable                    |Role variable name                     |Description                                                |Default     |
|-----------------------------------------------|---------------------------------------|-----------------------------------------------------------|------------|
|`cust_operatorhub_operators`                   |`acpr_operatorhub_operators`           |List of Operators to install from OperatorHub              |            |


### `acpr_operatorhub_operators` variable

This variable has no default values.

```YAML
cust_operatorhub_operators:
  - name: awx-resource-operator
    scope: namespace
    namespace: custom-operator-ns1
    channel: release-0.1
    source: redhat-operators
  - name: cert-manager-operator
    scope: cluster
    namespace: openshift-operators
    channel: stable
    source: certified-operators
  - name: kube-arangodb
    scope: namespace
    namespace: custom-operator-ns2
    channel: stable
    source: certified-operators
  - name: elasticsearch-operator
    scope: cluster
    namespace: openshift-operators-redhat
    channel: '4.6'
    source: redhat-operators
  - name: jaeger-product
    scope: cluster
    namespace: openshift-operators
    channel: stable
    source: redhat-operators
  - name: kiali-ossm
    scope: cluster
    namespace: openshift-operators
    channel: stable
    source: redhat-operators
  - name: servicemeshoperator
    scope: cluster
    namespace: openshift-operators
    channel: stable
    source: redhat-operators
```

**Note**: If you're running a _disconnected cluster_ you must ensure the operator
container images are available in your registry.
