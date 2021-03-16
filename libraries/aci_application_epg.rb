require 'acirb'

class AciApplicationEpg < Inspec.resource(1)
  name "aci_application_epg"
  desc "Verifies application EPG attributes"
  example "
    describe aci_application_epg(name:'epg-name',tenant:'aci-tenant-name',profile:'tf-test') do
      it { should exist }
      it { should be_floodEncapEnabled }
      it { should be_intraEpgIsolationEnabled }
      it { should_not be_epgShutdown }
      its ('providedTo') { should include 'tf-test' }
      its ('comsumedBy') { should include 'tf-test' }
    end
  "

  attr_reader :name, :tenant, :profile, :response, :rsprov, :rscons, :contracts, :username, :aci, :password, :url


  FilterTable.create
             .register_column(:provided_to, field: :provided_to)
             .register_column(:comsumed_by, field: :comsumed_by)
             .install_filter_methods_on_resource(self, :contracts)


  def initialize(params)
    @name   = params[:name]
    @tenant = params[:tenant]
    @profile = params[:profile]
    @url =  ENV['ACI_URL']
    @username = ENV['ACI_USERNAME']
    @password = ENV['ACI_PASSWORD']
    @aci = ACIrb::RestClient.new(url: url, user: username,password: password)
    @response = aci.lookupByDn('uni/tn-'+tenant+'/ap-'+profile+'/epg-'+name, subtree: 'full')
    @contracts = fetch_contracts
    @bridge_domain = bridge_domain
  end



  def fetch_contracts
    select_fvRsProv = aci.lookupByClass('fvRsProv')
    select_fvRsCons = aci.lookupByClass('fvRsCons')
    epg_details = []

    select_fvRsProv.each do |rule|
      epg = rule.dn.split("/")[3]
      if epg == "epg-"+name
       epg_details += [{ provided_to: rule.tnVzBrCPName}]
      end
    end

    select_fvRsCons.each do |rule|
      epg = rule.dn.split("/")[3]
      if epg == "epg-"+name
       epg_details += [{ comsumed_by: rule.tnVzBrCPName}]
      end
    end
    epg_details
  end

  def bridge_domain
    response = aci.lookupByDn('uni/tn-'+tenant+'/ap-'+profile+'/epg-'+name+'/rsbd', subtree: 'full')

    if response.nil? == true
       return nil
    else
       return response.tnFvBDName
    end
  end


  def floodEncapEnabled?
    if response.nil? == true || response.floodOnEncap == "disabled"
       return false
    else
       return true
    end
  end

  def intraEpgIsolationEnabled?
    if response.nil? == true || response.pcEnfPref == "unenforced"
       return false
    else
       return true
    end
  end

  def epgShutdown?
    if response.nil? == true || response.shutdown == "yes"
       return true
    else
       return false
    end
  end

  def exist?
    !response.nil?
  end
end
