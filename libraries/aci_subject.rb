require 'acirb'

class AciSubject < Inspec.resource(1)
  name "aci_subject"
  desc "Verifies a contract subject attributes"
  example "
    describe aci_subject(name:'contract-subject-name',tenant:'aci-tenant-name',contract:'aci-contract-name') do
      it { should exist }
      it { should be_reversePortFilter }
    end
  "

  attr_reader :name, :tenant, :contract, :response

  def initialize(params)
    name   = params[:name]
    tenant = params[:tenant]
    contract = params[:contract]
    url =  ENV['ACI_URL']
    username = ENV['ACI_USERNAME']
    password = ENV['ACI_PASSWORD']
    aci = ACIrb::RestClient.new(url: url, user: username,password: password)
    @response = aci.lookupByDn('uni/tn-'+tenant+'/brc-'+contract+'/'+name, subtree: 'full')
  end

  def reversePortFilter?
    if response.nil? == true || response.revFltPorts == "no"
       return false
    else
       return true
    end
  end

  def exist?
    !response.nil?
  end
end
