module WeatherWall
  class PropertyLoader
    attr_reader :filename
    attr_accessor :seperator
    
    def initialize(filename,seperator="::")
      @filename = filename
      @properties = Hash.new
      @seperator = seperator
      readFile
    end
    
    def readFile
      begin
        open(@filename).each do |line|
            key ,value = line.strip.split(@seperator)
            @properties[key.strip.to_sym] = value.strip
        end if File.file?(@filename) and File.readable?(@filename)
      rescue StandardError
        STDERR.puts "Error reading property file contents #{@filename}: #{$!}"
        raise
      end
    end
    
    def to_s
      @properties.to_s
    end
    
    def getProperty(key)
      @properties[key]
    end
    
    private :readFile
  end
end