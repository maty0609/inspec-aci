require 'acirb'

class AciContractFilter < Inspec.resource(1)
  name "aci_filter"
  desc "Verifies Contract Filter"
  example "
    describe aci_filter(name:'filter-name',tenant:'aci-tenant-name') do
      it { should exist }
    end
  "

  attr_reader :name, :tenant, :response, :username, :aci, :password, :url

  def initialize(params)
    @name   = params[:name]
    @tenant = params[:tenant]
    @url =  ENV['ACI_URL']
    @username = ENV['ACI_USERNAME']
    @password = ENV['ACI_PASSWORD']
    @aci = ACIrb::RestClient.new(url: url, user: username,password: password)
    @response = aci.lookupByDn('uni/tn-'+tenant+'/flt-'+name, subtree: 'full')
  end

  def exist?
    !response.nil?
  end
end
