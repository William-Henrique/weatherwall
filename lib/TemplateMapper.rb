module WeatherWall
  class TemplateMapper
    @text
    def initialize(templatefile)
      @text = readFile(templatefile)
    end
    
    def readFile(file)
      begin
        File.read(file) if File.file? file and File.readable? file
      rescue StandardError
        STDERR.puts "Failed to read template file #{file}: #{$!}"
        raise
      end
    end
    
    def templatereplace(kv)
      tmp = @text.clone
      kv.each_key do |key|
        tmp = tmp.sub(key, kv[key])
      end
      tmp
    end
    
    private :readFile
  end
end