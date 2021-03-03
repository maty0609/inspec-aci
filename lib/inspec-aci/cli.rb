module InspecPlugin::MyPlugin
  # Class name doesn't matter, but this is a reasonable default name
  class CliCommand < Inspec.plugin(2, :cli_command) # Note two-arg form
    # Implement API or use DSL as dictated by cli_command plugin type
    # ...
  end
end


desc 'Reports on teaspoons in your beverage, always bad news'
def count
  # Someone has executed `inspec sweeten count`| do whatever that entails
  case beverage_type
  when :soda
    puts 12
  when :tea_two_lumps
    puts 2
  end
end
