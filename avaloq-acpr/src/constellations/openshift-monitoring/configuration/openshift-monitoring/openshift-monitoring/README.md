# AvaloqParameters

| Name                                            | Description               | Required | Default value |
|-------------------------------------------------|---------------------------|----------|---------------|
| AVALOQ_OPENSHIFT_MONITORING_PROMETHEUS_USERNAME | Username of internal user | true     | internal      |
| AVALOQ_OPENSHIFT_MONITORING_PROMETHEUS_PASSWORD | Password of internal user | true     |               |

# AvaloqFiles

| Name                               | Description | Required | Default value                                                                                      |
|------------------------------------|-------------|----------|----------------------------------------------------------------------------------------------------|
| prometheus-k8s-htpasswd.yaml       |             | true     |                                                                                                    |
| thanos-querier-oauth-htpasswd.yaml |             | true     |                                                                                                    |
| config.yaml                        |             | false    | [config.yaml](../../../output/definitions/com.avaloq/openshift-monitoring/config.yaml)             |
| alertmanager.yaml                  |             | false    | [alertmanager.yaml](../../../output/definitions/com.avaloq/openshift-monitoring/alertmanager.yaml) |
| datasources.yaml                   |             | false    | [datasources.yaml](../../../output/definitions/com.avaloq/openshift-monitoring/datasources.yaml)   |
| prometheus.yaml                    |             | false    |                                                                                                    |

**Note:** The default values for AvaloqFiles (if any) are present after running the `fetch` command.
