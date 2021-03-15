describe aci_application_epg(name:'tf-test',tenant:'tf-test-client',profile:'tf-test') do
  it { should exist }
  it { should be_floodEncapEnabled }
  it { should be_intraEpgIsolationEnabled }
  it { should_not be_epgShutdown }
  its('providedTo') { should include 'tf-test' }
  its('comsumedBy') { should include 'tf-test' }
end
