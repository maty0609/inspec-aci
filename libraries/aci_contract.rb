require 'acirb'

class AciContract < Inspec.resource(1)
  name "aci_contract"
  desc "Verifies a contract settings"
  example "
    describe aci_contract(name: 'tf-test',tenant:'tf-test-client') do
      it { should exist }
      it { should be_noConfigIssue }
      its ('scope') { should cmp 'context' }
    end
    "

  attr_reader :name, :tenant, :response, :username, :aci, :password, :url, :configIssue

  def initialize(params)
    @name   = params[:name]
    @tenant = params[:tenant]
    @url =  ENV['ACI_URL']
    @username = ENV['ACI_USERNAME']
    @password = ENV['ACI_PASSWORD']
    @aci = ACIrb::RestClient.new(url: url, user: username, password: password)
    @response = aci.lookupByDn('uni/tn-'+tenant+'/brc-'+name, subtree: 'full')
  end

  def scope
    if response.nil? == true
       return nil
    else
       return response.scope
    end
  end

  def exist?
    !response.nil?
  end

  def noConfigIssue?
    if response.nil? == true || (response.nil? == true && response.configIssues == nil) || response.configIssues != ""
       return false
    else
       return true
    end
  end
end
