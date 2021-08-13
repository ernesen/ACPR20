# Avaloq Installator Jenkins pipeline

Jenkins pipeline to deploy containerized applications using the *Avaloq Installator*.

## Installation

Before using the [Jenkinsfile](), adjust the (default) values of the environment variables 
and parameters to your needs (see first two blocks of the file).

To install the pipeline on Jenkins, create a new job ("New Item") of type "Pipeline". 
In the "Pipeline" section of the job, either paste the contents of the Jenkinsfile into
the "Script" field or select "Pipeline Script from SCM" and specify the required parameters
to have it downloaded from your ACPR git repository. Avaloq recommends the latter option 
for a real gitOps  

## Preconditions

A few preconditions are to be met before the pipeline can be successfully executed. 
Consider the following list:

* Various Jenkins plug-ins are needed to run a declarative pipeline like the
"Avaloq Installator Jenkins pipeline" that uses Git and Groovy. Avaloq recommends to
use a recent version of Jenkins 2 with all plug-in updates installed. Refer to the 
official Jenkins documentation for additional information and support.
* On the Jenkins node that executes the pipeline `wget`, `unzip` and `tar` must
be available
* Installator and OC binaries are hosted in a repository and accessible via an URL
* The OpenShift account used by the pipeline must have the `edit` role on the project to be 
deployed into respectively the permission to create new projects in case the project does not 
exist yet. When using the `ADMIN_USERS` pipeline parameter, the account must have the
`admin` role.  
The following command grants the `edit` role to the `jenkins` service account 
(defined in the `default` namespace) on the current project:
  ```
  oc adm policy add-role-to-user edit system:serviceaccount:default:jenkins
  ```  
  To create a service account `jenkins` in the `default` project:
  ```
  oc create sa jenkins -n default
  ```

* Retrieve the token of the OpenShift user the pipeline is to be executed with.
To retrieve the token of the currently logged in user:
  ```
  oc whoami -t
  ```
  To retrieve the token of the `jenkins` service account (defined in the `default` 
  namespace)
  ```
  oc serviceaccounts get-token jenkins -n default
  ```

* Verify OpenShift project quotas are set according to application requirements
* A Constellation has been defined using the "Avaloq Constellator" and configured with the
"Avaloq Installator". It is stored flat in a git or zipped in a Maven repository.


## Environment Variables

The following environment variables are defined by the "Avaloq Installator Jenkins pipeline"
and have to be verified and adjusted before the pipeline can be used. They are shared among
all executions.

| Environment variable      | Description                                                                   | Example value                                                                                                                            |
|---------------------------|-------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| `INSTALLATOR_RELEASE_URL` | Path to retrieve the Installator release                                      | "https://repo.example.net/m2/com/avaloq/avaloq-installator/@INSTALLATOR_VERSION@/avaloq-installator-@INSTALLATOR_VERSION@-x64_linux.tgz" |
| `OC_CLI_RELEASE_URL`      | Path to retrieve the OpenShift command line interface release                 | "https://repo.example.net/m2/com/openshift/oc/${params.OPENSHIFT_CLI_VERSION}/oc-${params.OPENSHIFT_CLI_VERSION}-linux.tar.gz"           |
| `INSTALLATOR`             | Relative path to the Installator binary inside the release package            | "./avaloq-installator-boot-@INSTALLATOR_VERSION@/bin/avaloq-installator"                                                                 |
| `OC`                      | Relative path to the OC binary inside the release package                     | "./oc"                                                                                                                                   |
| `INSTALLATOR_CONFIG`      | Path to store the Installator context configuration (should not be modified)  | "${env.WORKSPACE}/installatorconfig"                                                                                                     |
| `KUBECONFIG`              | Path to store the Kubernetes context configuration (should not be modified)   | "${WORKSPACE}/kubeconfig"                                                                                                                |
| `WGET_ARGS`               | Arguments for executions of `wget`                                            | "-nv --no-proxy"                                                                                                                         |
| `OC_LOGIN_ARGS`           | Arguments for `oc login`                                                      | "--insecure-skip-tls-verify=true"                                                                                                        |
| `RESOURCES_TO_DELETE`     | Kubernetes objects to delete when clearing namespace (should not be modified) |                                                                                                                                          |


