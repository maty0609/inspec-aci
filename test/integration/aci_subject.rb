describe aci_subject(name:'subj-tf-contract-subject-prod',tenant:'tf-test-client',contract:'aci_contract-1-prod') do
  it { should exist }
  it { should be_reversePortFilter }
end
