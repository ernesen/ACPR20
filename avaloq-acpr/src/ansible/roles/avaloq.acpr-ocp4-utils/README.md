# Ansible role '*avaloq.acpr-ocp4-utils*'

This role provides support tasks, templates, files etc. for ACPR installation and day to day operations.
Features:
* adding Egress IP to namespaces

## Requirements

* Ansible >= 2.9
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role does not require privilege escalation.

### Dependencies

None.

## Role variables
### Optional variables

|ACPR configuration variable                  |Role variable name                         |Description                                                                           |Default       |
|---------------------------------------------|-------------------------------------------|--------------------------------------------------------------------------------------|--------------|
|`cust_egress`                                |`acpr_egress`                              |                                                                                      |              |
|`cust_egress_cidr`                           |`acpr_egress_cidr`                         |                                                                                      |              |
|`cust_machineconfig`                         |`acpr_machineconfig`                       |cust_machineconfig.master.skip_verify: false                                          |_false_       |
|`cust_machineconfig`                         |`acpr_machineconfig`                       |cust_machineconfig.worker.skip_verify: true                                           |_true_        |
