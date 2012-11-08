require 'spec_helper'

describe Easytobookr::Request do

  subject { request }

  context "without parameters" do
    let(:request) { Easytobookr::Request.new(:GetCityList) }
    its(:function_name) { should eql(:GetCityList)}
    its(:params) { should be_empty }
    its(:to_xml) { should eql(%{<?xml version="1.0"?>
<Easytobook>
  <Request target="test">
    <Authentication username="affiliate" password="affiliate">
      <Function>GetCityList</Function>
    </Authentication>
  </Request>
</Easytobook>
}) }
  end

  context "with parameters" do
    let(:request) { Easytobookr::Request.new(:GetCityInfo,{ :Cityid => 33 }) }
    its(:function_name) { should eql(:GetCityInfo)}
    its(:params) { should eql({ :Cityid => 33 }) }
    its(:to_xml) { should eql(%{<?xml version="1.0"?>
<Easytobook>
  <Request target="test">
    <Authentication username="affiliate" password="affiliate">
      <Function>GetCityInfo</Function>
    </Authentication>
    <Cityid>33</Cityid>
  </Request>
</Easytobook>
}) }
  end

end