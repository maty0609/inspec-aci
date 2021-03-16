---
title: About the aci_application_epg Resource
platform: aci
---

# aci\_application\_epg

## Syntax

Ensure that an `aci_application_epg` exists

```
describe aci_application_epg(name:'tf-test',tenant:'tf-test-client',profile:'tf-test') do
  it { should exist }
  it { should be_floodEncapEnabled }
  it { should be_intraEpgIsolationEnabled }
  it { should_not be_epgShutdown }
  its('provided_to') { should include 'tf-test' }
  its('comsumed_by') { should include 'tf-test' }
  its('bridge_domain') { should cmp 'tf-test' }
end
```

## Properties

|Property                         | Description|
| ---                             | --- |
| name                       | EPG name |
| tenant                       | Tenant name |
| profile                       | Application Profile name |
| provided_to                       | EPG provides resources to defined contract |
| comsumed_by                      | EPG consumes resources from defined contract |
| bridge_domain                      | Assigned Bridge Domain to EPG |


## Examples

##### Ensure EPG provides resources to EPG tf-test
```
describe aci_application_epg(name:'epg-name',tenant:'aci-tenant-name',profile:'tf-test') do
  its('provided_to') { should include 'tf-test' }
end
```

##### Ensure EPG is assigned to the right Bridge Domain
```
describe aci_application_epg(name:'tf-test',tenant:'tf-test-client',profile:'tf-test') do
  its('bridge_domain') { should cmp 'tf-test' }
end
```


## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

```
describe aci_application_epg(name:'epg-name',tenant:'aci-tenant-name',profile:'tf-test') do
  it { should exist }
  it { should be_floodEncapEnabled }
  it { should be_intraEpgIsolationEnabled }
  it { should_not be_epgShutdown }
end
```
