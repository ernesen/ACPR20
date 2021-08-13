# AvaloqParameters

| Name                                              | Description                                                                                                                                                                                                 | Required | Default value                         |
|---------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------------------------------------|
| OPENSHIFT_NAMESPACE                               | The namespace used on Openshift where this constellation is deployed to.                                                                                                                                    | true     | acpr-database-operator                |
| AVALOQ_CONTAINER_IMAGE_REGISTRY                   | URL of the container image registry. Must end with "/", unless you set it to null                                                                                                                           | true     | registry.service.avaloq.com/          |
| AVALOQ_DATABASE_OPERATOR_CONTAINER_IMAGE          | Container image name and version. Example: `avaloq/avaloq-database-operator:0.7.1`                                                                                                                          | false    | avaloq/avaloq-database-operator:0.7.1 |
| AVALOQ_DATABASE_OPERATOR_LOGACCESS_GROUPNAME      | User group which will get access to database operator logs Example: `database-operators`                                                                                                                    | false    | system:authenticated                  |
| AVALOQ_DATABASE_OPERATOR_ENV                      | Comma separated list of container environment variables to inject Example: `DB_OPERATOR_DROP_SCHEMA_ON_DELETE:false,SPRING_PROFILES_ACTIVE:readonly`                                                        | false    |                                       |
| AVALOQ_DATABASE_OPERATOR_RESOURCES_REQUEST_CPU    | The cpu requests of the application. For more information of possible values, please check out the following page. https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/    | false    | 5m                                    |
| AVALOQ_DATABASE_OPERATOR_RESOURCES_REQUEST_MEMORY | The memory requests of the application. For more information of possible values, please check out the following page. https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/ | false    | 512Mi                                 |
| AVALOQ_DATABASE_OPERATOR_RESOURCES_LIMIT_CPU      | The cpu limit of the application. For more information of possible values, please check out the following page. https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/       | false    | 2                                     |
| AVALOQ_DATABASE_OPERATOR_RESOURCES_LIMIT_MEMORY   | The memory limit of the application. For more information of possible values, please check out the following page. https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/    | false    | 512Mi                                 |

# AvaloqFolders

| Name             | Path             | Description                                                                                                                  |
|------------------|------------------|------------------------------------------------------------------------------------------------------------------------------|
| oracle-templates | oracle-templates | oracle templates configmap<br><br>All files in this folder will be converted as ConfigMap.<br>Files *.template are included. |

