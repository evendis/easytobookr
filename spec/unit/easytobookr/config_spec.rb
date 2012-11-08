require 'spec_helper'

describe Easytobookr::Config do

  let(:config) { Easytobookr::Config.new }
  subject { config }
  describe "#env" do
    context "when default (:test)" do
      its(:env) { should eql(:test) }
      its(:endpoint) { should eql('http://testnl.etbxml.com/webservice/server_v21.php') }
      its(:username) { should eql('affiliate') }
      its(:password) { should eql('affiliate') }
      its(:campaignid) { should eql('1') }
      its(:uri) { should be_a(URI) }
    end
    context "when production" do
      before { config.env = :production }
      its(:env)  { should eql(:production) }
      its(:endpoint) { should eql('https://www.etbxml.com/webservice/server_v21.php') }
      its(:username) { should be_nil }
      its(:password) { should be_nil }
      its(:campaignid) { should be_nil }
      its(:uri) { should be_a(URI) }
    end
  end

end