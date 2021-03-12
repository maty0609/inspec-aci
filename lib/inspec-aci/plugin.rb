# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide hooks that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

require 'inspec/plugin/v2'
require 'inspec-aci/version'
# The InspecPlugins namespace is where all plugins should declare themselves.
# The 'Inspec' capitalization is used throughout the InSpec source code; yes, it's
# strange.

module InspecPlugins
  module ACI
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-aci'

      aci_contract :aci_contract do
        require 'inspec-aci/aci_contract'
        InspecPlugins::ACI::Contract
      end
    end
 end
end
