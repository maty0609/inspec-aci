require 'acirb'

class AciFilterEntry < Inspec.resource(1)
  name "aci_filter_entry"
  desc "Verifies a contract settings"
  example "
    describe aci_filter_entry(name: 'tf-test',tenant:'tf-test-client', filter:'filter-name') do
      it { should exist }
      it { should be_stateful }
      it { should be_matchFragmentsOnly }
      its ('protocol') { should cmp 'tcp' }
      its ('etherType') { should cmp 'ip' }
      its ('dFromPort') { should cmp 'http' }
      its ('dToPort') { should cmp 'http' }
      its ('sFromPort') { should cmp 'dns' }
      its ('sToPort') { should cmp 'dns' }
    end
    "

  attr_reader :name, :tenant, :response, :username, :aci, :password, :url, :configIssue, :filter

  def initialize(params)
    @name   = params[:name]
    @tenant = params[:tenant]
    @filter = params[:filter]
    @url =  ENV['ACI_URL']
    @username = ENV['ACI_USERNAME']
    @password = ENV['ACI_PASSWORD']
    @aci = ACIrb::RestClient.new(url: url, user: username, password: password)
    @response = aci.lookupByDn('uni/tn-'+tenant+'/flt-'+filter+'/e-'+name, subtree: 'full')
    puts response
  end

  def stateful?
    if response.nil? == true || response.stateful == "no"
       return false
    else
       return true
    end
  end

  def matchFragmentsOnly?
    if response.nil? == true || response.applyToFrag == "no"
       return false
    else
       return true
    end
  end

  def protocol
    if response.nil? == true
       return nil
    else
       return response.prot
    end
  end

  def etherType
    if response.nil? == true
       return nil
    else
       return response.etherT
    end
  end

  def dFromPort
    if response.nil? == true
       return nil
    else
       return response.dFromPort
    end
  end
  def dToPort
    if response.nil? == true
       return nil
    else
       return response.dToPort
    end
  end

  def sFromPort
    if response.nil? == true
       return nil
    else
       return response.dFromPort
    end
  end
  
  def sToPort
    if response.nil? == true
       return nil
    else
       return response.sToPort
    end
  end

  def exist?
    !response.nil?
  end

end
