---
title: About the aci_contract Resource
platform: aci
---

# aci\_contract

## Syntax

Ensure that an `aci_contract` exists

```
describe aci_contract(name: 'tf-test',tenant:'tf-test-client') do
  it { should exist }
  it { should be_noConfigIssue }
  its ('scope') { should cmp 'context' }
end

```

## Properties

|Property                         | Description|
| ---                             | --- |
| name                       | Contract name |
| tenant                       | Tenant name |
| scope                       | Contract scope - application-profile, context, global, tenant |


## Examples

##### Ensure the contract is in the scope of VRF
```
describe aci_contract(name: 'tf-test',tenant:'tf-test-client') do
  its ('scope') { should cmp 'context' }
end
```


## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

```
describe aci_contract(name: 'tf-test',tenant:'tf-test-client') do
  it { should exist }
  it { should be_noConfigIssue }
end
```