## Parameters

| Parameter                | Description                                                                                                                                                             | Example value                                                                                                     |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| `REPOSITORY_URL`         | URL of git repository holding the Constellation                                                                                                                         | "ssh://git.example.com/project/repo.git"                                                                          |
| `BRANCH`                 | Branch to use from git repository (possible values are refs/heads/<branchName>, refs/tags/<tagName>, or <commitId>)                                                     | "master"                                                                                                          |
| `CONSTELLATION_URL`      | URL of the zipped Constellation (only used if not taken from git, i.e. `REPOSITORY_URL` is empty)                                                                       | "https://repo.example.net/m2/com/example/example-constellation/example-constellation-1.0.0.zip"                   |
| `CONSTELLATION_PATH`     | Relative path to the constellation.yml from the root of the git repository or Constellation ZIP file                                                                    | "some/path/to/folder/"                                                                                            |
| `CONFIG_SET_URL`         | URL of the zipped Config Set (downloaded and unzipped inside the Constellation\'s config-set folder, if not empty)                                                      | "https://repo.example.net/m2/com/example/example-constellation-config/example-constellation-config-dev-1.0.0.zip" |
| `CONFIG_SET`             | Name of Config Set to be used, need to match any Config Set included in Constellation or `CONFIG_SET_URL`, leave empty if there is no Config Set                        | "dev"                                                                                                             |
| `INSTALLATOR_VERSION`    | Version of the Avaloq Installator to use for configuring and deploying the Constellation                                                                                | "1.0.0"                                                                                                           |
| `FORCE_VERSION`          | Forces to use `INSTALLATOR_VERSION` regardless of which version is specified in `configuration.yml`                                                                     | "false"                                                                                                           |
| `INSTALLATOR_PARAMETERS` | Comma-separated list of parameters to pass additionally to the Installator                                                                                              | "--P ACP_HOST=acp001"                                                                                             |
| `OPENSHIFT_URL`          | URL of the OpenShift cluster                                                                                                                                            | "openshift.example.net"                                                                                           |
| `OPENSHIFT_TOKEN`        | Token to use to authenticate against and execute oc commands on OpenShift cluster (e.g. from user or Jenkins service account), if `JENKINS_CREDENTIALS` is not used     | "asDfjHq349gHlAsDdjQ34p8wEgAdFaföL"                                                                               | 
| `JENKINS_CREDENTIALS`    | Jenkins Credentials of type Secret Text providing OpenShift token used instead of `OPENSHIFT_TOKEN` (can be credentials ID as String or bound to Credentials Parameter) | "072th389-z81r-82g8-rqwp-v6820g59cj3d"                                                                            |
| `OPENSHIFT_CLI_VERSION`  | Version of the OpenShift command line interface (oc)                                                                                                                    | "3.11.154"                                                                                                        |
| `NAMESPACE`              | Namespace on OpenShift the Constellation is deployed into (will be created automatically if not existing)                                                               | "example-constellation-dev"                                                                                       |
| `CLEAR_NAMESPACE`        | Removes any existing Kubernetes objects from the namespace before deploying                                                                                             | "false" for delta-deployments (to be used in production), "true" for full deployments from scratch                |
| `REMOVE_AGAIN`           | Removes all Kubernetes objects from the namespace again after deploying (meant for verification builds)                                                                 | "false" to keep all deployed objects (default), "true" for verification deployments that should not be kept       |
| `ADMIN_USERS`            | Comma-separated list of users that will be granted Administrator role on namespace                                                                                      | "username"                                                                                                        |
| `MANUAL_VERIFY`          | Pauses the pipeline before executing deploy commands for manual verification and approval                                                                               | "true" for productive deployments, "false" otherwise                                                              |

