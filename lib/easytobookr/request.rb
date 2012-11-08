require 'net/http'

class Easytobookr::Request
  attr_accessor :function_name, :params

  def initialize(function_name,params={})
    @function_name = function_name
    @params = params
  end

  def to_xml
    request_builder.to_xml
  end

  def response
    http = Net::HTTP.new(uri.host,uri.port)
    response = http.post(uri.path,self.to_xml)
    Nokogiri.XML(response.body)
  end

  def request_builder
    Nokogiri::XML::Builder.new do |xml|
      xml.Easytobook {
        xml.Request(:target => config.env) {
          xml.Authentication(:username => config.username, :password => config.password) {
            xml.Function self.function_name
          }
          params.each {|key,value| xml.send(key,value) } if params
        }
      }
    end
  end
  protected :request_builder

  # Convenience method to returns the common config.
  def config
    Easytobookr.config
  end

  # Convenience method to returns the endpoint uri.
  def uri
    config.uri
  end

end