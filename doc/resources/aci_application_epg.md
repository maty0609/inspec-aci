---
title: About the aci_application_epg Resource
platform: aci
---

# aci\_application\_epg

## Syntax

Ensure that an `aci_application_epg` exists

```
describe aci_application_epg(name:'epg-name',tenant:'aci-tenant-name',profile:'tf-test') do
  it { should exist }
  it { should be_floodEncapEnabled }
  it { should be_intraEpgIsolationEnabled }
  it { should_not be_epgShutdown }
  its('providedTo') { should include 'tf-test' }
  its('comsumedBy') { should include 'tf-test' }
end
```

## Properties

|Property                         | Description|
| ---                             | --- |
| providedTo                       | EPG provides resources to defined contract |
| comsumedBy                      | EPG consumes resources from defined contract |


## Examples

##### Ensure EPG provides resources to EPG tf-test
```
describe aci_application_epg(name:'epg-name',tenant:'aci-tenant-name',profile:'tf-test') do
  its('providedTo') { should include 'tf-test' }
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
