require 'acirb'

class AciContract < Inspec.resource(1)
  name "aci_contract"
  desc "Verifies a contract settings"
  example "
    describe aci_contract(name: 'subj-tf-contract-subject-prod') do
      it { should exist }
      it { should be_stateful }
    end
  "

  attr_reader :name, :contract

  def initialize(params)
    @name   = params[:name]
    apicuri = 'url'
    username = 'user'
    password = 'password'
    rest = ACIrb::RestClient.new(url: apicuri, user: username,
                                     password: password)
    contract = rest.lookupByDn('uni/tn-tf-test-client/brc-aci_contract-1-prod/'+name,
                             subtree: 'full')
    puts contract
    case contract.revFltPorts
     when 'yes'
       @stateful=true
     when 'no'
       @stateful=false
    end
  end

  def stateful?
    @stateful
  end
  def exist?
    @contract.nil?
  end
end
