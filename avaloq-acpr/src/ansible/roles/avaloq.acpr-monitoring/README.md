# Ansible role '*avaloq.acpr-monitoring*'

Deploys ACPR monitoring implementation within '*acpr-monitoring*' OpenShift project.

Following component deployments are included:

* Prometheus
  * node_exporter
  * kube-state-metrics
* Alertmanager
* Alertmanager console
* Grafana
* avaloq-grafana-dashboard-provisioner
* avaloq-prometheus-rule-provisioner

Following notable functionality is included:

* Alertmanager rules and console
* Grafana dashboards to
  * monitor the ACPR OpenShift cluster
  * monitor ACPR application deployments
* Avaloq Grafana Dashboard provisioner, to automatically provision ACPR application
  dashboards to the Grafana instance.
* Avaloq Prometheus Rule provisioner, to automatically provision alert rules to the
  Prometheus instance.

## Requirements

* Ansible >= 2.6
* Successful ACPR compliant OpenShift installation

### Privilege escalation

This Ansible role requires privilege escalation.

| Task file | Task name                                    | Description                                  |
|-----------|----------------------------------------------|----------------------------------------------|
|`etcd.yml` | Fetch CA files from master to temp directory | Fetch etcd CA files from one of the masters  |

### Dependencies

* Ansible role '*avaloq.acpr-auth*'

### Storage

| Persistent Volume Claim name | Storage type                            | Description                           |
|------------------------------|-----------------------------------------|---------------------------------------|
| `grafana-log-pvc`            | File-based (RWO)                        | Grafana logs                          |
| `grafana-lib-pvc`            | File (RWO) or block-based (recommended) | Grafana SQLite database location      |
| `grafana-dashboards-volume`  | File-based (RWX)                        | Grafana dashboard location            |
| `prometheus-data`            | File (RWO) or block-based (recommended) | Prometheus database location          |
| `prometheus-rules-volume`    | File-based (RWX)                        | Prometheus Alert rules location       |


## Role variables

