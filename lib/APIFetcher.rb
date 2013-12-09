module WeatherWall
  class APIFetcher
    require 'uri'
    require 'open-uri'
    
    attr_accessor :endpoint
    
    def initialize(endpoint)
      @endpoint = endpoint
    end
    
    def fetchResponse(queryString)
      begin
        open(@endpoint + URI::encode(queryString)).read
      rescue StandardError
        STDERR.puts "Failed to download from endpoint #{@endpoint}: #{$!}"
        raise
      end
    end
  end
end