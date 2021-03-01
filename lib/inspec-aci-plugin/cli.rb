# Load enormous dependencies
require_relative 'heavyweight'

module InspecPlugin::AciPlugin
  # Class name doesn't matter, but this is a reasonable default name
  class CliCommand < Inspec.plugin(2, :cli_command) # Note two-arg form
    # Implement API or use DSL as dictated by cli_command plugin type
    # ...
  end
end
