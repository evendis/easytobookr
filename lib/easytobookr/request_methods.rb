# These are a collection of convenience methods injected as Easytobookr class methods.
# These are low-level API requests that map 1-1 with the public API and return an Easytobookr::Request object
class Easytobookr

  class << self

    # Returns the request object for the {GetCityList}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetCityList] API call.
    def city_list
      Request.new(:GetCityList)
    end

    # Returns the request object for the {GetCityInfo}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetCityInfo] API call.
    def city_info(city_id)
      Request.new(:GetCityInfo, { :Cityid => city_id })
    end

    # Returns the request object for the {GetCityHotelList}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetCityHotelList] API call.
    def city_hotel_list(city_id,language=:en)
      Request.new(:GetCityHotelList, { :Cityid => city_id, :Language => language })
    end

    # Returns the request object for the {HotelInformationInCity}[http://www.etbxml.com/protocol/ApiFunctions.php?name=HotelInformationInCity] API call.
    def city_hotel_info(city_id,language=:en)
      Request.new(:HotelInformationInCity, { :Cityid => city_id, :Language => language })
    end

    # Returns the request object for the {GetHotelAvailability}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetHotelAvailability] API call.
    def hotel_availability(hotel_id,start_date,end_date,people=2,rooms=1,currency='USD',customer_ip='127.0.0.1',show_non_availability=false,language=:en)
      params = {
        :Hotelid => hotel_id, :Startdate => start_date, :Enddate => end_date, :Language => language,
        :Noofpersons => people,
        :Noofrooms => rooms,
        :Shownoavailrooms => show_non_availability ? 1 : 0,
        :Currency => currency, :CustomerIP => customer_ip
      }
      Request.new(:GetHotelAvailability, params)
    end

    # Returns the request object for the {SearchHotelCheapestRoomInCity}[http://www.etbxml.com/protocol/ApiFunctions.php?name=SearchHotelCheapestRoomInCity] API call.
    def city_cheapest_room_availability(city_id,start_date,end_date,people=2,currency='USD',customer_ip='127.0.0.1')
      params = {
        :Cityid => city_id, :Startdate => start_date, :Enddate => end_date,
        :Noofpersons => people,
        :Currency => currency, :CustomerIP => customer_ip
      }
      Request.new(:SearchHotelCheapestRoomInCity, params)
    end

    # Returns the request object for the {GetHotelPhotos}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetHotelPhotos] API call.
    def hotel_photos(hotel_id)
      Request.new(:GetHotelPhotos, { :Hotelid => hotel_id })
    end

    # Returns the request object for the {GetAllFacilities}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetAllFacilities] API call.
    def all_facilities(language=:en)
      Request.new(:GetAllFacilities, { :Language => language })
    end

    # Returns the request object for the {GetHotelFacilities}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetHotelFacilities] API call.
    def hotel_facilities(hotel_id,language=:en)
      Request.new(:GetHotelFacilities, { :Hotelid => hotel_id, :Language => language })
    end

    # Returns the request object for the {GetRoomFacilities}[http://www.etbxml.com/protocol/ApiFunctions.php?name=GetRoomFacilities] API call.
    def room_facilities(room_id,language=:en)
      Request.new(:GetRoomFacilities, { :Roomid => room_id, :Language => language })
    end

    # Returns the request object for the {SearchCityAvailability}[http://www.etbxml.com/protocol/ApiFunctions.php?name=SearchCityAvailability] API call.
    def city_availability(city_id,start_date,end_date,rating=nil,people=2,currency='USD',customer_ip='127.0.0.1',language=:en)
      params = {
        :Cityid => city_id, :Startdate => start_date, :Enddate => end_date,
        :Rating => rating,
        :Noofpersons => people,
        :Currency => currency, :CustomerIP => customer_ip,
        :Language => language
      }
      Request.new(:SearchCityAvailability, params)
    end

    # Command: returns the request object for the {CreateBooking}[http://www.etbxml.com/protocol/ApiFunctions.php?name=CreateBooking] API call.
    def create_booking
      raise "nyi"
    end

    # Command: returns the request object for the {CancelBooking}[http://www.etbxml.com/protocol/ApiFunctions.php?name=CancelBooking] API call.
    def cancel_booking
      raise "nyi"
    end

    # Returns the request object for the {RetrieveBooking}[http://www.etbxml.com/protocol/ApiFunctions.php?name=RetrieveBooking] API call.
    def retrieve_booking
      raise "nyi"
    end

  end

end