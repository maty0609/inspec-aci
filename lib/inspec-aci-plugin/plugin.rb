module InspecPlugins
  module AciPlugin
    # Class name doesn't matter, but this is a reasonable default name
    class Plugin < Inspec.plugin(2)

      # Metadata
      # Must match entry in plugins.json
      plugin_name :'inspec-aci-plugin'

      # Activation hooks (CliCommand as an example)
      cli_command :'aci-command' do
        require_relative 'cli'
        InspecPlugins::AciPlugin::CliCommand
      end
    end
  end
end
