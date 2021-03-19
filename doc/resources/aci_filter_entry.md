---
title: About the aci_filter_entry Resource
platform: aci
---

# aci\_filter\_entry

## Syntax

Ensure that an `aci_filter_entry` exists

```
describe aci_filter_entry(name: 'tf-test',tenant:'tf-test-client', filter:'filter-name') do
  it { should exist }
  it { should be_stateful }
  it { should be_matchFragmentsOnly }
  its ('protocol') { should cmp 'tcp' }
  its ('etherType') { should cmp 'ip' }
  its ('dFromPort') { should cmp 'http' }
  its ('dToPort') { should cmp 'http' }
  its ('sFromPort') { should cmp 'dns' }
  its ('sToPort') { should cmp 'dns' }
end
```

## Properties

|Property                         | Description|
| ---                             | --- |
| name                       | Filter Entry name |
| tenant                       | Tenant name |
| filter                       | Filter name |
| protocol                       | IP Protocol - unspecified, icmp, igmp, tcp, egp, igp, udp, icmpv6, eigrp, ospfigp, pim, l2tp |
| etherType                      | Ethernet Type - unspecified, ipv4, trill, arp, ipv6, mpls_ucast, mac_security, fcoe, ip|
| dFromPort                      | Destination Port - From |
| dToPort                      | Destination Port - To |
| sFromPort                      | Source Port - From |
| sToPort                      | Source Port - To |


## Examples

##### Ensure the filter accept TCP traffic
```
describe aci_filter_entry(name: 'tf-test',tenant:'tf-test-client', filter:'filter-name') do
  its ('protocol') { should cmp 'tcp' }
end
```

##### Ensure the filter allows stateful traffic
```
describe aci_filter_entry(name: 'tf-test',tenant:'tf-test-client', filter:'filter-name') do
  it { should be_stateful }
end
```

## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

```
describe aci_filter_entry(name: 'tf-test',tenant:'tf-test-client', filter:'filter-name') do
  it { should exist }
  it { should be_stateful }
  it { should be_matchFragmentsOnly }
end
```
