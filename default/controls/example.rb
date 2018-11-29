# encoding: utf-8
# copyright: 2018, Brahm Lower

title 'Main tests'

dns_server = attribute('dns_server')

describe nslookup('brahmlower.io', dns_server) do
  it { should be_resolvable }
  its('stdout') { should include '35.241.16.140'}
end

describe nslookup('www.brahmlower.io', dns_server) do
  it { should be_resolvable }
  it { should be_cname }
  its('cname_for') { should eq 'brahmlower.io' }
end

describe nslookup('testing.brahmlower.io', dns_server) do
  it { should_not be_resolvable }
end