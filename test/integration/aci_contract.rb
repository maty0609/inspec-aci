describe aci_contract(name: 'tf-test',tenant:'tf-test-client') do
  it { should exist }
  it { should be_noConfigIssue }
  its ('scope') { should cmp 'context' }

end
