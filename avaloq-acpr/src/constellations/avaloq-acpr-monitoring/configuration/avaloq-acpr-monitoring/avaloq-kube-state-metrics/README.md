# AvaloqParameters

| Name                                                  | Description                                                                                                              | Required | Default value                               |
|-------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|----------|---------------------------------------------|
| OPENSHIFT_VERSION                                     | OpenShift version where this constellation is deployed to. Valid values are 3 or 4.                                      | true     | 4                                           |
| OPENSHIFT_NAMESPACE                                   | The namespace used on Openshift where this constellation is deployed to.                                                 | true     | acpr-monitoring                             |
| AVALOQ_REDHAT_CONTAINER_IMAGE_REGISTRY                | URL of the container image registry containing the Red Hat images. Must end with "/", unless you set it to null          | false    | registry.service.avaloq.com/                |
| AVALOQ_CONTAINER_IMAGE_REGISTRY                       | URL of the container image registry. Must end with "/", unless you set it to null                                        | false    | registry.service.avaloq.com/                |
| AVALOQ_KUBE_STATE_METRICS_CONTAINER_IMAGE_PULL_POLICY | The pull policy to use for the container image. Valid values are `IfNotPresent` and `Always`, default is `IfNotPresent`. | false    | IfNotPresent                                |
| AVALOQ_KUBE_STATE_METRICS_CONTAINER_IMAGE             | Container image of kube-state-metrics                                                                                    | false    | openshift3/ose-kube-state-metrics:v3.11.465 |
| AVALOQ_KUBE_STATE_METRICS_REPLICAS                    | Number of replicas of kube-state-metrics deployment                                                                      | false    | 1                                           |
| AVALOQ_KUBE_STATE_METRICS_RESOURCES_REQUEST_CPU       | kube-state-metrics memory request                                                                                        | false    | 1024m                                       |
| AVALOQ_KUBE_STATE_METRICS_RESOURCES_LIMIT_MEMORY      | kube-state-metrics memory limit                                                                                          | false    | 2048Mi                                      |
| AVALOQ_KUBE_STATE_METRICS_RESOURCES_REQUEST_MEMORY    | kube-state-metrics memory request                                                                                        | false    | 2048Mi                                      |
| AVALOQ_KUBE_STATE_METRICS_RESOURCES_LIMIT_CPU         | kube-state-metrics CPU limit                                                                                             | false    | 1024m                                       |

