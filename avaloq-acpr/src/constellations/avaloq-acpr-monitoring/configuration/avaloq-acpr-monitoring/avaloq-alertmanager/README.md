# AvaloqParameters

| Name                                               | Description                                                                                                              | Required | Default value                                |
|----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|----------|----------------------------------------------|
| OPENSHIFT_VERSION                                  | OpenShift version where this constellation is deployed to. Valid values are 3 or 4.                                      | true     | 4                                            |
| OPENSHIFT_NAMESPACE                                | The namespace used on Openshift where this constellation is deployed to.                                                 | true     | acpr-monitoring                              |
| AVALOQ_ALERTMANAGER_DEPLOY_SECRET                  | Set to 'false' if you don't want to deploy secrets. It can be useful when using Sealed Secrets                           | true     | true                                         |
| AVALOQ_ALERTMANAGER_DEPLOY_PVC                     | Set to 'false' if you don't want to deploy PVCs                                                                          | true     | true                                         |
| AVALOQ_ALERTMANAGER_SESSION_SECRET                 | Secret string used to encrypt sessions                                                                                   | true     |                                              |
| AVALOQ_REDHAT_CONTAINER_IMAGE_REGISTRY             | URL of the container image registry containing the Red Hat images. Must end with "/", unless you set it to null          | false    | registry.service.avaloq.com/                 |
| AVALOQ_CONTAINER_IMAGE_REGISTRY                    | URL of the container image registry. Must end with "/", unless you set it to null                                        | false    | registry.service.avaloq.com/                 |
| AVALOQ_ALERTMANAGER_CONTAINER_IMAGE_PULL_POLICY    | The pull policy to use for the container image. Valid values are `IfNotPresent` and `Always`, default is `IfNotPresent`. | false    | IfNotPresent                                 |
| AVALOQ_ALERTMANAGER_SHOW_HTPASSWD_FORM             | Show or hide htpasswd form in Alertmanager proxy                                                                         | false    | false                                        |
| AVALOQ_ALERTMANAGER_REPLICAS                       | Number of replicas of Alertmanager deployment                                                                            | false    | 1                                            |
| AVALOQ_ALERTMANAGER_NODE_SELECTOR_KEY              | Specify a node where Alertmanager is deployed                                                                            | false    | dummySelector                                |
| AVALOQ_ALERTMANAGER_NODE_SELECTOR_VALUE            | Specify a node where Alertmanager is deployed                                                                            | false    | true                                         |
| AVALOQ_ALERTMANAGER_CONTAINER_IMAGE                |                                                                                                                          | false    | openshift3/prometheus-alertmanager:v3.11.465 |
| AVALOQ_ALERTMANAGER_PROXY_CONTAINER_IMAGE          |                                                                                                                          | false    | openshift3/oauth-proxy:v3.11.465             |
| AVALOQ_ALERTMANAGER_ROUTE_HOSTNAME                 | Select a hostname to use to access Alertmanager. If empty, OpenShift generates the hostname automatically.               | false    |                                              |
| AVALOQ_ALERTMANAGER_RESOURCES_LIMIT_CPU            |                                                                                                                          | false    | 500m                                         |
| AVALOQ_ALERTMANAGER_RESOURCES_REQUEST_CPU          | Alertmanager CPU request                                                                                                 | false    | 200m                                         |
| AVALOQ_ALERTMANAGER_RESOURCES_LIMIT_MEMORY         | Alertmanager memory limit                                                                                                | false    | 256Mi                                        |
| AVALOQ_ALERTMANAGER_RESOURCES_REQUEST_MEMORY       | Alertmanager memory request                                                                                              | false    | 256Mi                                        |
| AVALOQ_ALERTMANAGER_PROXY_RESOURCES_LIMIT_CPU      |                                                                                                                          | false    | 50m                                          |
| AVALOQ_ALERTMANAGER_PROXY_RESOURCES_REQUEST_CPU    | Alertmanager proxy CPU request                                                                                           | false    | 10m                                          |
| AVALOQ_ALERTMANAGER_PROXY_RESOURCES_LIMIT_MEMORY   | Alertmanager proxy memory limit                                                                                          | false    | 256Mi                                        |
| AVALOQ_ALERTMANAGER_PROXY_RESOURCES_REQUEST_MEMORY |                                                                                                                          | false    | 256Mi                                        |

# AvaloqFiles

| Name                                                      | Description | Required | Default value                                                                                                                                          |
|-----------------------------------------------------------|-------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| alertmanager-configuration/alertmanager-configuration.yml |             | false    | [alertmanager-configuration.yml](../../../output/definitions/com.avaloq/avaloq-alertmanager/alertmanager-configuration/alertmanager-configuration.yml) |
| alertmanager-configuration/htpasswd                       |             | false    | [htpasswd](../../../output/definitions/com.avaloq/avaloq-alertmanager/alertmanager-configuration/htpasswd)                                             |

**Note:** The default values for AvaloqFiles (if any) are present after running the `fetch` command.
