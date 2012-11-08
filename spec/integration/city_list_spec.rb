require 'spec_helper'

describe "Easytobookr#city_list" do

  let(:city_list) { Easytobookr.city_list }
  subject {city_list }
  it { should be_a(Easytobookr::Request) }
  describe "#response" do
    subject { city_list.response }
    it "should be a valid response" do
      should be_a(Nokogiri::XML::Document)
    end
  end

end