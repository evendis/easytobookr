require 'uri'

class Easytobookr
  class Config
    attr_accessor :env
    attr_accessor :endpoint, :username, :password, :campaignid

    DEFAULTS = {
      :test => {
        :endpoint => 'http://testnl.etbxml.com/webservice/server_v21.php',
        :username => 'affiliate',
        :password => 'affiliate',
        :campaignid => '1'
      },
      :production => {
        :endpoint => 'https://www.etbxml.com/webservice/server_v21.php'
      }
    }.freeze

    def initialize
      self.env = :test
    end

    def env=(value)
      if (@env = value) == :production
        @endpoint = DEFAULTS[:production][:endpoint]
        @username = @password = @campaignid = nil
      else
        @endpoint = DEFAULTS[:test][:endpoint]
        @username ||= DEFAULTS[:test][:username]
        @password ||= DEFAULTS[:test][:password]
        @campaignid ||= DEFAULTS[:test][:campaignid]
      end
    end

    def uri
      URI.parse(endpoint)
    end
  end

  class << self
    def config
      @@config ||= Config.new
    end

    def setup(&block)
      block.call(config) if block_given?
    end
  end

end
