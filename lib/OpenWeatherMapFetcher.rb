module WeatherWall
  require_relative 'APIFetcher'
  require_relative 'Utils'
  
  class OpenWeatherMapFetcher
    DATAMODE="json"
    DAYCNT="1"
    UNITS="metric"
    
    @lat
    @long
    @currentStats
    
    def initialize(api_endpoint,lat,long)
      @fetcher = APIFetcher.new(api_endpoint)
      @lat = lat
      @long = long
      @currentStats = Hash.new
    end
    
    def getResponse
      begin
        qs = Utils.hash_to_querystring({:lat=>@lat,:lon=>@long,:cnt=>DAYCNT,:mode=>DATAMODE,:units=>UNITS})
        response = @fetcher.fetchResponse(qs)
        Utils.jsonstr_to_hash(response)
      rescue StandardError
        STDERR.puts "Error getting response from fetcher: #{$!}"
        raise
      end
    end
    
    def fetchCurrentStats
      @currentStats =  getResponse
      return self
    end
    
    def getProperty(keysymbol)
      case keysymbol
        when :temp
          @currentStats["list"][0]["temp"]
        when :weather
          @currentStats["list"][0]["weather"][0]
        when :humidity
          @currentStats["list"][0]["humidity"]
        when :pressure
          @currentStats["list"][0]["pressure"]
        when :cloudiness
          @currentStats["list"][0]["clouds"]
      end
    end
    
    def to_s
      @currentStats.to_s
    end
    
    private :getResponse
  end
end