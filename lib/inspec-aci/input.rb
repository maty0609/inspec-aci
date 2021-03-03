require "acirb"

module InspecPlugins::ACI
  class Contract < Inspec.plugin(2, :input)

    attr_reader :exist

    def initialize (opts = {})
     opts = { contract: opts }
     @plugin_conf = Inspec::Config.cached.fetch_plugin_config("inspec-aci")
     @has_mfa_enabled = "true"
    end

    def fetch(profile_name, input_name)
      puts "profile_name: "+profile_name
      puts "contract_name: "+input_name
      apicuri = 'https://10.2.19.77/'
      username = 'admin'
      password = 'Natilik123!'

      rest = ACIrb::RestClient.new(url: apicuri, user: username,password: password)

      health = rest.lookupByDn('uni/tn-tf-test-client/flt-tf-filter-1-prod/e-tf-entry-1-prod',subtree: 'full')

      return health.stateful
    end

    def exist?
      !@has_mfa_enabled.nil?
    end

  end

end
