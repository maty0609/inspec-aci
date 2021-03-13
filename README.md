# InSpec Cisco ACI Resource

* **Project State: Active** (but EXPERIMENTAL)
* **Issues Response SLA: 5 business days**
* **Pull Request Response SLA: 5 business days**

For more information on project states and SLAs, see [this documentation](https://github.com/chef/chef-oss-practices/blob/master/repo-management/repo-states.md).


## Notice - Experimental Project

This project is still at the beginning. This resource pack is in the early stages of research and development. Functionality may be defective, incomplete, or be withdrawn in the future. If you are interested in helping this project mature, please join the conversation or contribute code at the [inspec-aci project](https://github.com/maty0609/inspec-aci).

## Prerequisites

* InSpec v4.7.3 or later
* ACIrb - Ruby implementation of the Cisco APIC REST API
* Cisco ACI v3.0 or later

## Examples

```
describe aci_contract(name:'subj-tf-contract-subject-prod') do
  it { should exist }
  it { should be_stateful }
end
```

## APIC Credentials
APIC URL, username and password are configured as environmental variables which are used by InSpec Cisco ACI Resources.

Please set up following variables:

```
export ACI_PASSWORD=test
export ACI_USERNAME=test
export ACI_URL=https://10.10.10.10/
```

## Resource Documentation
* https://docs.chef.io/inspec/
* https://github.com/inspec/inspec
* https://github.com/datacenter/acirb


## Contributing

If you'd like to contribute to this project please see [Contributing
Rules](CONTRIBUTING.md). The following instructions will help you get your
development environment setup to run integration tests.
