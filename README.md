# Avaloq Container Platform Reference (ACPR)

The Avaloq Container Platform Reference (ACPR) is the codebase for the Avaloq container
platform, built and managed using best practices and designed to be used as a blueprint
for the Avaloq community. In other words, you can use ACPR to help you set up and manage
your own container platforms.

Refer to the following resources within the
[Avaloq Container Platform Reference (ACPR) online documentation](https://docs.avaloq.com/acpr):
* *Releases and roadmap*
* *Obtaining and managing ACPR codebase*
* *Release notes*
* *Architecture*
* *Technical requirements*
* *Installing ACPR OpenShift*
* *Upgrading ACPR OpenShift*
* *Troubleshooting*
* *Frequently asked questions (FAQ)*
* and more

## Getting Started

ACPR code-base is delivered as a *git* repository, leveraging its standard functionality.
Every time a new release is available, the complete repository is delivered, so that
the latest changes can be applied on top of your on-premises copy of the git repository.

>**NOTE**: To ensure the update process always works seamlessly **do not make any commits
to the branch named '*master*'** and **do not create branches starting with the keywords
'*release*' or '*hotfix*'**.

If you want to track your own changes in the git repository (which we **highly
recommend**) either create a ***branch*** (preferred) within the repository, or create a
*fork* of the repository, for each environment you want to configure and install/manage.

In this way you can segregate the code corresponding to each on-premises installation
and, independently for each environment, roll out new ACPR features and updates in a
controlled way.

For more documentation, see the
[Avaloq Container Platform Reference (ACPR) online documentation](https://docs.avaloq.com/acpr).
For more detailed instructions on how to use this ACPR delivery and code-base, the
following topics are the most relevant:
* *Getting started - Obtaining and managing ACPR codebase*
* *Install Avaloq Container Platform*
* *Upgrade Avaloq Container Platform*
* *Manage Avaloq Container Platform*
* *Avaloq application deployment*  

### Sub-projects

* **[avaloq-acpr](avaloq-acpr/README.md)** - ACPR code-base


## Built with

* [Git](https://git-scm.com/) - Distributed version control system.

## Contributing

You can contribute to the Avaloq Container Platform (ACPR) project opening a ticket
(Question/Problem/Change request) in
[Avaloq Issue Tool](https://www.community.avaloq.com/community/iss/login.cfm) under
"Avaloq Tools", "Container Platform" functional area.

## Versioning

Refer to *Getting started - Releases and roadmap*
  within the
  [Avaloq Container Platform Reference (ACPR) documentation](https://docs.avaloq.com/acpr)

## Authors

* **Avaloq Community** - *Community feedback*
* **Avaloq Container Platform colleagues** - *Main work*
* **Avaloq Technical Communication Team** - *Documentation review and publishing*
* **Avaloq Container Platform Team** - *Formalization and support work*

And many other contributors.

## License

This project is licensed under the
[Apache license 2.0](https://www.apache.org/licenses/LICENSE-2.0) - see the [LICENSE]()
file for details.
