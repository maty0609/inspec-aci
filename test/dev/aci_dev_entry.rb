# This file is known as the "entry point."
# This is the file InSpec will try to load if it
# thinks your plugin is installed.

# The *only* thing this file should do is setup the
# load path, then load the plugin definition file.

# Next two lines simply add the path of the gem to the load path.
# This is not needed when being loaded as a gem; but when doing
# plugin development, you may need it.  Either way, it's harmless.

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

lib = File.expand_path('/usr/local/rvm/gems/ruby-2.7.2/gems/acirb-1.2.1.0/lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

lib = File.expand_path('/usr/local/rvm/gems/ruby-2.7.2/gems/nokogiri-1.11.1-x86_64-linux/lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

lib = File.expand_path('/usr/local/rvm/gems/ruby-2.7.2/gems/websocket-1.2.9/lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


require_relative '../../libraries/aci_contract.rb'
require_relative 'plugin.rb'
