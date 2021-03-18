---
title: About the aci_filter Resource
platform: aci
---

# aci\_filter

## Syntax

Ensure that an `aci_filter` exists

```
describe aci_filter(name:'filter-name',tenant:'aci-tenant-name') do
  it { should exist }
end
```

## Properties

|Property                         | Description|
| ---                             | --- |
| name                       | EPG name |
| tenant                       | Tenant name |


## Examples

##### Ensure contract filter exists
```
describe aci_filter(name:'filter-name',tenant:'aci-tenant-name') do
  it { should exist }
end
"
```

## Matchers

This InSpec audit resource has no special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

#### exist

The control will pass if the describe returns at least one result.

Use `should_not` to test the entity should not exist.

```
describe aci_filter(name:'filter-name',tenant:'aci-tenant-name') do
  it { should exist }
end
```
