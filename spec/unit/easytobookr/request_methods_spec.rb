require 'spec_helper'

describe "Easytobookr request methods" do

  subject { response }

  describe "##city_list" do
    let(:response) { Easytobookr.city_list.response }
    let(:api_response) { response_example(:city_list) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///City').count.should eql(38) }
  end

  describe "##city_info" do
    let(:response) { Easytobookr.city_info(26).response }
    let(:api_response) { response_example(:city_info) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Cityinfo').count.should eql(1) }
  end

  describe "##city_hotel_list" do
    let(:response) { Easytobookr.city_hotel_list(26).response }
    let(:api_response) { response_example(:city_hotel_list) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Hotel').count.should eql(362) }
  end

  describe "##city_hotel_info" do
    let(:response) { Easytobookr.city_hotel_info(26).response }
    let(:api_response) { response_example(:city_hotel_info) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Hotel').count.should eql(362) }
  end

  describe "##hotel_availability" do
    let(:response) { Easytobookr.hotel_availability(7844,'2012-12-01','2012-12-03').response }
    let(:api_response) { response_example(:hotel_availability) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Hotelinfo').count.should eql(1) }
  end

  describe "##city_cheapest_room_availability" do
    let(:response) { Easytobookr.city_cheapest_room_availability(26,'2012-12-01','2012-12-03').response }
    let(:api_response) { response_example(:city_cheapest_room_availability) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Hotel').count.should eql(162) }
  end

  describe "##hotel_photos" do
    let(:response) { Easytobookr.hotel_photos(7844).response }
    let(:api_response) { response_example(:hotel_photos) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Photos/Image').count.should eql(4) }
  end

  describe "##all_facilities" do
    let(:response) { Easytobookr.all_facilities.response }
    let(:api_response) { response_example(:all_facilities) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Facilities/Facility').count.should eql(263) }
  end

  describe "##hotel_facilities" do
    let(:response) { Easytobookr.hotel_facilities(7844).response }
    let(:api_response) { response_example(:hotel_facilities) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Facilities/Facility').count.should eql(7) }
  end

  describe "##room_facilities" do
    let(:response) { Easytobookr.room_facilities(1001).response }
    let(:api_response) { response_example(:room_facilities) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Facilities/Facility').count.should eql(17) }
  end

  describe "##city_availability" do
    let(:response) { Easytobookr.city_availability(26,'2012-12-01','2012-12-03').response }
    let(:api_response) { response_example(:city_availability) }
    before do
      Net::HTTP.any_instance.stub(:post).and_return(api_response)
    end
    it { should be_a(Nokogiri::XML::Document) }
    it { subject.root.name.should eql("EasytobookResponse") }
    it { subject.xpath('///Hotelinfo/Hotel').count.should eql(212) }
  end

end
