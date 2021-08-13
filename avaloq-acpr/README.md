# Avaloq Container Platform Reference (ACPR)

## Getting Started

### ACPR code-base

```
avaloq-acpr
└── src
    ├── acpr               // ACPR configuration
    ├── ansible            // Ansible sources
    |   ├── playbooks
    |   │   ├── group_vars
    |   │   ├── library
    |   │   └── vars
    |   └── roles
    ├── constellations     // ACPR applications and components configurations
    └── jenkins            // Jenkins sources
```

Refer to the following resources for further detailed technical information:
* [Avaloq Container Platform Reference (ACPR) documentation](https://docs.avaloq.com/acpr)
* [/README.md](../README.md)
* [/CHANGELOG.md](../CHANGELOG.md)
* [src/ansible/README.md](src/ansible/README.md)
* [src/jenkins/README.md](src/jenkins/README.md)

### Installation phases

An ACPR implementation consists of three main phases:

1. Environment provisioning
2. ACPR configuration
3. Ansible playbooks execution
   1. Ansible inventory file generation from ACPR configuration
   2. OpenShift installation
   3. OpenShift ACPR-compliant configurations and deployments

>**NOTE**: Refer to the
[Avaloq Container Platform Reference (ACPR) documentation](https://docs.avaloq.com/acpr)
for further information and when referring to the topics mentioned below.

#### Environment provisioning

Refer to the following documentation topics for provisioning an ACPR OpenShift cluster:

* *Technical requirements*
* *Install Avaloq Container Platform - Infrastructure provisioning*

#### ACPR OpenShift configuration and installation

Refer to the following documentation topics for installing an ACPR OpenShift cluster:

* *Install Avaloq Container Platform - Infrastructure provisioning - Installation
prerequisites*
* *Install Avaloq Container Platform - ACPR OpenShift configuration and installation*
* *Install Avaloq Container Platform - ACPR applications configuration and deployment*

#### Environment and ACPR administration

Refer to the following documentation topics for administering the environment and
ACPR installation:

* *Manage Avaloq Container Platform*
* *Upgrade Avaloq Container Platform*
* *Avaloq application deployment*
