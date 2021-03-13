---
title: About the aci_subject Resource
platform: aci
---

# aci\_subject

## Syntax

Ensure that an `aci_subject` exists

```
describe aci_subject(name:'aci-subject-name',tenant:'aci-tenant-name',contract:'aci-contract-name') do
  it { should exist }
  it { should be_reversePortFilter }
end
```

## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

```
describe aci_subject(name:'aci-subject-name',tenant:'aci-tenant-name',contract:'aci-contract-name') do
  it { should exist }
  it { should have_reversePortFilter_enabled }
end
```
