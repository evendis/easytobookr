require 'spec_helper'

describe Easytobookr do

  describe "##config" do
    subject { Easytobookr.config }
    it { should be_a(Easytobookr::Config) }
  end

  describe "##setup" do
    subject { Easytobookr.config }
    context "when accept all :test env defaults" do
      before do
        Easytobookr.setup do |config|
          config.env = :test
        end
      end
      its(:env) { should eql(:test) }
      its(:endpoint) { should eql('http://testnl.etbxml.com/webservice/server_v21.php') }
      its(:username) { should eql('affiliate') }
      its(:password) { should eql('affiliate') }
      its(:campaignid) { should eql('1') }
    end
    context "when accept all :production env defaults" do
      before do
        Easytobookr.setup do |config|
          config.env = :production
        end
      end
      its(:env)  { should eql(:production) }
      its(:endpoint) { should eql('https://www.etbxml.com/webservice/server_v21.php') }
      its(:username) { should be_nil }
      its(:password) { should be_nil }
      its(:campaignid) { should be_nil }
    end
    context "when all options explicitly set" do
      before do
        Easytobookr.setup do |config|
          config.env = :production
          config.endpoint = 'http://someehere.else.com'
          config.username = 'my_uid'
          config.password = 'my_pwd'
          config.campaignid = '33'
        end
      end
      its(:env) { should eql(:production) }
      its(:endpoint) { should eql('http://someehere.else.com') }
      its(:username) { should eql('my_uid') }
      its(:password) { should eql('my_pwd') }
      its(:campaignid) { should eql('33') }
    end
  end

end