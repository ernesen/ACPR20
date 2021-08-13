# Ansible role '*avaloq.acpr-status*'

This role gathers information about the cluster and all nodes and stores them on the
bastion host. The resulting folder can then be delivered to Avaloq if asked by the Support.

The following information is included:
* Version of the ACPR repository
  * Local changes to the ACPR
* Docker version of all nodes
* Kubelet version of all nodes
* Sosreport of every node (See the [Red Hat documentation](https://access.redhat.com/solutions/1149933) for a full list of copied files)

The role also creates container images summary in CSV format and saves it on the bastion
host to the following destination `~/acpr/avaloq.acpr-status/docker-images-summary.csv`

Example of the CSV output:

```csv
# Node_hostname,node_type,registry_url,image_name,image_tag,image_size(bytes) 
node1.example.com,master,registry.service.avaloq.com,openshift3/ose-node,v3.11.154,1209964361
node2.example.com,infra,registry.service.avaloq.com,openshift3/ose-node,v3.11.154,1209964361
node3.example.com,compute,registry.service.avaloq.com,openshift3/ose-pod,v3.11.154,253238798

```

**NOTE**: The gathered information might include sensitive information.

## Requirements

* Ansible >= 2.6

### Privilege escalation

This Ansible role requires privilege escalation.

### Dependencies

None.

## Role variables

Below is a list of all currently supported variables.

### Required variables

| Parameter            | Description                         | Default |
|----------------------|-------------------------------------|---------|
| `customer_id`        | Customer ID to include in filenames | *none*  |
| `generate_sosreport` | If an sosreport should be generated | *true*  |

## Usage examples

Usage within a playbook:

```yaml
- name: ACPR | Gather cluster status information
  hosts: all
  become: true
  gather_facts: false
  roles:
    - role: avaloq.acpr-status
```
