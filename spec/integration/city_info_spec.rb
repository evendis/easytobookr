require 'spec_helper'

describe "Easytobookr#city_info" do

  let(:city_id) { 26 }
  let(:city_info) { Easytobookr.city_info(city_id) }
  subject { city_info }
  it { should be_a(Easytobookr::Request) }
  describe "#response" do
    subject { city_info.response }
    it "should be a valid response" do
      should be_a(Nokogiri::XML::Document)
    end
  end

end