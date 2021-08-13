# AvaloqParameters

| Name                                              | Description                                                                                                                                              | Required | Default value       |
|---------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------------------|
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_CHUNKLIMITSIZE   | Fluentd buffer chunkLimitSize For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html   | false    | 8m                  |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_TOTALLIMITSIZE   | Fluentd buffer totalLimitSize For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html   | false    | 8G                  |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_FLUSHINTERVAL    | Fluentd buffer flushInterval For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html    | false    | 1s                  |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_FLUSHMODE        | Fluentd buffer flushMode For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html        | false    | interval            |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_FLUSHTHREADCOUNT | Fluentd buffer flushThreadCount For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html | false    | 2                   |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_OVERFLOWACTION   | Fluentd buffer overflowAction For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html   | false    | block               |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_RETRYMAXINTERVAL | Fluentd buffer retryMaxInterval For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html | false    | 300s                |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_RETRYTYPE        | Fluentd buffer retryType For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html        | false    | exponential_backoff |
| OPENSHIFT_LOGGING_FLUENTD_BUFFER_RETRYWAIT        | Fluentd buffer retryWait For more information see https://docs.openshift.com/container-platform/4.6/logging/config/cluster-logging-collector.html        | false    | 1s                  |

# AvaloqFiles

| Name        | Description | Required | Default value                                                                                         |
|-------------|-------------|----------|-------------------------------------------------------------------------------------------------------|
| fluent.conf |             | false    | [fluent.conf](../../../output/definitions/com.avaloq.openshift/openshift-logging-fluentd/fluent.conf) |
| run.sh      |             | false    | [run.sh](../../../output/definitions/com.avaloq.openshift/openshift-logging-fluentd/run.sh)           |

**Note:** The default values for AvaloqFiles (if any) are present after running the `fetch` command.
