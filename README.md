# InSpec Plugin Cisco ACI

This repository is building a plugin to test Cisco ACI resources.

# Requirements

This has been built with Ruby 2.5.1 and InSpec 3.0. It most likely works with
InSpec 2.3 and later its versions of Ruby.

# Installation
`inspec-plugin-aci` is a plugin for InSpec and may be installed by the following
the [Developing InSpec Plugins for the v2 plugin API](https://github.com/inspec/inspec/blob/master/docs/dev/plugins.md#how-plugins-are-located-and-loaded)
instructions.

## ~/.inspec/plugins.json

When developing this plugin, this was the contents of my `~/.inspec/plugins.json`

```json
{
    "plugins_config_version" : "1.0.0",
    "plugins": [
        {
            "name": "inspec-plugin-aci",
            "installation_type": "path",
            "installation_path": "/$HOME/ws/inspec-plugin-aci/lib/inspec-plugin-aci.rb"
        }
    ]
}
```

# Usage #

    inspec aci control

    inspec aci help

    inspec aci version

# Code Examples #

## lib/inspec-plugin-aci.rb ##

Entry point for the plugin code.

## lib/inspec-plugin-aci/plugin.rb ##

Declares `example` and `example2` as InSpec subcommands within the
`inspec-plugin-aci` namespace.

## lib/inspec-plugin-aci/cli.rb ##

Defines the `example` and `example2` CliCommands for use with InSpec.

## lib/inspec-plugin-aci/control.rb ##

Example of calling another module from a CliCommand used by `inspec aci control`

## lib/inspec-plugin-aci/second.rb ##

Example of a second CliCommand used by `inspec aci control`

## lib/inspec-plugin-aci/version.rb ##

The version of the plugin may be defined and exposed with `inspec aci version`

# Code #

Uses the `.rubocop.yml` from InSpec for code formatting.
