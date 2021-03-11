require 'acirb'

module InspecPlugins::ACI
  class Contract < Inspec.plugin(2, :input)
#    attr_reader :plugin_conf

   def initialize (opts = {})
#     Inspec::Log.level = :debug
#     @plugin_conf = Inspec::Config.cached.fetch_plugin_config("inspec-aci")
   end

   def fetch(profile_name, input_name)
     apicuri = 'https://10.2.19.77/'
     username = 'admin'
     password = 'Natilik123!'

     rest = ACIrb::RestClient.new(url: apicuri, user: username,
                                      password: password)

     contract = rest.lookupByDn('uni/tn-tf-test-client/brc-aci_contract-1-prod/'+input_name,
                              subtree: 'full')
     puts "==============="
     puts "REST response:"
     puts "==============="
     puts contract
     puts "==============="
     case contract.revFltPorts
      when 'yes'
        'stateful'
      when 'no'
        'nonstateful'
     end
   end

   def exist?
     contract.nil?
   end

end
end
