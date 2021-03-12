# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide hooks that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

require 'version'

module InspecPlugins
  module ACI
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-aci'
    end
 end
end