| Parameter                                                                | Description                                                                                                                  | Default                                                                                   |
|--------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| `acpr_grafana_dashboard_image`                                           | Container image of Grafana dashboard                                                                                         | openshift3/grafana:v3.11                                                                  |
| `acpr_monitoring_alertmanager_configuration`                             | Prometheus Alertmanager configuration*                                                                                       | `default_alertmanager_configuration` variable. See *vars/main.yml* for more information.  |
| `acpr_monitoring_alertmanager_hostname`                                  | Select a hostname which will be used to access Alertmanager. If empty, OpenShift will generate the hostname automatically    |                                                                                           |
| `acpr_monitoring_alertmanager_image`                                     | Container image of Prometheus Alertmanager                                                                                   | openshift3/prometheus-alertmanager:v3.11                                                  |
|`acpr_monitoring_cluster_name`                                            | Cluster name. This variable is used in case of federation of multiple Prometheus instances                                   |                                                                                           |
| `acpr_monitoring_grafana_dashboard_provisioner_image`                    | Container image of Grafana dashboard provisioner                                                                             | avaloq/avaloq-grafana-dashboard-provisioner:0.6.4                                         |
| `acpr_monitoring_grafana_hostname`                                       | Select a hostname which will be used to access Grafana. If empty, OpenShift will generate it automatically                   |                                                                                           |
| `acpr_monitoring_grafana_node_selector`                                  | Specify a node where Grafana is deployed                                                                                     |                                                                                           |
| `acpr_monitoring_grafana_persistent_volume_claim`                        | Volume name where Grafana data are stored                                                                                    | _grafana-lib-pvc_                                                                         |
| `acpr_monitoring_kube_state_metrics_image`                               | Container image of  kube-state-metrics                                                                                       | openshift3/ose-kube-state-metrics:v3.11                                                   |
| `acpr_monitoring_oauth_proxy_image`                                      | Container image of Oauth proxy                                                                                               | openshift3/oauth-proxy:v3.11                                                              |
| `acpr_monitoring_ocp3_node_exporter_compat`                              | Configure legacy Prometheus rules from '_openshift-monitoring_' project to provide legacy node_exporter compatibility        | *false*                                                                                   |
| `acpr_monitoring_ocp3_prometheus_jobs`                                   | Configure legacy Prometheus scrape jobs from '_openshift-monitoring_'                                                        | *false*                                                                                   |
| `acpr_monitoring_ocp3_rules`                                             | Configure Prometheus recording rules from '_openshift-monitoring_' project                                                   | *false*                                                                                   |
| `acpr_monitoring_prometheus_additional_jobs`                             | Additional Prometheus jobs to scrape                                                                                         |                                                                                           |
| `acpr_monitoring_prometheus_additional_network_policy_namespace_selector`| An array of additional namespaces which have access to the Prometheus pod                                                    |                                                                                           |
| `acpr_monitoring_prometheus_database_retention`                          | For how long Prometheus will keep individual metrics                                                                         | 7d                                                                                        |
| `acpr_monitoring_prometheus_hostname`                                    | Select a hostname which will be used to access Prometheus. If empty, OpenShift will generate the hostname automatically      |                                                                                           |
| `acpr_monitoring_prometheus_image`                                       | Container image of Prometheus                                                                                                | openshift3/prometheus:v3.11                                                               |
| `acpr_monitoring_prometheus_node_exporter_image`                         | Container image of Prometheus Node exporter                                                                                  | openshift3/prometheus-node-exporter:v3.11                                                 |
| `acpr_monitoring_prometheus_node_selector`                               | Specify a node where Prometheus is deployed                                                                                  |                                                                                           |
| `acpr_monitoring_prometheus_persistent_volume_claim`                     | Volume name where Prometheus data are stored                                                                                 |  _prometheus-data_                                                                        |
| `acpr_monitoring_prometheus_rule_provisioner_image`                      | Container image of Prometheus rule provisioner                                                                               | avaloq/avaloq-prometheus-rule-provisioner:0.2.4                                           |
| `acpr_monitoring_pvs_purge`                                              | Remove all PVs before monitoring reinitialization                                                                            | *false*                                                                                   |
| `acpr_monitoring_regenerate_prometheus_password`                         | Regenerate Prometheus internal password. Warning: This can affect all other services using the password outside this project | *false*                                                                                   |
| `acpr_monitoring_restart_all_monitoring_pods`                            | Restart all pods in the project after successful deployment                                                                  | *true*                                                                                    |
| `acpr_monitoring_prometheus_node_exporter_resources_enable`              | Enable or disable Prometheus Node exporter resources requests and limits                                                     | *true*                                                                                    |
| `acpr_monitoring_prometheus_node_exporter_resources_request_cpu`         | Prometheus Node exporter CPU request                                                                                         | 100m                                                                                      |
| `acpr_monitoring_prometheus_node_exporter_resources_request_memory`      | Prometheus Node exporter memory request                                                                                      | 32Mi                                                                                      |
| `acpr_monitoring_prometheus_node_exporter_resources_limit_cpu`           | Prometheus Node exporter CPU limit                                                                                           | 200m                                                                                      |
| `acpr_monitoring_prometheus_node_exporter_resources_limit_memory`        | Prometheus Node exporter memory limit                                                                                        | 64Mi                                                                                      |
| `acpr_monitoring_kube_state_metrics_resources_enable`                    | Enable or disable kube-state-metrics resources requests and limits                                                           | *true*                                                                                    |
| `acpr_monitoring_kube_state_metrics_resources_request_cpu`               | kube-state-metrics CPU request                                                                                               | 1024m                                                                                     |
| `acpr_monitoring_kube_state_metrics_resources_request_memory`            | kube-state-metrics memory request                                                                                            | 2048Mi                                                                                    |
| `acpr_monitoring_kube_state_metrics_resources_limit_cpu`                 | kube-state-metrics CPU limit                                                                                                 | 1024m                                                                                     |
| `acpr_monitoring_kube_state_metrics_resources_limit_memory`              | kube-state-metrics memory limit                                                                                              | 2048Mi                                                                                    |
| `acpr_monitoring_prometheus_password`                                    | Prometheus password                                                                                                          | _automatically generated_                                                                 |
| `acpr_monitoring_prometheus_proxy_resources_enable`                      | Enable or disable Prometheus proxy resources requests and limits                                                             | *true*                                                                                    |
| `acpr_monitoring_prometheus_proxy_resources_request_cpu`                 | Prometheus proxy CPU request                                                                                                 | 10m                                                                                       |
| `acpr_monitoring_prometheus_proxy_resources_request_memory`              | Prometheus proxy memory request                                                                                              | 256Mi                                                                                     |
| `acpr_monitoring_prometheus_proxy_resources_limit_cpu`                   | Prometheus proxy CPU limit                                                                                                   | 50m                                                                                       |
| `acpr_monitoring_prometheus_proxy_resources_limit_memory`                | Prometheus proxy memory limit                                                                                                | 256Mi                                                                                     |
| `acpr_monitoring_prometheus_resources_request_enable`                    | Enable or disable Prometheus resources requests and limits                                                                   | *true*                                                                                    |
| `acpr_monitoring_prometheus_resources_request_cpu`                       | Prometheus CPU request                                                                                                       | 500m                                                                                      |
| `acpr_monitoring_prometheus_resources_request_memory`                    | Prometheus memory request                                                                                                    | 8Gi                                                                                       |
| `acpr_monitoring_prometheus_resources_limit_cpu`                         | Prometheus CPU limit                                                                                                         | 2000m                                                                                     |
| `acpr_monitoring_prometheus_resources_limit_memory`                      | Prometheus memory limit                                                                                                      | 8Gi                                                                                       |
| `acpr_monitoring_alertmanager_proxy_resources_enable`                    | Enable or disable Alertmanager proxy resources requests and limits                                                           | *true*                                                                                    |
| `acpr_monitoring_alertmanager_proxy_resources_request_cpu`               | Alertmanager proxy CPU request                                                                                               | 10m                                                                                       |
| `acpr_monitoring_alertmanager_proxy_resources_request_memory`            | Alertmanager proxy memory request                                                                                            | 256Mi                                                                                     |
| `acpr_monitoring_alertmanager_proxy_resources_limit_cpu`                 | Alertmanager proxy CPU limit                                                                                                 | 50m                                                                                       |
| `acpr_monitoring_alertmanager_proxy_resources_limit_memory`              | Alertmanager proxy memory limit                                                                                              | 256Mi                                                                                     |
| `acpr_monitoring_alertmanager_resources_enable`                          | Enable or disable Alertmanager resources requests and limits                                                                 | *true*                                                                                    |
| `acpr_monitoring_alertmanager_resources_request_cpu`                     | Alertmanager CPU request                                                                                                     | 200m                                                                                      |
| `acpr_monitoring_alertmanager_resources_request_memory`                  | Alertmanager memory request                                                                                                  | 512Mi                                                                                     |
| `acpr_monitoring_alertmanager_resources_limit_cpu`                       | Alertmanager CPU limit                                                                                                       | 500m                                                                                      |
| `acpr_monitoring_alertmanager_resources_limit_memory`                    | Alertmanager memory limit                                                                                                    | 512Mi                                                                                     |
| `acpr_monitoring_grafana_proxy_resources_enable`                         | Enable or disable Grafana proxy resources requests and limits                                                                | *true*                                                                                    |
| `acpr_monitoring_grafana_proxy_resources_request_cpu`                    | Grafana proxy CPU request                                                                                                    | 10m                                                                                       |
| `acpr_monitoring_grafana_proxy_resources_request_memory`                 | Grafana proxy memory request                                                                                                 | 256Mi                                                                                     |
| `acpr_monitoring_grafana_proxy_resources_limit_cpu`                      | Grafana proxy CPU limit                                                                                                      | 50m                                                                                       |
| `acpr_monitoring_grafana_proxy_resources_limit_memory`                   | Grafana proxy memory limit                                                                                                   | 256Mi                                                                                     |
| `acpr_monitoring_grafana_resources_enable`                               | Enable or disable Grafana resource requests and limits                                                                       | *true*                                                                                    |
| `acpr_monitoring_grafana_resources_request_cpu`                          | Grafana CPU request                                                                                                          | 75m                                                                                       |
| `acpr_monitoring_grafana_resources_request_memory`                       | Grafana memory request                                                                                                       | 256Mi                                                                                     |
| `acpr_monitoring_grafana_resources_limit_cpu`                            | Grafana CPU limit                                                                                                            | 200m                                                                                      |
| `acpr_monitoring_grafana_resources_limit_memory`                         | Grafana memory limit                                                                                                         | 256Mi                                                                                     |
| `acpr_monitoring_grafana_dashboard_provisioner_resources_enable`         | Enable or disable Grafana Dashboard Provisioner resources requests and limits                                                | *true*                                                                                    |
| `acpr_monitoring_grafana_dashboard_provisioner_resources_request_cpu`    | Grafana Dashboard Provisioner CPU request                                                                                    | 50m                                                                                       |
| `acpr_monitoring_grafana_dashboard_provisioner_resources_request_memory` | Grafana Dashboard Provisioner memory request                                                                                 | 1Gi                                                                                       |
| `acpr_monitoring_grafana_dashboard_provisioner_resources_limit_cpu`      | Grafana Dashboard Provisioner CPU limit                                                                                      | 250m                                                                                      |
| `acpr_monitoring_grafana_dashboard_provisioner_resources_limit_memory`   | Grafana Dashboard Provisioner memory limit                                                                                   | 1Gi                                                                                       |
| `acpr_monitoring_prometheus_pvc_access_modes_data`                       | Access Mode used for Prometheus data PVC                                                                                     | _ReadWriteMany_                                                                           |
| `acpr_monitoring_grafana_pvc_size_request_dashboard`                     | Grafana PersitentVolumeClaim size request for storing dashboards                                                             | 100Mi                                                                                     |
| `acpr_monitoring_grafana_pvc_size_request_library`                       | Grafana PersitentVolumeClaim size request for storing library files                                                          | 100Mi                                                                                     |
| `acpr_monitoring_grafana_pvc_size_request_log`                           | Grafana PersitentVolumeClaim size request for storing log files                                                              | 100Mi                                                                                     |
| `acpr_monitoring_prometheus_pvc_size_request_data`                       | Prometheus PersitentVolumeClaim size request for storing it's database                                                       | 1Gi                                                                                       |
| `acpr_monitoring_prometheus_pvc_size_request_rule`                       | Prometheus PersitentVolumeClaim size request for storing it's alert rules                                                    | 100Mi                                                                                     |
| `acpr_monitoring_grafana_pvc_storage_class_name_log`                     | Grafana PersitentVolumeClaim dashboards storage class name                                                                   |                                                                                           |
| `acpr_monitoring_grafana_pvc_storage_class_name_library`                 | Grafana PersitentVolumeClaim library library storage class name                                                              |                                                                                           |
| `acpr_monitoring_grafana_pvc_storage_class_name_dashboard`               | Grafana PersitentVolumeClaim log storage class name                                                                          |                                                                                           |
| `acpr_monitoring_prometheus_pvc_storage_class_name_data`                 | Prometheus PersitentVolumeClaim database storage class name                                                                  |                                                                                           |
| `acpr_monitoring_prometheus_pvc_storage_class_name_rule`                 | Prometheus PersitentVolumeClaim alert rules storage class name                                                               |                                                                                           |
| `acpr_monitoring_prometheus_rule_provisioner_resources_enable`           | Enable or disable Prometheus Rule Provisioner resources requests and limits                                                  | *true*                                                                                    |
| `acpr_monitoring_prometheus_rule_provisioner_resources_request_cpu`      | Prometheus Rule Provisioner CPU request                                                                                      | 50m                                                                                       |
| `acpr_monitoring_prometheus_rule_provisioner_resources_request_memory`   | Prometheus Rule Provisioner memory request                                                                                   | 512Mi                                                                                     |
| `acpr_monitoring_prometheus_ruled_provisioner_resources_limit_cpu`       | Prometheus Rule Provisioner CPU limit                                                                                        | 200m                                                                                      |
| `acpr_monitoring_prometheus_rule_provisioner_resources_limit_memory`     | Prometheus Rule Provisioner memory limit                                                                                     | 512Mi                                                                                     |

* See the [official documentation](https://prometheus.io/docs/alerting/configuration/) for more information

## Usage examples

Usage within a playbook to customize monitoring configuration overriding or updating YAML
files in *files/* directory 

Installing ACPR monitoring:

```yaml
- hosts: localhost
  roles:
    - avaloq.acpr-monitoring
```
