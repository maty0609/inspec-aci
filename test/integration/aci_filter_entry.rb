describe aci_filter_entry(name: 'tcp',tenant:'tf-test-client', filter:'tf-test') do
  it { should exist }
  it { should be_stateful }
  it { should be_matchFragmentsOnly }
  its ('protocol') { should cmp 'tcp' }
  its ('etherType') { should cmp 'ip' }
  its ('dFromPort') { should cmp 'http' }
  its ('dFromPort') { should cmp 'http' }
  its ('dToPort') { should cmp 'http' }
  its ('sFromPort') { should cmp 'dns' }
  its ('sToPort') { should cmp 'dns' }
end
