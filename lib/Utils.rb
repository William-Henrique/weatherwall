module WeatherWall
  class Utils
    require 'json'
    
    def self.hash_to_querystring(kvhash)
       '?'+kvhash.map{|k,v| "#{k}=#{v}"}.join('&')
    end
    
    def self.jsonstr_to_hash(string)
      JSON.parse(string)
    end
  end
end